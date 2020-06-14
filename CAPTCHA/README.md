<https://defendtheweb.net/playground?subject=captcha>

## Parameters

<https://github.com/tesseract-ocr/tesseract/blob/master/doc/tesseract.1.asc>

### psm

```
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

### oem

<https://tesseract-ocr.github.io/tessdoc/Command-Line-Usage.html>

> Use --oem 1 for LSTM, --oem 0 for Legacy Tesseract. Please note that Legacy Tesseract models are only included in traineddata files from tessdata repo.

```
0 = Original Tesseract only.
1 = Neural nets LSTM only.
2 = Tesseract + LSTM.
3 = Default, based on what is available.
```

### tessdata-dir

Specify the location of tessdata path.

### CONFIGFILE

```
logfile — Redirect debug messages to file (tesseract.log).
lstm.train — Output files used by LSTM training (OUTPUTBASE.lstmf).
makebox — Write box file (OUTPUTBASE.box).
```

## Training

<https://tesseract-ocr.github.io/tessdoc/FAQ.html#training>

<https://tesseract-ocr.github.io/tessdoc/TrainingTesseract-4.00.html>

<https://github.com/tesseract-ocr/tesstrain>

## Reference

<http://devloop.users.sourceforge.net/index.php?article187/how-i-solved-hackthis-captcha-challenges>
