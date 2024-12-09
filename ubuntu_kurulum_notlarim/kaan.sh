
# Başlangıç zamanını kaydet
start_time=$(date +%s)

# Paru Kurulumu
echo "Paru kurulumu başlıyor..."
sudo pacman -S --needed base-devel --noconfirm
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
rm -rf paru

# Sistem Güncellemeleri
echo "Sistem güncelleniyor..."
sudo pacman -Syu --noconfirm

# Grafik sürücüleri kurulumu
echo "Grafik sürücüleri yükleniyor..."
sudo pacman -S --needed nvidia nvidia-utils nvidia-settings --noconfirm # NVIDIA için
sudo pacman -S --needed xf86-video-amdgpu mesa --noconfirm             # AMD için

# Flatpak Kurulumu
echo "Flatpak kuruluyor..."
sudo pacman -S --needed flatpak gnome-software-packagekit-plugin --noconfirm

# Temel araçların kurulumu
echo "Temel araçlar yükleniyor..."
sudo pacman -S --needed ffmpeg gnupg wine imagemagick guake meld vim axel ncdu net-tools magic-wormhole hwinfo gnome-tweaks gnome-shell-extensions software-properties-common wget curl xclip htop neofetch preload --noconfirm

# AUR Paketlerinin Kurulumu
echo "AUR paketleri yükleniyor..."
paru -S --noconfirm code sublime-merge anydesk spotify docker syncthing google-chrome virtualbox fastfetch kdiskmark safeeyes

# Apache, PHP ve MariaDB Kurulumu
echo "Apache, PHP ve MariaDB yükleniyor..."
sudo pacman -S --needed apache php php-apache composer mariadb --noconfirm
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl enable mariadb
sudo systemctl start mariadb
sudo mysql_secure_installation

# Adminer Kurulumu
echo "Adminer kuruluyor..."
mkdir -p /srv/http/adminer
wget -O /srv/http/adminer/index.php https://www.adminer.org/latest.php
sudo chown -R http:http /srv/http/adminer

# Docker Kurulumu
echo "Docker yükleniyor..."
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER

# Node.js ve npm için NVM Kurulumu
echo "Node.js ve npm için NVM yükleniyor..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

# Git Yapılandırması
echo "Git yapılandırılıyor..."
git config --global user.email 'durdu.kaan.kaltakkiran@gmail.com'
git config --global user.name 'Kaan Kaltakkıran'

# Kurulum Sonrası Testler
echo "Kurulum sonrası testler yapılıyor..."
php -v
httpd -v
mysql --version
docker --version
flatpak --version

# Kurulum süresi hesaplama
end_time=$(date +%s)
elapsed_time=$(( end_time - start_time ))
minutes=$(( elapsed_time / 60 ))
seconds=$(( elapsed_time % 60 ))

# Başarı mesajı
echo -e "\n\e[33mKurulum $minutes dakika $seconds saniyede tamamlandı!\e[0m"
echo -e "\e[32mKurulum sonrası yapılması gerekenler için bu bağlantıya göz atın:\e[0m \e[34mhttps://github.com/kaankaltakkiran/Linux_notlarim/blob/main/ubuntu_kurulum_notlarim/detayli_kurulum/notlarim/kurulum_sonrasi_yapilacaklar.md\e[0m"
