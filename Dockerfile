FROM python:3.9-slim

# Set working directory in the container
WORKDIR /app


# Configure pip to use proxy
RUN pip config set global.proxy ${HTTP_PROXY}

# Copy requirements file
COPY requirements.txt .

# Clean pip cache and install dependencies
RUN pip cache purge && \
    pip install --no-cache-dir -r requirements.txt

# Copy the Flask application
COPY app.py .

# Expose port 5000
EXPOSE 5000

# Run the Flask application
CMD ["python", "app.py"]
