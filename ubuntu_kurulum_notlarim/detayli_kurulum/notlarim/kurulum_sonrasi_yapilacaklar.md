# Ubuntu(22.04 LTS Gnome) Kurulum Sonrası Yapılması Gerekenler

1.  #### Hızlı kurulumun gerçekleştiği terminel ekranından ayrı bir terminal ekranı açıp `node.js` kurulumu tamamlanmalı.

```bash
nvm install 20
node -v # node.js versiyon
npm -v # npm versiyon
```

2.  #### [Sağ Tıklama İle Yeni Dosya Oluşturma](https://github.com/kaankaltakkiran/Gnome_right_click_create_new_file)

```bash
wget https://raw.githubusercontent.com/kaankaltakkiran/Gnome_right_click_create_new_file/main/install-script.sh -O - | bash
```

3. #### [Alias](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/linux_notlarim/notlarim/komut_notlarim/ayrintili_komutlar.md) `.bashrc` dosyasına alias ekleme rehberi

- ##### bashrc dosyasına alias nasıl eklenir ?

vi editör ile bashrc dosyasını açıktıntan sonra `i` (insert) tuşu ile düzenleme modunu aktifleştiriyoruz. Daha sonra eklemek istediğimiz aliasımızı bashrc dosyasına yapıştırıyoruz. <kbd>Escape</kbd> tuşu ile insert modundan çıkıyoruz. Son olarak `:wq ` ile dosyayı kaydedip çıkıyoruz.

vi editör ile bashrc dosyasına gir:

```BASH
vi ~/.bashrc
```

```bash
# Disk alanını anlamlı gösterir
alias disk='du -h'
# Güncelleme işlemi
alias gunaydin='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo snap refresh && flatpak update'
# Komut satırında gün,tarih,saat,isim gibi bilgileri gösterme
PS1="\n\[\e[35m\]\D{%Y-%m-%d}, \t\[\e[m\] \[\e[31m\]\u\[\e[m\]@\[\e[36m\]KaanPc\[\e[m\]:\[\e[32m\]\w\[\e[m\]\n\$ "
```

- Son olarak değiliklerin aktif olması `bashrc` dosyasını aşağıdaki komut ile yeniden yüklüyoruz. Bu şekilde artık kalıcı olarak aliasa sahip oluruz.

```BASH
source ~/.bashrc
```

4. #### Klavye Kısayolları

| Name            | Command                                                                                        | Shortcut                                                 |
| --------------- | ---------------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| Easy Screenshot | sh -c 'gnome-screenshot -af /home/$USER/Pictures/Screenshots/$(date "+%Y.%m.%d-%H.%M.%S").png' | <kbd>⇧ Shift</kbd> + <kbd>⌘ Command</kbd> + <kbd>S</kbd> |
| Guake Terminal  | guake -t                                                                                       | <kbd>f12</kbd>                                           |

5. #### `Flatpak` kurulduktan sonra aşağıdaki komut çalıştırılmalı(bilgisayar yeniden başlayacak).

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo reboot
```

6. #### Kurulması Opsiyonel Olan Yazılımlar/Programramlar

- [Script İle Gnome Eklenti Yükleme(Stabil Değil)](https://github.com/kaankaltakkiran/Gnome_extension_installaion)

- [Alpaca(Lokal Yapay Zeka Aracı (Opsiyonel)](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/ubuntu_kurulum_notlarim/detayli_kurulum/notlarim/faydali_uygulama_kurulum_notlarim.md)

- [Pinokio, Kod Bilgisi Olmadan Kurulan Yapay Zeka Aracı(Opsiyonel)](https://github.com/pinokiocomputer/pinokio/releases)

- [Portmaster, Detaylı Ağ Güvenliği Aracı Kurulumu(Opsiyonel)](https://safing.io/download/)
