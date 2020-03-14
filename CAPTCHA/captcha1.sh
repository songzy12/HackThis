# https://defendtheweb.net/extras/playground/captcha/captcha1.php

set -e

curl -v -c cookies.txt https://defendtheweb.net/auth \
    -d "username=songzy12" \
    -d "password=xxx"

timestamp=$(date +%F-%H-%M-%S)
curl -v -b cookies.txt https://defendtheweb.net/extras/playground/captcha/captcha1.php -o data/$timestamp.png
tesseract data/$timestamp.png data/$timestamp

value=$(cat data/$timestamp.txt)
trim_value=$(echo $value | sed 's/ //g' | sed 's/.$//g')
rev_value=$(echo $trim_value | rev)
echo "trim_value=$trim_value"

curl -v -b cookies.txt \
    --data-urlencode "answer=$rev_value" \
    https://defendtheweb.net/playground/captcha1
