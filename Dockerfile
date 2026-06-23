# Use an official lightweight Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the dependency file first to leverage Docker caching layers
COPY requirements.txt .

# Install strict quantum framework dependencies cleanly
RUN pip install --no-cache-dir -r requirements.txt

# Copy the honest quantum simulator source code into the container
COPY ecc_shor.py .

# Define the default command to execute the Shor simulator upon container launch
CMD ["python", "ecc_shor.py"]
