#!/usr/bin/env python3
# =============================================================================
# STR Population Structure Analysis Pipeline
# Input  : CSV file (rows=STR loci, cols=samples, values=mean allele length)
# Steps  : 1. Load & transpose
#           2. Fetch population labels (1000 Genomes)
#           3. Filtering (missingness, variance)
#           4. PCA
#           5. Clustering (K-Means + hierarchical)
#           6. Supervised classification (Random Forest)
#           7. Plots
#
# Run with: python3 str_pipeline.py
# =============================================================================

import os
import sys
import numpy as np
import pandas as pd
import matplotlib
matplotlib.use("Agg")  # non-interactive backend for cluster
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import seaborn as sns

from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA
from sklearn.cluster import KMeans
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import StratifiedKFold, cross_val_score
from sklearn.metrics import classification_report, confusion_matrix
from scipy.cluster.hierarchy import dendrogram, linkage, fcluster
from scipy.spatial.distance import pdist

# =============================================================================
# 0. CONFIGURATION — edit these
# =============================================================================

CSV_FILE   = kg_matrix_chr1.csv  # ← path to your STR CSV on the cluster
OUTDIR     = "C:\Users\belin\OneDrive\Uni\FS26\Bio392\notebook\2026_04_30\results"
PANEL_URL  = "https://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/integrated_call_samples_v3.20200731.ALL.ped"

# Filtering thresholds
MAX_MISSING_PER_STR    = 0.10   # drop STRs missing in >10% of samples
MAX_MISSING_PER_SAMPLE = 0.10   # drop samples missing >10% of STRs
MIN_VARIANCE           = 0.01   # drop near-constant STRs (std < this threshold)

# PCA
N_PCS = 20

# K-Means
K_RANGE = range(2, 11)          # test K=2 to K=10

# Random Forest
N_TREES    = 500
CV_FOLDS   = 5
TARGET_LEVEL = "super_pop"      # "super_pop" (5 groups) or "pop" (26 groups)

# =============================================================================
# 1. SETUP
# =============================================================================

os.makedirs(OUTDIR, exist_ok=True)
plot_dir = os.path.join(OUTDIR, "plots")
os.makedirs(plot_dir, exist_ok=True)

print("=" * 55)
print(" STR Population Structure Pipeline")
print("=" * 55)

# =============================================================================
# 2. LOAD & TRANSPOSE CSV
# =============================================================================

print("\n[STEP 1] Loading STR data...")
raw = pd.read_csv(CSV_FILE, index_col=0)
print(f"  Raw shape (STRs × samples): {raw.shape}")

# Transpose so rows=samples, columns=STRs
df = raw.T
df.index.name = "sample_id"
print(f"  Transposed shape (samples × STRs): {df.shape}")

# Replace any 0s or implausible values with NaN (0 = likely missing in STR data)
df.replace(0, np.nan, inplace=True)

# =============================================================================
# 3. FETCH POPULATION LABELS FROM 1000 GENOMES PANEL FILE
# =============================================================================

print("\n[STEP 2] Fetching population labels...")

try:
    panel = pd.read_csv(PANEL_URL, sep="\t", usecols=["Individual ID", "Population", "Super Population"])
    panel.columns = ["sample_id", "pop", "super_pop"]
    panel.set_index("sample_id", inplace=True)
    print(f"  Panel loaded: {len(panel)} samples")
except Exception as e:
    print(f"  WARNING: Could not fetch panel file ({e})")
    print("  Proceeding without population labels — plots will be unlabelled.")
    panel = pd.DataFrame(columns=["pop", "super_pop"])

# Merge labels with our samples
df = df.join(panel, how="left")
pop_cols  = ["pop", "super_pop"]
str_cols  = [c for c in df.columns if c not in pop_cols]

missing_labels = df["super_pop"].isna().sum()
if missing_labels > 0:
    print(f"  WARNING: {missing_labels} samples have no population label — they will be labelled 'Unknown'")
    df["super_pop"].fillna("Unknown", inplace=True)
    df["pop"].fillna("Unknown", inplace=True)

print(f"  Super-populations found: {sorted(df['super_pop'].unique())}")

# =============================================================================
# 4. FILTERING
# =============================================================================

print("\n[STEP 3] Filtering...")

X = df[str_cols].copy()

# 4a. Drop STRs with too much missingness (column-wise)
str_missing = X.isna().mean(axis=0)
keep_strs = str_missing[str_missing <= MAX_MISSING_PER_STR].index
print(f"  STRs before missingness filter : {X.shape[1]}")
X = X[keep_strs]
print(f"  STRs after  missingness filter : {X.shape[1]}  (dropped {X.shape[1] - len(keep_strs)} — threshold {MAX_MISSING_PER_STR*100:.0f}%)")

# 4b. Drop samples with too much missingness (row-wise)
sample_missing = X.isna().mean(axis=1)
keep_samples = sample_missing[sample_missing <= MAX_MISSING_PER_SAMPLE].index
n_before = X.shape[0]
X = X.loc[keep_samples]
df = df.loc[keep_samples]
print(f"  Samples before missingness filter: {n_before}")
print(f"  Samples after  missingness filter: {X.shape[0]}")

# 4c. Impute remaining NaNs with column median (STR mean allele length)
X = X.fillna(X.median())

# 4d. Drop near-constant STRs (low variance adds no population signal)
std_per_str = X.std()
keep_var = std_per_str[std_per_str >= MIN_VARIANCE].index
print(f"  STRs before variance filter: {X.shape[1]}")
X = X[keep_var]
print(f"  STRs after  variance filter: {X.shape[1]}  (dropped low-variance STRs with std < {MIN_VARIANCE})")

print(f"\n  Final dataset: {X.shape[0]} samples × {X.shape[1]} STRs")

# Save filtered matrix
X.to_csv(os.path.join(OUTDIR, "str_filtered.csv"))
print(f"  Saved: str_filtered.csv")

# =============================================================================
# 5. PCA
# =============================================================================

print(f"\n[STEP 4] PCA ({N_PCS} components)...")

scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

pca = PCA(n_components=N_PCS, random_state=42)
pcs = pca.fit_transform(X_scaled)

pct_var = pca.explained_variance_ratio_ * 100
pc_df = pd.DataFrame(pcs, index=X.index, columns=[f"PC{i+1}" for i in range(N_PCS)])
pc_df = pc_df.join(df[pop_cols])

print(f"  PC1: {pct_var[0]:.2f}%  PC2: {pct_var[1]:.2f}%  PC3: {pct_var[2]:.2f}%")

pc_df.to_csv(os.path.join(OUTDIR, "pca_results.csv"))

# ── PCA plots ─────────────────────────────────────────────────────────────────
SUPER_POP_COLORS = {
    "AFR": "#E41A1C", "AMR": "#FF7F00", "EAS": "#4DAF4A",
    "EUR": "#377EB8", "SAS": "#984EA3", "Unknown": "#999999"
}

def pca_scatter(pc_df, pcx, pcy, color_by, title, fname):
    fig, ax = plt.subplots(figsize=(9, 7))
    groups = pc_df[color_by].unique()
    for grp in sorted(groups):
        mask = pc_df[color_by] == grp
        color = SUPER_POP_COLORS.get(grp, None)
        ax.scatter(pc_df.loc[mask, pcx], pc_df.loc[mask, pcy],
                   label=grp, s=15, alpha=0.7, color=color)
    xi = int(pcx[2:]) - 1
    yi = int(pcy[2:]) - 1
    ax.set_xlabel(f"{pcx} ({pct_var[xi]:.2f}%)", fontsize=12)
    ax.set_ylabel(f"{pcy} ({pct_var[yi]:.2f}%)", fontsize=12)
    ax.set_title(title, fontsize=13)
    ax.legend(markerscale=2, bbox_to_anchor=(1.01, 1), loc="upper left", fontsize=9)
    plt.tight_layout()
    plt.savefig(os.path.join(plot_dir, fname), dpi=200, bbox_inches="tight")
    plt.close()
    print(f"  Saved: {fname}")

pca_scatter(pc_df, "PC1", "PC2", "super_pop",
            "STR PCA — PC1 vs PC2 (by super-population)", "PCA_PC1_PC2.png")
pca_scatter(pc_df, "PC3", "PC4", "super_pop",
            "STR PCA — PC3 vs PC4 (by super-population)", "PCA_PC3_PC4.png")

# Scree plot
fig, ax = plt.subplots(figsize=(8, 5))
ax.bar(range(1, N_PCS+1), pct_var, color="#4E79A7")
ax.plot(range(1, N_PCS+1), pct_var, "ko-", markersize=4)
ax.set_xlabel("Principal Component")
ax.set_ylabel("% Variance Explained")
ax.set_title("Scree Plot — STR PCA")
ax.set_xticks(range(1, N_PCS+1))
plt.tight_layout()
plt.savefig(os.path.join(plot_dir, "PCA_scree.png"), dpi=200)
plt.close()
print("  Saved: PCA_scree.png")

# =============================================================================
# 6. CLUSTERING
# =============================================================================

print("\n[STEP 5] Clustering...")

# Use first 10 PCs for clustering (captures most variance, reduces noise)
pcs_for_clust = pcs[:, :10]

# ── 6a. K-Means with elbow + silhouette ──────────────────────────────────────
from sklearn.metrics import silhouette_score

inertias    = []
silhouettes = []

for k in K_RANGE:
    km = KMeans(n_clusters=k, n_init=10, random_state=42)
    labels = km.fit_predict(pcs_for_clust)
    inertias.append(km.inertia_)
    sil = silhouette_score(pcs_for_clust, labels)
    silhouettes.append(sil)
    print(f"  K={k}  inertia={km.inertia_:.1f}  silhouette={sil:.4f}")

best_k = list(K_RANGE)[np.argmax(silhouettes)]
print(f"  Best K by silhouette: {best_k}")

# Final K-Means with best K
km_best = KMeans(n_clusters=best_k, n_init=10, random_state=42)
km_labels = km_best.fit_predict(pcs_for_clust)
pc_df["kmeans_cluster"] = [f"C{l+1}" for l in km_labels]

# Elbow + silhouette plot
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 5))
ax1.plot(list(K_RANGE), inertias, "bo-")
ax1.set_xlabel("K"); ax1.set_ylabel("Inertia (within-cluster SS)")
ax1.set_title("K-Means Elbow Plot"); ax1.set_xticks(list(K_RANGE))
ax2.plot(list(K_RANGE), silhouettes, "ro-")
ax2.axvline(best_k, color="gray", linestyle="--", label=f"Best K={best_k}")
ax2.set_xlabel("K"); ax2.set_ylabel("Silhouette Score")
ax2.set_title("Silhouette Score by K"); ax2.set_xticks(list(K_RANGE)); ax2.legend()
plt.suptitle("K-Means Clustering — STR Data", fontsize=13)
plt.tight_layout()
plt.savefig(os.path.join(plot_dir, "clustering_kmeans_elbow.png"), dpi=200)
plt.close()
print("  Saved: clustering_kmeans_elbow.png")

# PCA coloured by K-Means cluster
pca_scatter(pc_df, "PC1", "PC2", "kmeans_cluster",
            f"PCA — K-Means clusters (K={best_k})", "PCA_kmeans_clusters.png")

# ── 6b. Hierarchical clustering ───────────────────────────────────────────────
print("  Running hierarchical clustering (Ward linkage)...")
Z = linkage(pcs_for_clust, method="ward")

fig, ax = plt.subplots(figsize=(14, 5))
dendrogram(Z, ax=ax, labels=pc_df["super_pop"].values,
           leaf_rotation=90, leaf_font_size=4,
           color_threshold=0.7 * max(Z[:, 2]))
ax.set_title("Hierarchical Clustering Dendrogram — STR Data (Ward)")
ax.set_ylabel("Distance")
plt.tight_layout()
plt.savefig(os.path.join(plot_dir, "clustering_dendrogram.png"), dpi=200, bbox_inches="tight")
plt.close()
print("  Saved: clustering_dendrogram.png")

# Save cluster assignments
pc_df.to_csv(os.path.join(OUTDIR, "pca_and_clusters.csv"))

# =============================================================================
# 7. SUPERVISED CLASSIFICATION (Random Forest)
# =============================================================================

print(f"\n[STEP 6] Supervised classification (Random Forest, target={TARGET_LEVEL})...")

y = df.loc[X.index, TARGET_LEVEL]
valid = y != "Unknown"
X_clf = pcs[valid, :10]   # use top 10 PCs as features
y_clf = y[valid].values

print(f"  Samples for classification: {X_clf.shape[0]}")
print(f"  Classes: {sorted(np.unique(y_clf))}")

rf = RandomForestClassifier(n_estimators=N_TREES, random_state=42, n_jobs=-1)

cv = StratifiedKFold(n_splits=CV_FOLDS, shuffle=True, random_state=42)
cv_scores = cross_val_score(rf, X_clf, y_clf, cv=cv, scoring="accuracy")
print(f"  {CV_FOLDS}-fold CV accuracy: {cv_scores.mean():.4f} ± {cv_scores.std():.4f}")

# Fit on all data for feature importances + confusion matrix
rf.fit(X_clf, y_clf)
y_pred = rf.predict(X_clf)

print("\n  Classification report (train set):")
print(classification_report(y_clf, y_pred))

# Confusion matrix
cm = confusion_matrix(y_clf, y_pred, labels=sorted(np.unique(y_clf)))
fig, ax = plt.subplots(figsize=(8, 6))
sns.heatmap(cm, annot=True, fmt="d", cmap="Blues",
            xticklabels=sorted(np.unique(y_clf)),
            yticklabels=sorted(np.unique(y_clf)), ax=ax)
ax.set_xlabel("Predicted"); ax.set_ylabel("True")
ax.set_title(f"Random Forest Confusion Matrix\n(target={TARGET_LEVEL}, CV acc={cv_scores.mean():.3f})")
plt.tight_layout()
plt.savefig(os.path.join(plot_dir, "RF_confusion_matrix.png"), dpi=200)
plt.close()
print("  Saved: RF_confusion_matrix.png")

# Feature importances (top 10 PCs)
fi = pd.Series(rf.feature_importances_, index=[f"PC{i+1}" for i in range(10)])
fig, ax = plt.subplots(figsize=(7, 4))
fi.sort_values(ascending=True).plot.barh(ax=ax, color="#4E79A7")
ax.set_title("Random Forest Feature Importances (PCs)")
ax.set_xlabel("Importance")
plt.tight_layout()
plt.savefig(os.path.join(plot_dir, "RF_feature_importance.png"), dpi=200)
plt.close()
print("  Saved: RF_feature_importance.png")

# Save CV scores
pd.DataFrame({"fold": range(1, CV_FOLDS+1), "accuracy": cv_scores}).to_csv(
    os.path.join(OUTDIR, "RF_cv_scores.csv"), index=False)

# =============================================================================
# DONE
# =============================================================================

print("\n" + "=" * 55)
print(" Pipeline complete!")
print(f" All outputs in: {OUTDIR}")
print(" Plots:")
for f in sorted(os.listdir(plot_dir)):
    print(f"   {f}")
print("=" * 55)
