# השתמש בתמונה בסיסית של Python
FROM python:3.9-slim

# הגדר את תיקיית העבודה
WORKDIR /app

# העתק את קובץ requirements.txt
COPY requirements.txt .

# התקן את התלויות
RUN pip install --no-cache-dir -r requirements.txt

# העתק את כל הקבצים לתוך ה-container
COPY . .

# הגדר את המשתנה הסביבתי שמצביע על קובץ היישום
ENV FLASK_APP=flask_app.py

# הפעל את Flask על כל כתובת (0.0.0.0) עם פורט 5000
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
