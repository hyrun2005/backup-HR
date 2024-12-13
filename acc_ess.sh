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
echo "Running Django migrations..."
python manage.py migrate

echo "Collecting static files..."
python manage.py collectstatic --noinput

# Install Waitress if not already installed
echo "Installing Waitress..."
pip install waitress

# Start the Django application with Waitress
echo "Starting the application with Waitress..."
nohup waitress-serve --port=8000 Hotel_Restaurant.wsgi:application &

echo "Application started successfully!"