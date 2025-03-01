import unittest
from flask import Flask

# יוצרים אובייקט Flask מינימלי לבדיקה
app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, World!"

class FlaskTestCase(unittest.TestCase):
    # אתחול לפני כל בדיקה
    def setUp(self):
        self.app = app.test_client()  # מתחברים לאפליקציה עם test client
        self.app.testing = True

    # בדיקה אם הדף הראשי מחזיר את התוצאה הנכונה
    def test_home(self):
        response = self.app.get('/')  # שולחים בקשה ל-root
        self.assertEqual(response.status_code, 200)  # בודקים שהסטטוס הוא 200
        self.assertEqual(response.data, b"Hello, World!")  # בודקים את התוכן

if __name__ == '__main__':
    unittest.main()
