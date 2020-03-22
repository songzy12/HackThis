
from datetime import datetime
import requests

import cv2
import pytesseract


def get_captcha(sess):

    response = sess.post(
        "https://defendtheweb.net/auth",
        data={"username": "songzy12",
              "password": "hackthis"}
    )

    sess.get("https://defendtheweb.net/playground/captcha1")
    response = sess.get(
        "https://defendtheweb.net/extras/playground/captcha/captcha1.php")
    return response.content


def ocr(image):
    # Adding custom options
    custom_config = r'--oem 3 --psm 6'
    answer = pytesseract.image_to_string(image, config=custom_config)
    return answer


def send_answer(sess, answer):
    sess.post("https://defendtheweb.net/playground/captcha1",
              data={"answer": answer})


if __name__ == "__main__":
    sess = requests.session()

    captcha = get_captcha(sess)
    filename = "img/%s.png" % datetime.now().strftime("%Y-%m-%d-%H-%M-%S")
    with open(filename, "wb") as fd:
        fd.write(captcha)
    
    answer = ocr(cv2.imread(filename))
    print(answer)

    send_answer(sess, answer)
