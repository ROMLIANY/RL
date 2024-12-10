import os
from flask import Flask, render_template
import random

app = Flask(__name__)

# קביעת רשימת ה-GIFs של החתולים
images = [
    "https://c.tenor.com/8S_h8HihHoUAAAAM/cat-cats.gif",
    "https://c.tenor.com/qUyYOYoh0FAAAAAM/cat-cats.gif",
    "https://c.tenor.com/YKmLoDftSuYAAAAM/cat-cats.gif"
]

# נוסיף גם סופר כדי להראות כמה פעמים ביקרו בדף
visitor_count = 0

@app.route("/")
def home():
    global visitor_count
    visitor_count += 1
    image_url = random.choice(images)
    return render_template("index.html", image_url=image_url, count=visitor_count)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.getenv("PORT", 5000)))
