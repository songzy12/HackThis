# tesseract

```bash
sudo apt remove tesseract-ocr
```

## configure

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

## variables

<https://github.com/tesseract-ocr/tesseract/blob/master/doc/tesseract.1.asc>

### psm

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

### oem

<https://tesseract-ocr.github.io/tessdoc/Command-Line-Usage.html>

> Use --oem 1 for LSTM, --oem 0 for Legacy Tesseract. Please note that Legacy Tesseract models are only included in traineddata files from tessdata repo.

```text
0 = Original Tesseract only.
1 = Neural nets LSTM only.
2 = Tesseract + LSTM.
3 = Default, based on what is available.
```

### tessdata-dir

Specify the location of tessdata path.

### CONFIGFILE

```text
logfile — Redirect debug messages to file (tesseract.log).
lstm.train — Output files used by LSTM training (OUTPUTBASE.lstmf).
makebox — Write box file (OUTPUTBASE.box).
```

## lstmtraining

`src/training/lstmtraining.cpp`

## network

`src/lstm/network.h`