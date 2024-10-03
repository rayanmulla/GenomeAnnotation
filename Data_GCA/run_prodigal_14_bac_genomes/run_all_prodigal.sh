#!/bin/bash

# Define the directory containing genome files
GENOME_DIR="/home/mullara/GenomeAnnotation/GenomeAnnotation/Data_GCA/genomes"
OUTPUT_DIR="/home/mullara/GenomeAnnotation/GenomeAnnotation/Data_GCA/results"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# File to store the summary of numbers of genes
GENE_COUNTS_FILE="$OUTPUT_DIR/gene_counts.txt"
echo "Genome File,Number of Genes" > "$GENE_COUNTS_FILE"

# Iterate over each genome file in the directory
for GENOME_FILE in "$GENOME_DIR"/*.fasta; do
    BASENAME=$(basename "$GENOME_FILE" .fasta)
    GENE_OUTPUT="$OUTPUT_DIR/${BASENAME}_genes.gbk"
    PROTEIN_OUTPUT="$OUTPUT_DIR/${BASENAME}_proteins.faa"
    
    echo "Processing $GENOME_FILE..."

    # Run Prodigal
    prodigal -i "$GENOME_FILE" -o "$GENE_OUTPUT" -a "$PROTEIN_OUTPUT" -p single 2> "$OUTPUT_DIR/${BASENAME}_prodigal.log"
    
    # Check if Prodigal ran successfully
    if [ $? -eq 0 ]; then
        # Run Python script to count genes and capture output
        GENE_COUNT=$(python3 count_genes.py "$GENE_OUTPUT")
        
        if [ ! -z "$GENE_COUNT" ]; then
            echo "${BASENAME}.fasta,$GENE_COUNT" >> "$GENE_COUNTS_FILE"
        else
            echo "Error: Could not determine gene count for ${GENOME_FILE}."
        fi
    else
        echo "Error: Prodigal failed for $GENOME_FILE. Check the log at ${BASENAME}_prodigal.log."
    fi
done

# Find the genome with the highest number of genes
echo "Genome with the highest number of genes:"
sort -t ',' -k2 -nr "$GENE_COUNTS_FILE" | head -n 1
