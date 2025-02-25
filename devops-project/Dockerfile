# שימוש בתמונה רזה של Python 
FROM python:3.9-slim

# הגדרת ספריית העבודה בתוך הקונטיינר
WORKDIR /app

# העתקת קובץ הדרישות והתקנת התלויות
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# העתקת קבצי הפרויקט
COPY . .

# פתיחת הפורט של Flask
EXPOSE 5000

# הגדרת משתני סביבה
ENV FLASK_ENV=${FLASK_ENV}
ENV FLASK_APP=${FLASK_APP}

# הפעלת היישום Flask
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
