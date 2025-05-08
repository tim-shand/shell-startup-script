#!/bin/bash

# Script Name: shell-startup-script.sh
# Description: Intended to be executed on terminal startup. Provides IP and basic info. 
# Author: Tim Shand
# Date: 2025-05-08
# Usage: ./shell-startup-script.sh (set to execute on startup in terminal settings).

# Global Variables
## Colours: Normal
STD="\e[0m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[0;33m"
## Colours: Bold
BOLDRED="\e[1;31m"
BOLDGREEN="\e[1;32m"
BOLDYELLOW="\e[1;33m"

# Functions
## External IP address
get_external_ip() {
  curl -s https://api.ipify.org
}

## Local IPv4 address (excluding loopback and docker)
get_local_ip() {
  ip -4 addr show scope global | grep inet | awk '{print $2}' | cut -d/ -f1 | head -n 1
}

# Main
host_name=$(hostname)
user_name=$(whoami)
external_ip=$(get_external_ip)
local_ip=$(get_local_ip)

clear
echo -e "${BOLDRED}---------------------------------${STD}"
echo -e "${BOLDYELLOW}$host_name${STD}"
echo "- Username:    $user_name"
echo "- External IP: $external_ip"
echo "- Local IP:    $local_ip"
echo -e "${BOLDRED}---------------------------------${STD}"

