from flask import Flask, render_template
import random

app = Flask(__name__)

gifs = [
    "https://media.giphy.com/media/xT9IgG50Fb7Mi0prBC/giphy.gif",
    "https://media.giphy.com/media/3o6Zt481isNVuQI1l6/giphy.gif",
    "https://media.giphy.com/media/l41lVsYDBC0UVQJCE/giphy.gif"
]

@app.route("/")
def index():
    gif_url = random.choice(gifs)
    return f"<h1>Random GIF</h1><img src='{gif_url}' width='500'>"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
