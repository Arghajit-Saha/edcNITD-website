#!/bin/bash

# Exit on any error
set -e

echo "Starting Django application..."

# Change to the correct directory
cd /app/website

# Make migrations for all apps (as mentioned for older Django versions)
echo "Making migrations for all apps..."
for app in campus_ambassador EQuest esummit events forum innovationcell sotm sponsors team web_team; do
  echo "Making migrations for $app..."
  python manage.py makemigrations $app
done

# Run general makemigrations
echo "Running general makemigrations..."
python manage.py makemigrations

# Apply migrations
echo "Applying migrations..."
python manage.py migrate

# Start the development server
echo "Starting Django development server..."
python manage.py runserver 0.0.0.0:8000
