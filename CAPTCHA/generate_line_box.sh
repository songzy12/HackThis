
for fullfile in data/*.png; do    
    filename=$(basename -- "$fullfile")
    extension="${filename##*.}"
    filename="${filename%.*}"
    echo $filename
    python3 tesstrain/generate_line_box.py --image=data/$filename.png --txt=data/$filename.txt > data/$filename.box
    tesseract data/$filename.png data/$filename lstm.train
done

ls -1 data/*.lstmf | sort -R > data/all-lstmf

holdout_count=1
head -n  $holdout_count data/all-lstmf > list.eval
tail -n +$holdout_count data/all-lstmf > list.train