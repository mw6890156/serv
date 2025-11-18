#!/bin/bash
#==================================================
# Auto-install latest FFmpeg (BtbN static build) on Ubuntu 24.04 x86_64
#==================================================

set -e

echo "=========================================="
echo "      Installing FFmpeg (latest)           "
echo "=========================================="

# Go to /usr/local/bin
cd /usr/local/bin

# Download latest Linux 64-bit GPL static build
echo "Downloading FFmpeg..."
wget -q --show-progress https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linux64-gpl.tar.xz -O ffmpeg-latest.tar.xz

# Remove previous extracted folder if exists
rm -rf ffmpeg-master-latest-linux64-gpl

# Extract
echo "Extracting FFmpeg..."
tar -xvf ffmpeg-latest.tar.xz

# Move into bin folder
cd ffmpeg-master-latest-linux64-gpl/bin

# Move binaries to /usr/local/bin
echo "Installing FFmpeg binaries..."
sudo mv ffmpeg ffplay ffprobe /usr/local/bin/
sudo chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffplay /usr/local/bin/ffprobe

# Cleanup
cd /usr/local/bin
rm -rf ffmpeg-latest.tar.xz ffmpeg-master-latest-linux64-gpl

# Verify installation
echo "Verifying installation..."
ffmpeg -version

echo "=========================================="
echo "FFmpeg installation completed successfully!"
echo "=========================================="
