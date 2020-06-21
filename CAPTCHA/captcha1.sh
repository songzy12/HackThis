# https://defendtheweb.net/extras/playground/captcha/captcha1.php

set -e

GROUND_TRUTH_DIR=ground-truth

curl -v -c cookies.txt https://defendtheweb.net/auth \
    -d "username=songzy12" \
    -d "password=xxx"

timestamp=$(date +%F-%H-%M-%S)
curl -v -b cookies.txt https://defendtheweb.net/extras/playground/captcha/captcha1.php -o $GROUND_TRUTH_DIR/$timestamp.png
tesseract $GROUND_TRUTH_DIR/$timestamp.png $GROUND_TRUTH_DIR/$timestamp

value=$(cat data/$timestamp.txt)
trim_value=$(echo $value | sed 's/ //g' | sed 's/.$//g')
rev_value=$(echo $trim_value | rev)
echo "trim_value=$trim_value"

curl -v -b cookies.txt \
    --data-urlencode "answer=$rev_value" \
    https://defendtheweb.net/playground/captcha1

mv $GROUND_TRUTH_DIR/$timestamp{.gt}.txt