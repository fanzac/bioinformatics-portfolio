 for filename in *.txt
 do
 name=$(basename ${filename} .txt)
 echo ${name}
 done
