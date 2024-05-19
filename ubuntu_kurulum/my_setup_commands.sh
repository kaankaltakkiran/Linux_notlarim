# Depolarda yer alan paketlerin güncel listesini indir
sudo apt update -y
# Mevcut paketlerin yenisi varsa yükle
sudo apt upgrade -y

# Sürücülerin (driver) güncel dosyalarını yükle
sudo ubuntu-drivers autoinstall 

# Sık kullanılan faydalı paketleri kur
sudo apt install ffmpeg wine  imagemagick guake guake-indicator pv meld vim axel ncdu xclip net-tools  magic-wormhole gnome-sushi hwinfo hardinfo gnome-shell-extension-manager software-properties-common apt-transport-https wget curl -y


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

## Depolarda yer alan paketlerin güncel listesini indir
sudo apt update -y

## Spotify,Anydesk,SublimeMerge,Vscode yükle
sudo apt install spotify-client anydesk sublime-merge code -y

#### Fare için ayarlar
##### Dock ünitesinde program simgesine tıklayınca küçült/büyült
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
##### Dock ünitesinde program simgesinde tekeri çevirince pencelere arasında gezin
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'

#### Guake terminal kurulumu
sudo apt install guake -y

#### Gnome Extansion Manger Kurulumu
sudo apt install gnome-shell-extension-manager -y

#### Snap Store kurulumu

sudo apt install snapd

#### Snap Store vlc,discord, prospect-mail yükleme
sudo snap install vlc discord prospect-mail 

#### Node.js ve Npm İçin Nvm Kurulumu
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash



#### GIT ayarları
sudo apt install git -y
git config --global user.email 'durdu.kaan.kaltakkiran@gmail.com'
git config --global user.name 'Kaan Kaltakkıran'

echo "\n\n\n=== KURULUM TAMAMLANDI ===\n\n\n"
