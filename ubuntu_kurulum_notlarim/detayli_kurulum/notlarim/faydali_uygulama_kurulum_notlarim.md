# Faydalı Uygulamala Kurulum Notları

## Syncthing(Senkronizasyon) Kurulumu

```BASH
# Add the release PGP keys:
sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
# Add the "stable" channel to your APT sources:
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
# Add the "candidate" channel to your APT sources:
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list
# Update and install syncthing:
sudo apt-get update
sudo apt-get install syncthing
syncthing --version
```

### Syncthing servis başlatma

```BASH
sudo systemctl enable syncthing@kaan.service
sudo systemctl start syncthing@kaan.service
systemctl status syncthing@kaan.service
```

### Syncthing port izin verme

```BASH
 sudo ufw allow 22000/tcp
 sudo ufw enable
```

> **Note**: Syncthing programını kullanmak için [adrese](http://127.0.0.1:8384) tıklayın.

## Spotify(Müzik) Kurulumu

```BASH
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client
```

## Ulauncher(Bilgisayarda Arama) Kurulumu

```BASH
sudo add-apt-repository universe -y && sudo add-apt-repository ppa:agornostal/ulauncher -y && sudo apt update && sudo apt install ulauncher
```

## Oracle VirtualBox(Sanal Makina) Kurulumu

```BASH
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo apt update
sudo apt install virtualbox-7.0
```

> **Note**: Kurulumda **kernel hatası alarsanız bu linkteki** çözümü uygulayın.

> [Kernel Hata Çözümü](https://superuser.com/questions/1285964/how-to-fix-and-prevent-virtualbox-kernel-driver-not-installed)

## AnyDesk(Uzaktan Bilgisayara Bağlanma) Kurulumu

```BASH
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
echo "deb http://deb.anydesk.com/ all main" | sudo tee
/etc/apt/sources.list.d/anydesk-stable.list
sudo cp /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d
sudo apt update
sudo apt install anydesk
```

## Bleachbit(Temizleyici) Kurulumu

```BASH
sudo apt install bleachbit -y
```

## Gnome Extansion Manager(Eklenti Yönetim) Kurulumu

```BASH
sudo apt install gnome-shell-extension-manager
```

## Alpaca(lokal yapay zeka) Kurulumu

```BASH
flatpak install flathub com.jeffser.Alpaca -y
```
