#!/bin/bash

echo "🧹 Clearing all system logs including OpenVPN logs..."

# Ensure the script is run with sudo
if [[ $EUID -ne 0 ]]; then
   echo "❌ This script must be run as root. Use: sudo $0"
   exit 1
fi

# Clear all journal logs older than 1 second
journalctl --vacuum-time=1s

# Confirm completion
echo "✅ All journal logs (including OpenVPN) cleared."
