#!/bin/bash

# Print current directory
echo "Current directory: $(pwd)"

# List files in the current directory
echo "Files in current directory:"
ls

# Display the current date and time
echo "Current date and time: $(date)"

#!/bin/bash

# Exit on any error
set -e

# Create and activate the virtual environment
echo "Creating and activating virtual environment..."
python3 -m venv venv
source venv/bin/activate

# Install dependencies
echo "Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

# Run Django management commands

echo "Collecting static files..."


waitress-serve --port=80 Hotel_Restaurant.wsgi:application

# Start the Django application with Waitress

echo "Application started successfully!"

