# Tarayıcı Kurulum Notlarım

## Google Chrome Tarayıcısı Kurulumu

```BASH
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmour -o /usr/share/keyrings/chrome-keyring.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/chrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list'
sudo apt update -y
sudo apt install google-chrome-stable -y
```

> Note: sudo apt update yaparken hata alıyorsanız aşağıdaki komut ile fazlalık depoyu silin.

```bash
sudo rm /etc/apt/sources.list.d/google.list
```

- [Detaylı Kaynak](https://chatgpt.com/share/67094384-5c80-8008-a3b5-ac742963d2c5)

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

## LibreWolf Web Tarayıcısı Kurulumu

```BASH
sudo apt update && sudo apt install extrepo -y
sudo extrepo enable librewolf
sudo apt update && sudo apt install librewolf -y
```

## Zen Browser Web Tarayıcısı Kurulumu

```BASH
flatpak install flathub io.github.zen_browser.zen -y
```
