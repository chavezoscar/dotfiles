#!/usr/bin/env bash

# Greet the user
echo "Hello, $USER 👋"

# Check for internet connection
echo "Checking internet connection..."
if ping -c 1 archlinux.org &>/dev/null; then
	echo "✅ Internet is working!"
else
	echo "❌ No internet. Please check your connection."
	exit 1
fi


# Create a Timeshift snapshot
echo "Creating backup snapshot with Timeshift...⌚"
sudo timeshift --create --comments "Pre-update snapshot🎯" --tags D

# Run system update
echo "Starting system update...⬆️"
yay
