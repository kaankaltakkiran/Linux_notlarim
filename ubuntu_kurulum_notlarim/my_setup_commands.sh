# Başlangıç zamanını kaydet
start_time=$(date +%s)

# Ana kurulum işlemleri
echo "Kurulum başlıyor..."

# Depolarda yer alan paketlerin güncel listesini indir
sudo apt update 
# Mevcut paketlerin yenisi varsa yükle
sudo apt upgrade -y

# Sürücülerin (driver) güncel dosyalarını yükle
sudo ubuntu-drivers autoinstall

# Flatpak Kurulumu
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y

# Sık kullanılan faydalı paketleri kur(Tor Browser)
sudo apt install ffmpeg gnupg wine  imagemagick guake guake-indicator pv meld vim axel ncdu net-tools  magic-wormhole gnome-sushi hwinfo hardinfo gnome-shell-extension-manager software-properties-common apt-transport-https wget curl gnome-screenshot xclip neofetch bleachbit torbrowser-launcher -y


# vscode kurulumu
## vscode için güvenilir depolara vscode'un kendi deposunu ve imzasını ekle
wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list

# SublimeMerge kurulumu
sudo apt-get install apt-transport-https
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# AnyDesk kurulumu
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
sudo cp /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d

# Spotify kurulumu
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

# Docker kurulumu
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Syncthing kurulumu

## Add the release PGP keys:
sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
## Add the "stable" channel to your APT sources:
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
## Add the "candidate" channel to your APT sources:
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list

# Floorp Web Tarayıcısı Kurulumu

curl -fsSL https://ppa.ablaze.one/KEY.gpg | sudo gpg --dearmor -o /usr/share/keyrings/Floorp.gpg
sudo curl -sS --compressed -o /etc/apt/sources.list.d/Floorp.list 'https://ppa.ablaze.one/Floorp.list'

# Brave Web Tarayıcısı Kurulumu
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Google Chrome Depo Ekleme
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmour -o /usr/share/keyrings/chrome-keyring.gpg 
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/chrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list' 


# VirtualBox Güncel Depo Ekleme
curl https://www.virtualbox.org/download/oracle_vbox_2016.asc | gpg --dearmor > oracle_vbox_2016.gpg
curl https://www.virtualbox.org/download/oracle_vbox.asc | gpg --dearmor > oracle_vbox.gpg
sudo install -o root -g root -m 644 oracle_vbox_2016.gpg /etc/apt/trusted.gpg.d/
sudo install -o root -g root -m 644 oracle_vbox.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

# Depolarda yer alan paketlerin güncel listesini indir
sudo apt update -y

# Google Chrome Kurulumu
sudo apt install google-chrome-stable -y

# VirtualBox Kurulumu
sudo apt install -y linux-headers-$(uname -r) dkms
sudo apt install virtualbox-7.0 -y

# Virt Manager Kurulumu
sudo apt install -y cpu-checker
sudo apt install -y qemu-kvm virt-manager libvirt-daemon-system virtinst libvirt-clients bridge-utils
sudo systemctl enable --now libvirtd
sudo systemctl start libvirtd
sudo usermod -aG kvm $USER
sudo usermod -aG libvirt $USER

# Spotify, Anydesk, SublimeMerge, Vscode, Docker, Syncthing, Floorp, Brave kurulum
sudo apt install spotify-client anydesk sublime-merge code  docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin syncthing floorp brave-browser -y

# Apache kurulumu
sudo apt install apache2 apache2-utils -y
sudo rm -f /var/www/html/index.html
sudo systemctl enable apache2
sudo service apache2 restart
sudo adduser $USER www-data
sudo chown -R $USER:www-data /var/www/html/

# Php 7.4 kurulumu
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt install php7.4-intl php7.4-imagick php7.4-dev php7.4-zip php7.4-curl php7.4-xmlrpc php7.4-sqlite3 php7.4-gd php7.4-mysql php7.4-mbstring php7.4-pgsql php7.4-xml php7.4-redis libapache2-mod-php7.4 -y
sudo apt install composer -y
sudo service apache2 restart

# MySQL / MariaDB kurulumu
sudo apt install mariadb-server mariadb-client -y
sudo systemctl enable mariadb
sudo service mariadb restart
# MySQL Root kullanıcısı için şifreyi değiştir
sudo mysql --user="root" --password="" --execute="SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root')"

# Adminer kurulumu
cd /var/www/html
mkdir /var/www/html/adminer
wget -O /var/www/html/adminer/index.php https://www.adminer.org/latest.php

# Syncthing servis başlatma
 sudo systemctl enable syncthing@kaan.service
 sudo systemctl start syncthing@kaan.service

# Syncthing port izin verme
 sudo ufw allow 22000/tcp
 sudo ufw enable


# Fare için ayarlar
## Dock ünitesinde program simgesine tıklayınca küçült/büyült
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
## Dock ünitesinde program simgesinde tekeri çevirince pencelere arasında gezin
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'

## Guake terminal,Gnome Extansion Manger, Gnome Tweaks, Kurulumu
sudo apt install guake gnome-shell-extension-manager -y

# Snap Store kurulumu

sudo apt install snapd -y

echo "Snap Uygulamaları Kuruluyor..."

# Snap Store vlc, discord, telegram, prospect-mail, postman, chromium kurulum
sudo snap install vlc discord telegram-desktop prospect-mail postman chromium

# Snap Store obsidian, micro, identity, mousai, czkawka, onionshare, gimp, localsend, onlyoffice kurulum
sudo snap install obsidian --classic && sudo snap install micro --classic && sudo snap install identity && sudo snap install mousai && sudo snap install czkawka && sudo snap install onionshare && sudo snap install gimp && sudo snap install localsend  &&  sudo snap install onlyoffice-desktopeditors

echo "Snap Uygulamaları Kurulumu Tamamlandı"

# Node.js ve Npm İçin Nvm Kurulumu
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

# GIT ayarları
sudo apt install git -y
git config --global user.email 'durdu.kaan.kaltakkiran@gmail.com'
git config --global user.name 'Kaan Kaltakkıran'

# Apache2 html klasörünü masaüstüne kısayol olarak ekle
ln -s /var/www/html "$(xdg-user-dir DESKTOP)/html"

# Ekran Görüntülerin kaydedileceği klasörü oluştur ve izin ver
mkdir -p ~/Pictures/Screenshots
sudo chmod ugo+rwx /home/$USER/Pictures/Screenshots/*

# Kurulum test
php -v
apache2 -v
mysql --version
docker --version
syncthing --version
flatpak --version

# Kurulum bittiğinde bitiş zamanını al
end_time=$(date +%s)

# Toplam süreyi hesapla
elapsed_time=$(( end_time - start_time ))

# Süreyi dakika ve saniye formatına çevir
minutes=$(( elapsed_time / 60 ))
seconds=$(( elapsed_time % 60 ))

# Sonuç mesajı
echo "Kurulum $minutes dakika ve $seconds saniyede başarılı bir şekilde tamamlandı.(Yeniden başlatma önerilir.)"

# Kurulum sonrası yapılması gerekenler(Node.js,apeche) için bilgilendirme
printf "\e[32mKurulum sonrası yapılması gerekenler için bu bağlantıya tıklayın:\e[0m \e[34m https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/ubuntu_kurulum_notlarim/detayli_kurulum/notlarim/kurulum_sonrasi_yapilacaklar.md \e[0m\n"


