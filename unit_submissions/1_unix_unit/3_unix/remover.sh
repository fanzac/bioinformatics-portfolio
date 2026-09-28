for filename in *_2025.txt; do
    [ -e "$filename" ] || continue          # skip if no files match
    name=$(basename "$filename" _2025.txt)
    mv "$filename" "${name}.txt"
done
