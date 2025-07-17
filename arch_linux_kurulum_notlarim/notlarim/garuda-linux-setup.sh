#!/bin/bash

# Garuda Linux Setup Script
# This script automates the installation and configuration of various software packages and settings

set -e  # Exit immediately if a command exits with a non-zero status

# Color codes for console output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print status messages
print_status() {
    echo -e "${GREEN}[*] $1${NC}"
}

# Function to print warning messages
print_warning() {
    echo -e "${YELLOW}[!] $1${NC}"
}

# Ensure script is run with sudo
if [[ $EUID -ne 0 ]]; then
   print_warning "This script must be run with sudo"
   exit 1
fi

# Update system
print_status "Updating system packages..."
pacman -Syu --noconfirm

# Install core packages in one command
print_status "Installing core packages..."
pacman -S vim apache mariadb php php-apache nodejs npm git flatpak ntfs-3g jre-openjdk terraform --noconfirm

# Apache Configuration
print_status "Configuring Apache..."
systemctl enable httpd
systemctl start httpd

# Configure Apache for PHP
sed -i 's/#LoadModule mpm_event_module/LoadModule mpm_prefork_module/g' /etc/httpd/conf/httpd.conf
sed -i 's/#LoadModule mpm_prefork_module/LoadModule mpm_event_module/g' /etc/httpd/conf/httpd.conf
echo "LoadModule php_module modules/libphp.so" >> /etc/httpd/conf/httpd.conf
echo "AddHandler php-script php" >> /etc/httpd/conf/httpd.conf
echo "Include conf/extra/php_module.conf" >> /etc/httpd/conf/httpd.conf
systemctl restart httpd

# MariaDB Configuration
print_status "Configuring MariaDB..."
mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
systemctl start mariadb
systemctl enable mariadb

# Adminer Setup
print_status "Setting up Adminer..."
mkdir -p /srv/http/adminer
wget -O /srv/http/adminer/index.php https://www.adminer.org/latest.php
chown -R http:http /srv/http/adminer
chmod -R 755 /srv/http/adminer

# PHP Configuration
sed -i 's/;extension=mysqli/extension=mysqli/g' /etc/php/php.ini

# Git Configuration
print_status "Configuring Git..."
git config --global user.email "durdu.kaan.kaltakkiran@gmail.com"
git config --global user.name "Kaan"

# Numlock Configuration
print_status "Configuring Numlock..."
mkdir -p /etc/sddm.conf.d
echo "[General]
Numlock=on" > /etc/sddm.conf.d/numlock.conf

# Optional: Create convenient aliases
print_status "Setting up aliases..."
if [ -f ~/.config/fish/config.fish ]; then
    echo "alias gunaydin='paru -Syu --noconfirm && flatpak update && paru -Rns \$(paru -Qtdq) --noconfirm'" >> ~/.config/fish/config.fish
fi

# Final system update and cleanup
print_status "Final system update and cleanup..."
flatpak update -y

# Post-installation message
echo -e "${GREEN}
Garuda Linux Setup Complete!
Please review the following post-installation tasks manually:
- Set root and user passwords (optional)
- Configure firewalld
- Adjust window placement and cursor settings
- Reduce GRUB boot time
- Configure desktop behaviors
- Install additional fonts
- Disable spell check if desired
${NC}"

# Optional reboot prompt
read -p "Would you like to reboot now? (y/n) " reboot_choice
if [[ $reboot_choice == "y" || $reboot_choice == "Y" ]]; then
    reboot
fi
