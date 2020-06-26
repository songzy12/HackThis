# Hack This Captcha

<https://defendtheweb.net/playground?subject=captcha>

## tesstrain

```bash
make tesseract-langs \
TESSDATA="../tessdata" \
MODEL_NAME="hack_this_captcha" \
OUTPUT_DIR="../data/$MODEL_NAME" \
GROUND_TRUTH_DIR="$OUTPUT_DIR-ground-truth" \
TESSDATA_PREFIX="$TESSDATA"
```

```bash
make training \
TESSDATA="../tessdata" \
MODEL_NAME="hack_this_captcha" \
OUTPUT_DIR="../data/$MODEL_NAME" \
GROUND_TRUTH_DIR="$OUTPUT_DIR-ground-truth" \
TESSDATA_PREFIX="$TESSDATA"
```

## Reference

<https://tesseract-ocr.github.io/tessdoc/TrainingTesseract-4.00.html#fine-tuning-for-impact>

<https://distill.pub/2017/ctc/>
