# שימוש בתמונה רזה של Python
FROM python:3.9-slim

# הגדרת ספריית עבודה בתוך הקונטיינר
WORKDIR /app

# העתקת קובץ הדרישות והתקנת התלויות
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# העתקת קבצי הפרויקט
COPY . .

# הגדרת משתני סביבה
ENV FLASK_APP=app.py
ENV FLASK_ENV=development

# פתיחת הפורט של Flask
EXPOSE 5000

# הפעלת היישום Flask
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
