This repository contains the scripts, tutorials, and templates for the Rich Lab's mainstream bioinformatic workflows. You can find some of the current recommended tutorial versions of these workflows linked below.

# Tutorial Options

##  [`metadata_setup`](https://rich-molecular-health-lab.github.io/tutorials/metadata_setup.html)

- The purpose of a metadata file is to organize the potential independent or predictor variables for your analysis into a single table with one row per `SampleID.` Then, when you produce a set of potential dependent or outcome values, you organize those into a similar structure with the `SampleIDs` organized rowwise to streamline the process of matching predictor variables to outcome variables by `SampleID.`

- It's good practice to keep as much of your information in one tidy table as possible so that you can keep pulling from that source to further filter, wrangle and analyze without losing track of different versions and datasets over time. 

- That means you should brainstorm as many possible predictor variables you might use in downstream analysis as possible and organize them into one tidy table where each SampleID is matched to a value for every variable. *You will end up ignoring most of these variables as you construct individual tests and visuals later, so consider this simply a rough draft of your information of interest.*

- This tutorial uses the Pygmy Loris dataset as an example. You may have a very different set of variables to organize for your own project.

### Files Needed

1.  `compilation_loris.tsv` - [*produced by the `sample_inventory` script*](https://rich-molecular-health-lab.github.io/tutorials/sample_inventory.html)
2.  **All other files depend on your specific variables of interest**
   - *Mine mostly focus on diet trials and environmental context for the Pygmy Loris subjects*
   
### Files Produced

1.  `samples_metadata.tsv` - This file gets carried forward on several other scripts in this repository to help you build consistent predictor variables across datasets.

##  [`microbiome_alignments.html`](https://rich-molecular-health-lab.github.io/tutorials/microbiome_alignments.html)

- Follow this tutorial to take new raw read alignment data produced by Epi2ME Lab's `wf-16s` pipeline and convert it into fully formatted, tidy tables that you can normalize and analyze using `microeco`, `phyloseq` or a similar package.

### Files Needed

1.  `samples_metadata.tsv` - [*produced by the `metadata_setup` script*](https://rich-molecular-health-lab.github.io/tutorials/metadata_setup.html)
2.  `*_abundance_table_species.tsv` - [*produced by the `wf-16s` pipeline in `readprocessing_multiplex_16s`*](https://rich-molecular-health-lab.github.io/tutorials/readprocessing_multiplex_16s.html)
3.  `*_wf-16s-report.html` - [*produced by the `wf-16s` pipeline in `readprocessing_multiplex_16s`*](https://rich-molecular-health-lab.github.io/tutorials/readprocessing_multiplex_16s.html)

  - The tutorial provides instructions and code to download one `.csv` file per demultiplexed sample from this `.html` file for a given sequencing run and merge those into a table with raw alignment data
  
### Files Produced

1.  `taxonomy_table.tsv` - This table is required for `microeco` and several other metagenomic packages. It must contain exactly one row per taxon in your dataset.
2.  `otu_table.tsv` - This table is required for `microeco` and several other metagenomic packages. It must contain exactly one row per taxon and one column per sample in your dataset. The numeric values represent the raw count of reads mapped to a given taxon within a given sample. We will want to normalize these before analyzing/interpreting them.
3.  `sample_table.tsv` - This table is required for `microeco` and several other metagenomic packages. It must contain exactly one row per sample in your dataset. The columns contain metadata values that we may use as independent/predictor variables for interpreting our results.

##  [`microbiome_references.html`](https://rich-molecular-health-lab.github.io/tutorials/microbiome_references.html)

- Follow this tutorial to use the NCBI accessions available in the read alignments you created in the previous script and use those to fetch one representative sequence per OTU in your dataset and then build a phylogenetic tree to match.

### Files Needed

1.  `alignments.tsv` - *raw alignment data gathered from the wf-16s output and organized into one table in the [previous `microbiome_alignments` script*](https://rich-molecular-health-lab.github.io/tutorials/microbiome_alignments.html)

### Files Produced

1.  `refs_aligned_mafft.fasta` - This contains one GenBank reference sequence for each taxon in your dataset that we can use to substitute for ASVs used in many approaches designed for short read 16S data.
2.   `refs_tree.treefile` - This is a phylogenetic tree produced from the previous fasta multiple sequence alignment.

## [`microbiome_preprocess.html`](https://rich-molecular-health-lab.github.io/tutorialsmicrobiome_preprocess.html)

- Follow this tutorial to construct, filter, and clean a microbiome dataset that will finally be ready for use in calculating basic summary stats/metrics.
  - *Keep in mind that the OTU table still stores count data, not normalized abundance or diversity values.*

### Files Needed

1.  `refs_aligned_mafft.fasta` - This contains one GenBank reference sequence for each taxon in your dataset that we can use to substitute for ASVs used in many approaches designed for short read 16S data.
2.   `refs_tree.treefile` - This is a phylogenetic tree produced from the previous fasta multiple sequence alignment.

### Files Produced

1.  `phyloseq_genus.RData` - Microbiome dataset stored as a phylo object with counts summed and trees collapsed to the Genus level.

  - *Note that the script also contains code to replicate this and all other files at higher taxonomic levels (Family, Order, Class, Phylum)*
  
2.  `tree_genus.RData` - Only the phylogenetic tree stored in the phylo object.

3.  `phyloseq_melt_genus.RData` - Long `tibble` version of the phylo object dataset.
