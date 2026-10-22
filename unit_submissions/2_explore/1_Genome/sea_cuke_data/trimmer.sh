
for filename in *.tiny.fastq
do

  base=$(basename $filename .tiny.fastq)
  echo ${base}

  cutadapt --length 70 ${base}.tiny.fastq -o ${base}.tiny_shortened.fastq 

done
