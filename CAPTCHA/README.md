# Hack This Captcha

<https://defendtheweb.net/playground?subject=captcha>

## tesseract

```bash
sudo apt remove tesseract-ocr
```

### configure

<https://tesseract-ocr.github.io/tessdoc/Compiling.html>

```bash
sudo apt-get install g++ # or clang++ (presumably)
sudo apt-get install autoconf automake libtool
sudo apt-get install pkg-config
sudo apt-get install libpng-dev
sudo apt-get install libjpeg8-dev
sudo apt-get install libtiff5-dev
sudo apt-get install zlib1g-dev

sudo apt-get install libicu-dev
sudo apt-get install libpango1.0-dev
sudo apt-get install libcairo2-dev
```

```bash
sudo apt-get install libleptonica-dev
```

```bash
./autogen.sh
./configure
make
sudo make install
sudo ldconfig
make training
sudo make training-install
```

### variables

<https://github.com/tesseract-ocr/tesseract/blob/master/doc/tesseract.1.asc>

#### psm

```text
0 = Orientation and script detection (OSD) only.
1 = Automatic page segmentation with OSD.
2 = Automatic page segmentation, but no OSD, or OCR. (not implemented)
3 = Fully automatic page segmentation, but no OSD. (Default)
4 = Assume a single column of text of variable sizes.
5 = Assume a single uniform block of vertically aligned text.
6 = Assume a single uniform block of text.
7 = Treat the image as a single text line.
8 = Treat the image as a single word.
9 = Treat the image as a single word in a circle.
10 = Treat the image as a single character.
11 = Sparse text. Find as much text as possible in no particular order.
12 = Sparse text with OSD.
13 = Raw line. Treat the image as a single text line,
     bypassing hacks that are Tesseract-specific.
```

#### oem

<https://tesseract-ocr.github.io/tessdoc/Command-Line-Usage.html>

> Use --oem 1 for LSTM, --oem 0 for Legacy Tesseract. Please note that Legacy Tesseract models are only included in traineddata files from tessdata repo.

```text
0 = Original Tesseract only.
1 = Neural nets LSTM only.
2 = Tesseract + LSTM.
3 = Default, based on what is available.
```

#### tessdata-dir

Specify the location of tessdata path.

#### CONFIGFILE

```text
logfile — Redirect debug messages to file (tesseract.log).
lstm.train — Output files used by LSTM training (OUTPUTBASE.lstmf).
makebox — Write box file (OUTPUTBASE.box).
```

## tesstrain

<https://github.com/tesseract-ocr/tesstrain>

<https://tesseract-ocr.github.io/tessdoc/TrainingTesseract-4.00.html>

### ground truth data

`data/MODEL_NAME-ground-truth`

> Images must be TIFF and have the extension `.tif` or PNG and have the extension `.png`, `.bin.png` or `.nrm.png`.
> Transcriptions must be single-line plain text and have the same name as the line image but with the image extension replaced by `.gt.txt`.

### traineddata

```bash
make unicharset lists proto-model training
```

### variables

```bash
# Language Type - Indic, RTL or blank. Default: '$(LANG_TYPE)'
LANG_TYPE ?=
```

RTL: right to left.

```bash
# Network specification. Default: $(NET_SPEC)
NET_SPEC := [1,36,0,1 Ct3,3,16 Mp3,3 Lfys48 Lfx96 Lrx96 Lfx256 O1c\#\#\#]
```

We need to set the TESSDATA_PREFIX config variable as:

```bash
TESSDATA_PREFIX := /home/songzy/tesstrain/usr/share/tessdata/
```

Also, note this: <https://github.com/tesseract-ocr/tesseract/issues/1101#issuecomment-325916902>.

### targets

#### unicharset

```bash
unicharset_extractor --output_unicharset "$@" --norm_mode $(NORM_MODE) "$(ALL_GT)"
```

#### lists

```bash
head -n "$$train" $(ALL_LSTMF) > "$(OUTPUT_DIR)/list.train"; \
tail -n "$$eval" $(ALL_LSTMF) > "$(OUTPUT_DIR)/list.eval"
```

#### proto-model

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

#### training

```bash
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

## Reference

<http://devloop.users.sourceforge.net/index.php?article187/how-i-solved-hackthis-captcha-challenges>

<https://distill.pub/2017/ctc/>

<https://www.endpoint.com/blog/2018/07/09/training-tesseract-models-from-scratch>
