#!/bin/bash

echo "Updating system..."
sudo pacman -Syu

if command -v yay &> /dev/null
then
    echo "Updating AUR packages..."
    yay -Syu --aur
else
    echo "yay not found. Skipping AUR updates."
fi

echo "System update complete."
