<<<<<<< HEAD
# Use an official Python runtime as a parent image
FROM python:3.11-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the container
COPY backend/requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire backend directory into the container
COPY backend/app .

# Copy the AI models directory into the container
COPY backend/ai /app/ai

# Copy the models directory (containing pickled models) into the container
COPY models /app/models

# Copy the datasets directory into the container
COPY datasets /app/datasets

# Set environment variables (if needed, e.g., for database connections)
# ENV DATABASE_URL=your_database_url
# ENV JWT_SECRET_KEY=your_secret_key

# Expose the port the FastAPI application runs on
EXPOSE 8000

# Command to run the FastAPI application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

# If you have a separate .env file for configuration, you might want to include it
# COPY backend/.env .
# RUN pip install python-dotenv
# And then modify the CMD to load the .env file if your application uses it.
# For example: CMD ["python", "-m", "backend.app.main"] and handle .env loading in main.py
=======
FROM python:3.9

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
>>>>>>> 96dbca3b5ebfce5dee92351b570da4096845f4ab
