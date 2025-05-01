# Use official Python base image
FROM python:3.10-slim

# Set work directory
WORKDIR /app

# Copy app and requirements
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY app.py .

# Expose Flask port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
