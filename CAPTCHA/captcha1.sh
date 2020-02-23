# https://defendtheweb.net/extras/playground/captcha/captcha1.php

curl -c cookies.txt https://defendtheweb.net/auth \
-d "username=songzy12" \
-d "password=xxxx"

curl -b cookies.txt https://defendtheweb.net/extras/playground/captcha/captcha1.php -o captcha.png
tesseract captcha.png result
value=`cat result.txt`
trim_value=`echo $value | sed 's/ //g' | sed 's/.$//g'`
echo "trim_value=$trim_value"
rev_value=`echo $trim_value | rev`

curl -X POST \
-d "answer=$trim_value" \
-b cookies.txt \
https://defendtheweb.net/playground/captcha1
