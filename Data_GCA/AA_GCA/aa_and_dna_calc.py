def calculate_amino_acids_and_dna_bases(sequence):
    # Remove the stop codon represented by '*'
    if sequence.endswith('*'):
        sequence = sequence[:-1]
    
    # Calculate the number of amino acids
    num_amino_acids = len(sequence)
    
    # Each amino acid and the stop codon are represented by 3 bases
    num_codons = num_amino_acids + 1  # +1 for the stop codon
    num_bases = num_codons * 3
    
    return num_amino_acids, num_bases

if __name__ == "__main__":
    # Example amino acid sequence with a stop codon at the end
    amino_acid_sequence = "KVRMFTSELDIMLSVNGPADQIKYFCRHWT*"
    
    num_amino_acids, num_bases = calculate_amino_acids_and_dna_bases(amino_acid_sequence)
    
    print(f"Number of amino acids (excluding stop codon): {num_amino_acids}")
    print(f"Number of bases in the open reading frame (including stop codon): {num_bases}")
