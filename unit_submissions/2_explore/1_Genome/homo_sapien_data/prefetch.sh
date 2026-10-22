#!/bin/bash
#SBATCH -J pfJH
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o output_%j.txt
#SBATCH -e error_%j.txt
#SBATCH -t 24:00:00

# load sratoolkit
module load sratoolkit/12Dec2024

# carry out prefetch of the list of accessions
prefetch --option-file accessions.txt
