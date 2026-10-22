#!/bin/bash
for file in *.fastq.gz
do 
gunzip -c $file
done

