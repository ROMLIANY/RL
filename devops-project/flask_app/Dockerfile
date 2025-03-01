# השתמש בתמונה בסיסית של Python
FROM python:3.9-slim

# הגדר את ספריית העבודה בתוך הקונטיינר
WORKDIR /app

# העתק את קובץ ה-requirements.txt לתוך הקונטיינר
COPY requirements.txt .

# התקן את התלויות
RUN pip install --no-cache-dir -r requirements.txt

# העתק את כל קבצי הפרויקט לתוך הקונטיינר
COPY . .

# הורד את wait-for-it.sh
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# הגדר את משתני הסביבה
ENV FLASK_APP=app.py
ENV FLASK_ENV=development

# פתח את פורט 5000
EXPOSE 5000

# הפקודה להפעיל את Flask באמצעות waitress
CMD ["waitress-serve", "--host=0.0.0.0", "--port=5000", "app:app"]
