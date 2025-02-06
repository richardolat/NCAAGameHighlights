# Use Python base image
FROM python:3.8

# Set working directory
WORKDIR /app

# Copy the project files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Command to run the pipeline
CMD ["python", "run_all.py"]
