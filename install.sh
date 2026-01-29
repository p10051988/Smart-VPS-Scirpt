#!/bin/bash

# ==========================================================
# VPS MANAGER - GO EDITION INSTALLER
# ==========================================================

# Configuration
REPO_URL="https://raw.githubusercontent.com/p10051988/Smart-VPS-Scirpt/main"
BINARY_NAME="vps"
INSTALL_DIR="/usr/local/bin"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

# Check Root
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}[Error] This script must be run as root!${NC}"
   exit 1
fi

clear
echo -e "${CYAN}----------------------------------------------------------------${NC}"
echo -e "${CYAN}       VPS MANAGER AUTO INSTALLER (v2.7.60 Go Edition)${NC}"
echo -e "${CYAN}----------------------------------------------------------------${NC}"
echo ""

echo -e "${CYAN}[Step 1/3] Downloading Binary...${NC}"

# Download Binary
curl -L -o "$INSTALL_DIR/$BINARY_NAME" "$REPO_URL/$BINARY_NAME"

if [ $? -ne 0 ]; then
    echo -e "${RED}[Error] Failed to download binary from GitHub.${NC}"
    echo -e "Check your internet connection or URL: $REPO_URL/$BINARY_NAME"
    exit 1
fi

echo -e "${CYAN}[Step 2/3] Setting Permissions...${NC}"
chmod +x "$INSTALL_DIR/$BINARY_NAME"

# Create symlink just in case /usr/local/bin is not in PATH (unlikely but safe)
if [[ ! -f /usr/bin/vps ]]; then
    ln -s "$INSTALL_DIR/$BINARY_NAME" /usr/bin/vps
fi

echo -e "${CYAN}[Step 3/3] Verifying Installation...${NC}"
if command -v vps &> /dev/null; then
    echo -e "${GREEN}==========================================${NC}"
    echo -e "${GREEN}       INSTALLATION SUCCESSFUL!           ${NC}"
    echo -e "${GREEN}==========================================${NC}"
    echo -e "Run command: ${GREEN}vps${NC} to start the menu."
else
    echo -e "${RED}[Error] Installation failed. 'vps' command not found.${NC}"
    exit 1
fi
