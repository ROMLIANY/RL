# ביסוס על תמונה של Python 3.9
FROM python:3.9-slim

# עדכון pip
RUN pip install --upgrade pip

# התקנת Flask
RUN pip install Flask

# העתקת כל הקבצים לתוך התמונה
COPY . /app

# הגדרת תיקיית עבודה
WORKDIR /app

# הפעלת האפליקציה
CMD ["python", "app.py"]
