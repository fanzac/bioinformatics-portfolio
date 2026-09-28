for filename in *.txt
do 
name=$(basename ${filename} .txt)
mv ${filename} ${name}_2025.txt
done
