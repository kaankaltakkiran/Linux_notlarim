# Ubuntu(22.04 LTS Gnome) Kurulum Sonrası Yapılması Gerekenler

1. Hızlı kurulumun gerçekleştiği terminel ekranından ayrı bir terminal ekranı açıp `node.js` kurulumu tamamlanmalı.

```bash
nvm install 20
node -v # node.js versiyon
npm -v # npm versiyon
```

2. `Flatpak` kurulduktan sonra aşağıdaki komut çalıştırılmalı(bilgisayar yeniden başlayacak).

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo reboot
```

3. [Kod bilgisi olmadan kurulan yapay zeka aracı](https://github.com/pinokiocomputer/pinokio/releases) `pinokio`(Opsiyonel kurulum)

```bash
# Pinokio_2.15.1_amd64.deb indirdikten sonra komutu çalıştır
sudo dpkg -i Pinokio_2.15.1_amd64.deb
```
