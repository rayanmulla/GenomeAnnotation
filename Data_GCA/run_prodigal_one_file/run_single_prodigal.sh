#!/bin/bash

# Define the input genome file (replace this with the actual filename if different)
GENOME_FILE="/home/mullara/GenomeAnnotation/GenomeAnnotation/Data_GCA/GCA_000006745.1_ASM674v1_genomic.fna"

# Define output files
GENE_OUTPUT="/home/mullara/GenomeAnnotation/GenomeAnnotation/Data_GCA/genes.gbk"
PROTEIN_OUTPUT="/home/mullara/GenomeAnnotation/GenomeAnnotation/Data_GCA/proteins.faa"

# Run Prodigal to predict genes
prodigal -i "$GENOME_FILE" -o "$GENE_OUTPUT" -a "$PROTEIN_OUTPUT" -p single

# Check if Prodigal ran successfully
if [ $? -eq 0 ]; then
    echo "Prodigal analysis complete. Results saved to $GENE_OUTPUT and $PROTEIN_OUTPUT."
else
    echo "Error: Prodigal failed to run."
fi



