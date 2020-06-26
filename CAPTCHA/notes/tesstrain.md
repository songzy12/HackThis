# tesstrain

<https://github.com/tesseract-ocr/tesstrain>

<https://tesseract-ocr.github.io/tessdoc/TrainingTesseract-4.00.html>

## ground truth data

`data/MODEL_NAME-ground-truth`

> Images must be TIFF and have the extension `.tif` or PNG and have the extension `.png`, `.bin.png` or `.nrm.png`.
> Transcriptions must be single-line plain text and have the same name as the line image but with the image extension replaced by `.gt.txt`.

## eng.traineddata

```make
# Download tesseract-langs
tesseract-langs: $(TESSDATA)/eng.traineddata
```

Why do we need this?

```make
%.lstmf: %.box
	tesseract "$${image}" $* --psm $(PSM) lstm.train
```

## traineddata

```bash
make training MODEL_NAME=hack_this_captcha
make unicharset lists proto-model training
```

## variables

```make
# Language Type - Indic, RTL or blank. Default: '$(LANG_TYPE)'
LANG_TYPE ?=
```

RTL: right to left.

```make
# Network specification. Default: $(NET_SPEC)
NET_SPEC := [1,36,0,1 Ct3,3,16 Mp3,3 Lfys48 Lfx96 Lrx96 Lfx256 O1c\#\#\#]
```

We need to set the TESSDATA_PREFIX config variable as:

```make
TESSDATA_PREFIX := /home/songzy/tesstrain/usr/share/tessdata/
```

Also, note this: <https://github.com/tesseract-ocr/tesseract/issues/1101#issuecomment-325916902>.

## targets

### unicharset

```bash
unicharset_extractor --output_unicharset "$@" --norm_mode $(NORM_MODE) "$(ALL_GT)"
```

### lists

```bash
head -n "$$train" $(ALL_LSTMF) > "$(OUTPUT_DIR)/list.train"; \
tail -n "$$eval" $(ALL_LSTMF) > "$(OUTPUT_DIR)/list.eval"
```

### proto-model

```bash
combine_lang_model \
    --input_unicharset $(OUTPUT_DIR)/unicharset \
    --script_dir data \
    --numbers $(NUMBERS_FILE) \
    --puncs $(PUNC_FILE) \
    --words $(WORDLIST_FILE) \
    --output_dir data \
    $(RECODER) \
    --lang $(MODEL_NAME)
```

### training

```make
@mkdir -p $(OUTPUT_DIR)/checkpoints
lstmtraining \
    --debug_interval $(DEBUG_INTERVAL) \
    --traineddata $(PROTO_MODEL) \
    --net_spec "$(subst c###,c`head -n1 $(OUTPUT_DIR)/unicharset`,$(NET_SPEC))" \
    --model_output $(OUTPUT_DIR)/checkpoints/$(MODEL_NAME) \
    --learning_rate 20e-4 \
    --train_listfile $(OUTPUT_DIR)/list.train \
    --eval_listfile $(OUTPUT_DIR)/list.eval \
    --max_iterations $(MAX_ITERATIONS) \
    --target_error_rate $(TARGET_ERROR_RATE)

lstmtraining \
--stop_training \
--continue_from $(LAST_CHECKPOINT) \
--traineddata $(PROTO_MODEL) \
--model_output $@
```
