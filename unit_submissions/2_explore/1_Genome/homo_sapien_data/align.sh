#!/bin/bash
#SBATCH -J alignJH
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -o align_output_%j.txt                   
#SBATCH -e align_error_%j.txt
#SBATCH --cpus-per-task=16
#SBATCH --mem=80G
#SBATCH --time=12:00:00

# load anaconda and activate star conda environment – you know how to do this!

module load anaconda3/2024.06
source activate /courses/BIOL2406.202710/shared/star_env/

# Directory containing the genome index
GENOME_DIR="fastq_files/star_index"

# Directory containing the fastq files
FASTQ_DIR="fastq_files"

# Directory for the results
OUT_DIR="aligned_output"

# Create the output directory if it doesn't already exist
mkdir -p "$OUT_DIR"

# Loop through each read 1 file
for read1 in "$FASTQ_DIR"/*_1.fastq; do

    # Get the sample name by removing the directory and the _1.fastq ending
    sample=$(basename "$read1" _1.fastq)

    # The matching read 2 file
    read2="$FASTQ_DIR/${sample}_2.fastq"

    # Run STAR
    STAR --genomeDir "$GENOME_DIR" \
         --readFilesIn "$read1" "$read2" \
         --runThreadN 16 \
         --outFileNamePrefix "$OUT_DIR/${sample}_" \
         --outSAMtype BAM SortedByCoordinate \
         --limitBAMsortRAM 40000000000

done
