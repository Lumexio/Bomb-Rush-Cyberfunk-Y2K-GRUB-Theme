#!/bin/bash
# Installation script for Bomb Rush Cyberfunk Y2K GRUB Theme

set -e

# Colors for output
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${MAGENTA}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${MAGENTA}║  BOMB RUSH CYBERFUNK Y2K GRUB THEME INSTALLER           ║${NC}"
echo -e "${MAGENTA}╚══════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}This script must be run as root (use sudo)${NC}" 
   exit 1
fi

# Determine GRUB themes directory
if [ -d "/boot/grub/themes" ]; then
    GRUB_THEMES_DIR="/boot/grub/themes"
elif [ -d "/boot/grub2/themes" ]; then
    GRUB_THEMES_DIR="/boot/grub2/themes"
else
    echo -e "${CYAN}Creating GRUB themes directory...${NC}"
    mkdir -p /boot/grub/themes
    GRUB_THEMES_DIR="/boot/grub/themes"
fi

# Theme directory name
THEME_NAME="bomb-rush-cyberfunk-y2k"
THEME_DIR="$GRUB_THEMES_DIR/$THEME_NAME"

echo -e "${CYAN}Installing theme to: $THEME_DIR${NC}"

# Create theme directory
mkdir -p "$THEME_DIR"

# Copy theme files
echo -e "${CYAN}Copying theme files...${NC}"
cp -r theme/* "$THEME_DIR/"

# Determine GRUB config file location
if [ -f "/etc/default/grub" ]; then
    GRUB_CONFIG="/etc/default/grub"
else
    echo -e "${RED}Could not find GRUB configuration file${NC}"
    exit 1
fi

# Backup existing GRUB config
echo -e "${CYAN}Backing up GRUB configuration...${NC}"
cp "$GRUB_CONFIG" "$GRUB_CONFIG.backup.$(date +%Y%m%d-%H%M%S)"

# Update GRUB configuration
echo -e "${CYAN}Updating GRUB configuration...${NC}"

# Remove existing GRUB_THEME line if present
sed -i '/^GRUB_THEME=/d' "$GRUB_CONFIG"

# Add new theme line
echo "GRUB_THEME=\"$THEME_DIR/theme.txt\"" >> "$GRUB_CONFIG"

# Update GRUB
echo -e "${CYAN}Updating GRUB...${NC}"
if command -v update-grub &> /dev/null; then
    update-grub
elif command -v grub-mkconfig &> /dev/null; then
    if [ -f "/boot/grub/grub.cfg" ]; then
        grub-mkconfig -o /boot/grub/grub.cfg
    elif [ -f "/boot/grub2/grub.cfg" ]; then
        grub-mkconfig -o /boot/grub2/grub.cfg
    fi
else
    echo -e "${RED}Could not find GRUB update command${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  Installation completed successfully!                    ║${NC}"
echo -e "${GREEN}║  Reboot your system to see the new theme.                ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════════╝${NC}"
echo ""
