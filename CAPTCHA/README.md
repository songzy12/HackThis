# Hack This Captcha

<https://defendtheweb.net/playground?subject=captcha>

## tesstrain

```bash
export ROOT_DIR="/home/songzy/HackThis/CAPTCHA"
export TESSDATA="$ROOT_DIR/tessdata"
export MODEL_NAME="hack_this_captcha"
export OUTPUT_DIR="$ROOT_DIR"/data/"$MODEL_NAME"
export GROUND_TRUTH_DIR="$OUTPUT_DIR-ground-truth"
```

```bash
make clean \
TESSDATA="$TESSDATA" \
MODEL_NAME="$MODEL_NAME" \
OUTPUT_DIR="$OUTPUT_DIR" \
GROUND_TRUTH_DIR="$GROUND_TRUTH_DIR" \
TESSDATA_PREFIX="$TESSDATA"
```

```bash
make tesseract-langs \
TESSDATA="$TESSDATA" \
MODEL_NAME="$MODEL_NAME" \
OUTPUT_DIR="$OUTPUT_DIR" \
GROUND_TRUTH_DIR="$GROUND_TRUTH_DIR" \
TESSDATA_PREFIX="$TESSDATA"
```

Now, we have `eng.traineddata` under `$TESSDATA`.

```bash
wget https://raw.githubusercontent.com/tesseract-ocr/tesseract/master/tessdata/configs/lstm.train
```

Now, we have `configs/lstm.train` under `$TESSDATA`.

```bash
make unicharset lists \
TESSDATA="$TESSDATA" \
MODEL_NAME="$MODEL_NAME" \
OUTPUT_DIR="$OUTPUT_DIR" \
GROUND_TRUTH_DIR="$GROUND_TRUTH_DIR" \
TESSDATA_PREFIX="$TESSDATA"
```

Now, we have `unicharset`, `list.eval`, `list.train` under `$OUTPUT_DIR`.

```bash
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/Latin.unicharset
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/Latin.xheights
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/Common.unicharset
```

```bash
make proto-model \
TESSDATA="$TESSDATA" \
MODEL_NAME="$MODEL_NAME" \
OUTPUT_DIR="$OUTPUT_DIR" \
GROUND_TRUTH_DIR="$GROUND_TRUTH_DIR" \
TESSDATA_PREFIX="$TESSDATA"
```

Now, we have `$MODEL_NAME.traineddata`, `$MODEL_NAME.unicharset` under `data/hack_this_captcha`.

```bash
mv data/hack_this_captcha/* $OUTPUT_DIR
```

Now, we have `$MODEL_NAME.traineddata`, `$MODEL_NAME.unicharset` under `$OUTPUT_DIR`.

```bash
make training \
TESSDATA="$TESSDATA" \
MODEL_NAME="$MODEL_NAME" \
OUTPUT_DIR="$OUTPUT_DIR" \
GROUND_TRUTH_DIR="$GROUND_TRUTH_DIR" \
TESSDATA_PREFIX="$TESSDATA"
```

## Reference

<https://tesseract-ocr.github.io/tessdoc/TrainingTesseract-4.00.html#fine-tuning-for-impact>

<https://distill.pub/2017/ctc/>
