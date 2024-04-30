## Genel Güncelleme İşlemleri
sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY |sudo apt-key add -

sudo echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list

sudo cp /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d


sudo apt update

sudo apt install anydesk

```BASH
sudo apt update -y
sudo apt upgrade -y
```
## .Bashrc komutlarım

```BASH
# Disk alanını anlamlı gösterir
alias disk='du -h'
# Güncelleme işlemi
alias gunaydin='sudo apt update --fix-missing -y && sudo apt upgrade -y && sudo apt autoremove -y'
# Komut satırında gün,tarih,saat,isim gibi bilgileri gösterme
PS1="\n\[\e[35m\]\D{%Y-%m-%d}, \t\[\e[m\] \[\e[31m\]\u\[\e[m\]@\[\e[36m\]KaanPc\[\e[m\]:\[\e[32m\]\w\[\e[m\]\n\$ "
```
## Faydalı Paketler
```BASH
# Sık kullanılan faydalı paketleri kur
sudo apt install git npm guake guake-indicator pv meld vim axel ncdu xclip net-tools caffeine vlc chromium-browser magic-wormhole gnome-sushi hwinfo hardinfo gnome-shell-extension-manager software-properties-common apt-transport-https wget curl -y
```


## GIT Kurulumu

```BASH
sudo apt install git -y
git config --global user.email 'durdu.kaan.kaltakkiran@gmail.com'
git config --global user.name 'Kaan Kaltakkıran'
```

## AnyDesk Kurulumu

```BASH
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
sudo apt update
sudo apt install anydesk
```

## Gnome-sushi Paketi Kurulumu
```BASH
sudo apt install gnome-sushi 
```
## Ffmpeg Paketi Kurulumu
```BASH
sudo apt install  ffmpeg 
```
## Imagemagick Paketi Kurulumu
```BASH
sudo apt install imagemagick 
```
## Magic-wormhole Paketi Kurulumu
```BASH
sudo apt install magic-wormhole 
```
## Metin editör  Paketi Kurulumu
```BASH
sudo apt install vim
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

## Snap Store Kurulumu

```BASH
sudo apt update
sudo apt install snapd
```

## Vlc Kurulumu

```BASH
sudo snap install vlc
```

## Spotify Kurulumu

```BASH
sudo snap install spotify
```

## Discord Kurulumu

```BASH
sudo snap install discord
```

## Prospect-mail Kurulumu

```BASH
sudo snap install prospect-mail
```
## ulauncher kurulumu
```BASH
sudo add-apt-repository universe -y && sudo add-apt-repository ppa:agornostal/ulauncher -y && sudo apt update && sudo apt install ulauncher
```


## Guake Terminal Kurulumu

```BASH
sudo apt install guake
```

## Gnome extansion manager kurulumu

```BASH
sudo apt install gnome-shell-extension-manager
```
