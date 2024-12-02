#!/bin/bash

# Install Ghidra
cd /opt
sudo wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.2.3_build/ghidra_10.2.3_PUBLIC_20230208.zip
sudo unzip ghidra_10.2.3_PUBLIC_20230208.zip
sudo rm ghidra_10.2.3_PUBLIC_20230208.zip

# Install IDA Free
cd /opt
sudo wget https://out7.hex-rays.com/files/idafree82_linux.run
chmod +x idafree82_linux.run
sudo ./idafree82_linux.run --mode silent
sudo rm idafree82_linux.run

# Install Binary Ninja (requires license)
# Assume you have a script or method to install Binary Ninja

# Update environment variables and permissions as needed
