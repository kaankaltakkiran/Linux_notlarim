# Ubuntu 22.04 Kurulum

## Hızlı Kurulum

```bash
wget https://raw.githubusercontent.com/kaankaltakkiran/linux_setup/main/my_setup_commands.sh -O - | sh
```

### Detaylı Kurulum

```bash
# Depolarda yer alan paketlerin güncel listesini indir
sudo apt update
# Mevcut paketlerin yenisi varsa yükle
sudo apt upgrade

# Sürücülerin (driver) güncel dosyalarını yükle
sudo ubuntu-drivers autoinstall

# gnome-sushi, ffmpeg, imagemagick, magic-wormhole, vim paketleri yüklenir
sudo apt install gnome-sushi ffmpeg imagemagick magic-wormhole vim -y

# vscode kurulumu
## vscode için güvenilir depolara vscode'un kendi deposunu ve imzasını ekle
wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
## Depolarda yer alan paketlerin güncel listesini indir
sudo apt update
## vscode paketini kur
sudo apt install code -y

## Vscode Extension Kurulumu

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

#### Fare için ayarlar
##### Dock ünitesinde program simgesine tıklayınca küçült/büyült
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
##### Dock ünitesinde program simgesinde tekeri çevirince pencelere arasında gezin
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'

#### Anydesk kurulumu
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
sudo apt update
sudo apt install anydesk

#### Guake terminal kurulumu
sudo apt install guake

#### Gnome Extansion Manger Kurulumu
sudo apt install gnome-shell-extension-manager

#### Snap Store kurulumu
sudo apt update
sudo apt install snapd

#### Snap Store vlc, potify, discord, prospect-mail yükleme
sudo snap install vlc spotify discord prospect-mail -y

#### ulauncher kurulumu
sudo add-apt-repository universe -y && sudo add-apt-repository ppa:agornostal/ulauncher -y && sudo apt update && sudo apt install ulauncher

#### Kurulum sonrasında varsa gereksiz paketleri temizle
sudo apt autoremove -y

#### GIT ayarları
sudo apt install git -y
git config --global user.email 'durdu.kaan.kaltakkiran@gmail.com'
git config --global user.name 'Kaan Kaltakkıran'

echo "\n\n\n=== KURULUM TAMAMLANDI ===\n\n\n"
```
