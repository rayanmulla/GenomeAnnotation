import sys

def count_genes(gbk_file):
    gene_count = 0
    try:
        with open(gbk_file, 'r') as file:
            for line in file:
                # Count instances of 'CDS' as a gene feature indication
                if line.startswith("     CDS"):
                    gene_count += 1
    except FileNotFoundError:
        print(f"Error: File {gbk_file} not found.")
    except Exception as e:
        print(f"An error occurred while processing {gbk_file}: {e}")
    return gene_count

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python count_genes.py <gene_output.gbk>")
    else:
        gbk_file = sys.argv[1]
        gene_count = count_genes(gbk_file)
        
        if gene_count > 0:
            print(gene_count)
        else:
            print("Warning: No genes counted or error occurred.")
