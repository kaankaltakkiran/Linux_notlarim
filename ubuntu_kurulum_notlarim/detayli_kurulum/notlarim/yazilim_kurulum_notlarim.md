# Yazılım Kurulum Notlarım

## Docker Kurulumu

```BASH
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
```

## GIT Kurulumu

```BASH
sudo apt install git -y
git config --global user.email 'durdu.kaan.kaltakkiran@gmail.com'
git config --global user.name 'Kaan Kaltakkıran'
```

## Apache Kurulumu

```BASH
sudo apt install apache2 apache2-utils -y
sudo rm -f /var/www/html/index.html
sudo systemctl enable apache2
sudo service apache2 restart
```

## Apache Dizin Ayarları

```BASH
sudo adduser $USER www-data
sudo chown -R $USER:www-data /var/www/html/
```

## Masaüstüne HTML Klasörü Kısayolunun Açılması

```BASH
 cd ~/Desktop
ln -s /var/www/html/
sudo rm -f /var/www/html/index.html
```

## Php 7.4 Kurulumu

```BASH
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt install php7.4-intl php7.4-imagick php7.4-dev php7.4-zip php7.4-curl php7.4-xmlrpc php7.4-sqlite3 php7.4-gd php7.4-mysql php7.4-mbstring php7.4-pgsql php7.4-xml php7.4-redis libapache2-mod-php7.4 -y
sudo apt install composer -y
sudo service apache2 restart
```

> **Note**: php7.4-imagick hatasını kontrol et

## 2 Farklı PHP Sürümü Kurma Ve Bunları Kullanma

```bash
# PHP 7.4 Sürümünü kur
sudo apt install php7.4-intl php7.4-imagick php7.4-dev php7.4-zip php7.4-curl php7.4-xmlrpc php7.4-sqlite3 php7.4-gd php7.4-mysql php7.4-mbstring php7.4-pgsql php7.4-xml php7.4-redis libapache2-mod-php7.4 -y

# PHP 8.1 Sürümünü kur
sudo apt install php8.1-intl php8.1-imagick php8.1-dev php8.1-zip php8.1-curl php8.1-xmlrpc php8.1-sqlite3 php8.1-gd php8.1-mysql php8.1-mbstring php8.1-pgsql php8.1-xml php8.1-redis libapache2-mod-php8.1 -y

# PHP 8.1'i devre dışı bırak
sudo a2dismod php8.1
# PHP 7.4'ü etkinleştir
sudo a2enmod php7.4
# Değişikliğin geçerli olabilmesi için apache servisini yeniden başlat
sudo service apache2 restart

## CLI için PHP sürümü ayarlama
sudo update-alternatives --config php
sudo update-alternatives --set php /usr/bin/php7.4

```

## Adminer Kurulumu

```BASH
mkdir /var/www/html/adminer
wget -O /var/www/html/adminer/index.php https://www.adminer.org/latest.php
```

> **Note**: Adminer programını kullanmak için [adrese](http://127.0.0.1/adminer) tıklayın.

## MySQL / MariaDB Kurulumu

```BASH
# MySQL / MariaDB kurulumu
sudo apt install mariadb-server mariadb-client -y
# Sistem açıldığında MySQL servisini otomatik başlat
sudo systemctl enable mariadb
# MySQL servisini yeniden başlat
sudo service mariadb restart

# MySQL Root kullanıcısı için şifreyi değiştir
# sudo mysql_secure_installation
sudo mysql --user="root" --password="" --execute="SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root');"
```

## Node.js Ve Npm Kurulumu

```BASH
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
nvm install 20
node -v
npm -v
```

## Vscode Kurulumu

```BASH
wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code -y
```

## Vscode Extension Kurulumu

```BASH
# Auto Close Tag eklentisi
code --install-extension formulahendry.auto-close-tag
# Auto Rename Tag eklentisi
code --install-extension formulahendry.auto-rename-tag
# Better Comments eklentisi
code --install-extension aaron-bond.better-comments
# CodeSnap eklentisi
code --install-extension adpyke.codesnap
# DotENV eklentisi
code --install-extension mikestead.dotenv
# Duplicate action eklentisi
code --install-extension mrmlnc.vscode-duplicate
# Error Lens eklentisi
code --install-extension usernamehw.errorlens
# ESLint eklentisi
code --install-extension dbaeumer.vscode-eslint
# Excel Viewer  eklentisi
code --install-extension GrapeCity.gc-excelviewer
# Git Graph  eklentisi
code --install-extension mhutchie.git-graph
# Git History eklentisi
code --install-extension donjayamanne.githistory
# Git Stash  eklentisi
code --install-extension arturock.gitstash
# GitHub Copilot eklentisi
code --install-extension GitHub.copilot
# GitLens — Git supercharged eklentisi
code --install-extension eamodio.gitlens
# Highlight Matching Tag eklentisi
code --install-extension vincaslt.highlight-matching-tag
# HTML CSS Support eklentisi
code --install-extension ecmel.vscode-html-css
# Image preview  eklentisi
code --install-extension kisstkondoros.vscode-gutter-preview
# JavaScript (ES6) code snippets eklentisi
code --install-extension xabikos.JavaScriptSnippets
# json2ts eklentisi
code --install-extension GregorBiswanger.json2ts
# Live Server eklentisi
code --install-extension ritwickdey.LiveServer
# npm Intellisense eklentisi
code --install-extension christian-kohler.npm-intellisense
# One Dark Pro eklentisi
code --install-extension zhuangtongfa.Material-theme
# Path Intellisense eklentisi
code --install-extension christian-kohler.path-intellisense
# PHP Intelephense eklentisi
code --install-extension bmewburn.vscode-intelephense-client
# Prettier - Code formatter eklentisi
code --install-extension esbenp.prettier-vscode
# Rainbow CSV eklentisi
code --install-extension mechatroner.rainbow-csv
# SVG eklentisi
code --install-extension jock.svg
# Thunder Client eklentisi
code --install-extension rangav.vscode-thunder-client
# TODO Highlight eklentisi
code --install-extension wayou.vscode-todo-highlight
# Vetur eklentisi
code --install-extension  octref.vetur
# Vue.js Extension Pack eklentisi
code --install-extension mubaidr.vuejs-extension-pack
# Vue - Official eklentisi
code --install-extension  Vue.volar
# Vue 3 Snippets eklentisi
code --install-extension hollowtree.vue-snippets
# vscode-icons eklentisi
code --install-extension vscode-icons-team.vscode-icons
# vscode-pdf eklentisi
code --install-extension tomoki1207.pdf
# WakaTime eklentisi
code --install-extension WakaTime.vscode-wakatime
# indent-rainbow eklentisi
code --install-extension oderwat.indent-rainbow

```

## Doğru Kurulum Yapıldığının Test Edilmesi

```BASH
npm -v
node -v
php -v
apache2 -v
mysql --version
```
