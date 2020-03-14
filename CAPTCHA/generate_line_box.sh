
for fullfile in data/*.png; do    
    filename=$(basename -- "$fullfile")
    extension="${filename##*.}"
    filename="${filename%.*}"
    echo $filename
    python3 tesstrain/generate_line_box.py --image=data/$filename.png --txt=data/$filename.txt > data/$filename.box
done