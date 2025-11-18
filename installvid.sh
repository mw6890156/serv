#!/bin/bash

# Name of virtual environment
VENV_NAME="myenv"

# Python executable
PYTHON_BIN="python3"

# Check if python3 is installed
if ! command -v $PYTHON_BIN &> /dev/null
then
    echo "Python3 could not be found. Please install it first."
    exit
fi

# Create virtual environment
$PYTHON_BIN -m venv $VENV_NAME

# Activate virtual environment
source $VENV_NAME/bin/activate

# Upgrade pip, setuptools, wheel
pip install --upgrade pip setuptools wheel

# Install all required packages
pip install \
    google-generativeai \
    google-api-python-client \
    google-auth \
    google-auth-oauthlib \
    google-auth-httplib2 \
    arabic-reshaper \
    Pillow \
    moviepy==2.2.1 \
    playwright \
    tqdm \
    numpy \
    requests \
    pyjwt \
    pydantic \
    typing-extensions

# Install Playwright browsers
python -m playwright install

echo "Virtual environment '$VENV_NAME' is ready and all packages are installed!"
echo "Activate it with: source $VENV_NAME/bin/activate"
