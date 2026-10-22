#! /bin/bash
#SBATCH  -J fasterq_dump 
#SBATCH -N 2
#SBATCH -o output%z.txt
#SBATCH -e error%z.txt
prefetch --option-file SRR_Acc_List.txt
fasterq-dump --split-files SRR*/
