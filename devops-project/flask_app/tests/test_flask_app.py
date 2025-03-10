import unittest
from flask import Flask, jsonify, request
from flask_testing import TestCase  # type: ignore

# יצירת אפליקציה Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, World!"

@app.route('/post', methods=['POST'])
def post_example():
    data = request.get_json()
    if not data or 'key' not in data:
        return jsonify({"error": "Bad Request"}), 400
    return jsonify({"message": "Received", "data": data}), 201

class FlaskTestCase(TestCase):
    # הכנה לבדיקות
    def create_app(self):
        app.config['TESTING'] = True
        return app

    # בדיקת דף הבית
    def test_home(self):
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data, b"Hello, World!")

    # בדיקת POST עם נתונים נכונים
    def test_post(self):
        response = self.client.post('/post', json={"key": "value"})
        self.assertEqual(response.status_code, 201)
        self.assertIn("Received", response.json["message"])

    # בדיקת POST עם נתונים חסרים
    def test_post_invalid(self):
        response = self.client.post('/post', json={})
        self.assertEqual(response.status_code, 400)
        self.assertIn("error", response.json)

    # בדיקת Route לא קיים (404)
    def test_404(self):
        response = self.client.get('/nonexistent')
        self.assertEqual(response.status_code, 404)

if __name__ == '__main__':
    unittest.main()
