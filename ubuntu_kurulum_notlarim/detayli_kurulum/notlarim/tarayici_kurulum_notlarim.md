# Tarayıcı Kurulum Notlarım

## Floorp Web Tarayıcısı Kurulumu

```BASH
curl -fsSL https://ppa.ablaze.one/KEY.gpg | sudo gpg --dearmor -o /usr/share/keyrings/Floorp.gpg
sudo curl -sS --compressed -o /etc/apt/sources.list.d/Floorp.list 'https://ppa.ablaze.one/Floorp.list'
sudo apt update -y
sudo apt install floorp -y
```

## Brave Web Tarayıcısı Kurulumu

```BASH
sudo apt install curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update -y
sudo apt install brave-browser -y
```

## Chromium Web Tarayıcısı Kurulumu

```BASH
sudo snap install chromium -y

```

## Tor Browser Web Tarayıcısı Kurulumu

```BASH
sudo apt install torbrowser-launcher -y
```

> **Note**: Bu kurulum uygulamasını indirir. Daha sonra bu kurulum programından `tor browser` kurulmalı
> [Detaylı Kaynak](https://linux.how2shout.com/how-to-install-tor-browser-on-ubuntu-22-04-lts-jammy/)
