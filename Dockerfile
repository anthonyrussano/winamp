FROM python:3.11-slim

WORKDIR /app

# Copy application files
COPY server.py .
COPY index.html .
COPY webamp.bundle.min.js .

# Expose the port
EXPOSE 8080

# Run the server
CMD ["python", "server.py"]
