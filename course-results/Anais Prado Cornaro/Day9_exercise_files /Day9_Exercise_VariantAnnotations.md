# Part 1: sample A

## Variant 1 (low impact)
__I chose a varinat on chr14 at position: chr14:52’768’827__

* __The variant type:__ 
    * _SNP_
* __The REF and ALT alleles:__
    *  reference alleles: _A*_
    *  alternative alleles: 
        * _T_
        * deletion
* __The genotype:__
    * _T/T_
* __The exact read count supporting the REF and ALT alleles:__
    * _reference (A): is supported by 0 reads_
    * _allele 1 (T): is supported by 16 (100%) reads_
    * _allele 2 (del): is supported by 1 read_
* __A screenshot of the variant captured from IGV:__

<img title="IVG Screenshot for Variant 1 in Sample A" src="SampleA_Var1_IGV.png">

## Variant 2 (moderate impact)
__I chose a varinat on chr14 at position: chr14:19’827’675__

* __The variant type:__
    * _HET_
* __The REF and ALT alleles:__
    *  reference alleles: _T*_
    *  alternative allele: _C_
* __The genotype:__
    * _T/C_
* __The exact read count supporting the REF and ALT alleles:__
    * _reference (T): is supported by 34 (52%) reads_
    * _ALT allele (C): is supported by 32 (48%) reads_
* __A screenshot of the variant captured from IGV:__

<img title="IVG Screenshot for Variant 2 in Sample A" src="SampleA_Var2_IGV.png">


# IGV structural varinat analysis

## chr1: 37350877 - 37351115
* __type of structural variant:__
    * _When zooming out of the given sequence, one can clearly see that there is region (~ 250bps), where there is very low read coverage, when reads are mapped to the reference_
     * _This indicates taht there is a deletion_
    * _In addition to that, there are many red colored reads ligning "the border", which indicates that they ar e"abnormally" large read sizes, which also hints to a deletion, as the read len (when using refernce coordinates) is way larger then it actally is, hence abnormal. This one can see better in the second image_

* __IGV screenshot confirming the event:__
<img title="IVG Screenshot for structural variant at chr1: 41369871" src="structural_variant_chr1_37350877-37351115_1.png">
<img title="IVG Screenshot for structural variant at chr1: 41369871" src="structural_variant_chr1_37350877-37351115_2.png">

## chr1: 41369871 - 41369871
* __type of structural variant:__
    * _the variant is a insertion of C (confirmed by a single read)_

* __IGV screenshot confirming the event:__
<img title="IVG Screenshot for structural variant at chr1: 41369871" src="structural_variant_chr1_41369871.png">

## chr2: 117564013 - 117572037
* __type of structural variant:__
    * _I think this is a duplication_
    * _On the top one can see a group of reads, colored green, which implies duplication_
    * _In addition (when using the option "group by pair orientation") we see that the green pairs have an RL orientation,w hich also implies duplication_
* __IGV screenshot confirming the event:__
<img title="IVG Screenshot for structural variant at chr1: 41369871" src="structural_varaint_chr2_117564013-117572037.png">
