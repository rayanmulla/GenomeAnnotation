import os

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

def read_sequences_from_directory(directory):
    results = {}
    try:
        # Loop through each file in the directory with a .txt extension
        for filename in os.listdir(directory):
            if filename.endswith('.txt'):
                filepath = os.path.join(directory, filename)
                with open(filepath, 'r') as file:
                    sequence = file.read().strip()  # Read and strip any newline or whitespace
                    results[filename] = calculate_amino_acids_and_dna_bases(sequence)
    except FileNotFoundError:
        print(f"Error: The directory {directory} was not found.")
    except Exception as e:
        print(f"An error occurred: {e}")
    return results

if __name__ == "__main__":
    # Specify the directory containing the .txt files
    directory = "/home/mullara/GenomeAnnotation/GenomeAnnotation/Data_GCA/AA_GCA"
    
    results = read_sequences_from_directory(directory)
    
    for filename, (num_amino_acids, num_bases) in results.items():
        print(f"File: {filename}")
        print(f"  Number of amino acids (excluding stop codon): {num_amino_acids}")
        print(f"  Number of bases in the open reading frame (including stop codon): {num_bases}\n")

