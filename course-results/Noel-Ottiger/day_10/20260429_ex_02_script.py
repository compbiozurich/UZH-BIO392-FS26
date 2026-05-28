#!/usr/bin/env python3
"""
UZH BIO392 - Exercise 2
Population structure analysis using STRs (one chromosome).

Workflow: CSV -> filtering -> PCA -> clustering -> supervised classification
"""

import argparse
from pathlib import Path

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler, LabelEncoder
from sklearn.impute import SimpleImputer
from sklearn.cluster import KMeans, AgglomerativeClustering
from sklearn.metrics import (
    adjusted_rand_score,
    normalized_mutual_info_score,
    silhouette_score,
    classification_report,
    confusion_matrix,
)
from sklearn.model_selection import StratifiedKFold, cross_val_score, train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.svm import SVC
from sklearn.pipeline import Pipeline


# -----------------------------------------------------------------------------
# 1. Load and orient the STR matrix
# -----------------------------------------------------------------------------
def load_str_csv(path):
    """Load STR CSV. Auto-detect orientation. Return (samples x loci) numeric DataFrame.

    Handles the kg_matrix_chrN.csv layout where:
    - The first (unnamed) column is the integer locus index.
    - Sample IDs (HG..., NA...) are column headers.
    - Cells are already numeric (sum or mean of two allele lengths).
    """
    df = pd.read_csv(path, low_memory=False, index_col=0)
    print(f"  Raw shape (rows x cols): {df.shape}")
    print(f"  First 3 column names:    {list(df.columns[:3])}")
    print(f"  First 3 row labels:      {list(df.index[:3])}")

    def looks_like_1kg(values, n=20):
        sample = [str(v) for v in list(values)[:n]]
        hits = sum(1 for v in sample if v.startswith(("HG", "NA")))
        return hits / max(len(sample), 1) > 0.5

    cols_are_samples = looks_like_1kg(df.columns)
    rows_are_samples = looks_like_1kg(df.index)

    if cols_are_samples and not rows_are_samples:
        print("  Samples are COLUMNS, loci are ROWS -> transposing")
        df = df.T
    elif rows_are_samples and not cols_are_samples:
        print("  Samples are ROWS, loci are COLUMNS -> keeping as is")
    else:
        print(f"  WARNING: orientation unclear "
              f"(cols look like samples: {cols_are_samples}, "
              f"rows look like samples: {rows_are_samples}). Keeping as is.")

    print(f"  Final shape: {df.shape[0]} samples x {df.shape[1]} loci")

    # Coerce to numeric; '23.0', '23.5' parse directly. Anything weird becomes NaN.
    df_num = df.apply(pd.to_numeric, errors="coerce")
    n_nan = df_num.isna().sum().sum()
    n_total = df_num.size
    print(f"  NaN cells: {n_nan} / {n_total} ({100*n_nan/max(n_total,1):.2f} %)")
    return df_num


# -----------------------------------------------------------------------------
# 2. Filtering
# -----------------------------------------------------------------------------
def filter_loci(X, max_missing=0.10, min_variance=1e-6):
    """Drop loci with too much missingness or near-zero variance."""
    miss_rate = X.isna().mean(axis=0)
    keep_miss = miss_rate <= max_missing

    var = X.var(axis=0, skipna=True)
    keep_var = var > min_variance

    keep = keep_miss & keep_var
    print(f"  Loci before filter: {X.shape[1]}")
    print(f"    drop missingness > {max_missing}: {(~keep_miss).sum()}")
    print(f"    drop variance <= {min_variance}: {(~keep_var).sum()}")
    print(f"  Loci after filter:  {keep.sum()}")
    return X.loc[:, keep]


# -----------------------------------------------------------------------------
# 3. Population labels (from 1000 Genomes panel)
# -----------------------------------------------------------------------------
def load_panel(panel_path):
    panel = pd.read_csv(panel_path, sep="\t")
    panel = panel.rename(columns={panel.columns[0]: "sample"})
    return panel.set_index("sample")[["pop", "super_pop"]]


# -----------------------------------------------------------------------------
# 4. Main pipeline
# -----------------------------------------------------------------------------
def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--csv", required=True, help="STR genotype CSV (one chromosome)")
    ap.add_argument("--panel", required=True,
                    help="1000G panel file: integrated_call_samples_v3.20130502.ALL.panel")
    ap.add_argument("--outdir", default="popstruct_str_out")
    ap.add_argument("--max-missing", type=float, default=0.10)
    ap.add_argument("--n-pcs", type=int, default=10)
    ap.add_argument("--seed", type=int, default=42)
    args = ap.parse_args()

    out = Path(args.outdir)
    out.mkdir(parents=True, exist_ok=True)

    # ---- Load -----------------------------------------------------------
    print("[1/6] Loading STR CSV...")
    X = load_str_csv(args.csv)

    print("[2/6] Loading sample panel...")
    panel = load_panel(args.panel)
    common = X.index.intersection(panel.index)
    print(f"  Samples in CSV:      {X.shape[0]}")
    print(f"  Samples in panel:    {panel.shape[0]}")
    print(f"  Samples with labels: {len(common)}")
    if len(common) == 0:
        raise SystemExit("No overlapping samples between CSV and panel. "
                         "Check that sample IDs in the CSV match the 1000G panel.")
    X = X.loc[common]
    y_pop = panel.loc[common, "pop"]
    y_super = panel.loc[common, "super_pop"]

    # ---- Filter ---------------------------------------------------------
    print("[3/6] Filtering loci...")
    X = filter_loci(X, max_missing=args.max_missing)

    print("  Imputing missing genotypes (median) and standardising...")
    imputer = SimpleImputer(strategy="median")
    scaler = StandardScaler()
    X_imp = imputer.fit_transform(X.values)
    X_std = scaler.fit_transform(X_imp)

    # ---- PCA ------------------------------------------------------------
    print(f"[4/6] PCA ({args.n_pcs} components)...")
    pca = PCA(n_components=args.n_pcs, random_state=args.seed)
    PCs = pca.fit_transform(X_std)
    print(f"  Variance explained (top {args.n_pcs}): "
          f"{pca.explained_variance_ratio_.round(3).tolist()}")
    print(f"  Cumulative: {pca.explained_variance_ratio_.cumsum().round(3).tolist()}")

    pc_df = pd.DataFrame(PCs, index=X.index,
                         columns=[f"PC{i+1}" for i in range(args.n_pcs)])
    pc_df["pop"] = y_pop.values
    pc_df["super_pop"] = y_super.values
    pc_df.to_csv(out / "pca_str.tsv", sep="\t")

    fig, ax = plt.subplots(figsize=(7, 6))
    sns.scatterplot(data=pc_df, x="PC1", y="PC2", hue="super_pop",
                    s=20, alpha=0.8, ax=ax)
    ax.set_title("STR PCA - 1000 Genomes (1 chromosome)")
    ax.set_xlabel(f"PC1 ({pca.explained_variance_ratio_[0]*100:.1f} %)")
    ax.set_ylabel(f"PC2 ({pca.explained_variance_ratio_[1]*100:.1f} %)")
    plt.tight_layout()
    plt.savefig(out / "pca_str_pc1_pc2.png", dpi=200)
    plt.close()

    # ---- Clustering -----------------------------------------------------
    print("[5/6] Unsupervised clustering on top PCs...")
    K = y_super.nunique()
    print(f"  Using K = {K} (number of super-populations in panel)")

    km = KMeans(n_clusters=K, n_init="auto", random_state=args.seed)
    km_labels = km.fit_predict(PCs)

    hc = AgglomerativeClustering(n_clusters=K, linkage="ward")
    hc_labels = hc.fit_predict(PCs)

    le = LabelEncoder()
    y_super_int = le.fit_transform(y_super)

    print(f"  K-means        ARI = {adjusted_rand_score(y_super_int, km_labels):.3f}, "
          f"NMI = {normalized_mutual_info_score(y_super_int, km_labels):.3f}, "
          f"silhouette = {silhouette_score(PCs, km_labels):.3f}")
    print(f"  Ward hierarch. ARI = {adjusted_rand_score(y_super_int, hc_labels):.3f}, "
          f"NMI = {normalized_mutual_info_score(y_super_int, hc_labels):.3f}, "
          f"silhouette = {silhouette_score(PCs, hc_labels):.3f}")

    pd.DataFrame({"sample": X.index, "true_super_pop": y_super.values,
                  "kmeans": km_labels, "ward": hc_labels})\
        .to_csv(out / "clustering.tsv", sep="\t", index=False)

    # ---- Supervised classification --------------------------------------
    print("[6/6] Supervised classification (5-fold stratified CV)...")
    classifiers = {
        "RandomForest": RandomForestClassifier(
            n_estimators=500, n_jobs=-1, random_state=args.seed),
        "SVM_RBF": Pipeline([
            ("scaler", StandardScaler()),
            ("svc", SVC(kernel="rbf", C=1.0, gamma="scale", random_state=args.seed)),
        ]),
    }

    cv = StratifiedKFold(n_splits=5, shuffle=True, random_state=args.seed)

    X_feat = X_std
    y_target = y_super.values   # super-population (5 classes)

    for name, clf in classifiers.items():
        scores = cross_val_score(clf, X_feat, y_target,
                                 cv=cv, scoring="f1_macro", n_jobs=-1)
        print(f"  {name:12s} F1 macro = {scores.mean():.3f} +/- {scores.std():.3f}")

    print("\n  Final RandomForest fit (whole dataset, train/test 80/20)...")
    X_tr, X_te, y_tr, y_te = train_test_split(
        X_feat, y_target, test_size=0.2, stratify=y_target, random_state=args.seed)
    rf = RandomForestClassifier(n_estimators=500, n_jobs=-1, random_state=args.seed)
    rf.fit(X_tr, y_tr)
    y_pred = rf.predict(X_te)
    print(classification_report(y_te, y_pred))

    labels_sorted = sorted(np.unique(y_target))
    cm = confusion_matrix(y_te, y_pred, labels=labels_sorted)
    fig, ax = plt.subplots(figsize=(6, 5))
    sns.heatmap(cm, annot=True, fmt="d", cmap="Blues",
                xticklabels=labels_sorted,
                yticklabels=labels_sorted, ax=ax)
    ax.set_xlabel("Predicted super-population")
    ax.set_ylabel("True super-population")
    ax.set_title("Random Forest - confusion matrix (held-out 20 %)")
    plt.tight_layout()
    plt.savefig(out / "rf_confusion_matrix.png", dpi=200)
    plt.close()

    imp = pd.Series(rf.feature_importances_, index=X.columns)\
            .sort_values(ascending=False)
    imp.head(50).to_csv(out / "rf_top50_loci.tsv", sep="\t",
                        header=["importance"])
    print(f"\n  Top 5 most informative STR loci:")
    for locus, score in imp.head(5).items():
        print(f"    {locus}: {score:.4f}")

    print(f"\nDone. Outputs in: {out.resolve()}")


if __name__ == "__main__":
    main()
