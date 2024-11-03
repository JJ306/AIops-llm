# Use an official Python runtime as a parent image
FROM python:3.8.10-slim-buster

#COPY trained_models /trained_models
COPY chat_test_api.py .
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose the port that FastAPI will run on
EXPOSE 8000

# Command to run the FastAPI app
#CMD ["uvicorn", "chat_test_api:app", "--host", "0.0.0.0", "--port", "8000"]
CMD gunicorn --bind 0.0.0.0:8000 chat_test_api:app -k uvicorn.workers.UvicornWorker
