# Faydalı Paket Kurulum Notlarım

## Faydalı Paketler

```BASH
# Sık kullanılan faydalı paketleri kur
sudo apt install ffmpeg gnupg wine  imagemagick guake guake-indicator pv meld vim axel ncdu xclip net-tools caffeine magic-wormhole gnome-sushi hwinfo hardinfo gnome-shell-extension-manager software-properties-common apt-transport-https wget curl gnome-screenshot xclip -y
```

## jq

Terminalde json verileri düzgünce gösterir.

### jq paketi nasıl yüklenir ?

```BASH
sudo apt install -y jq
```

## Ekran görüntüsü kurulum ve ayarlar

Aşağıdaki komut ile `gnome-screenshot` ve `xclip` kurulur.

```BASH
# gnome-screenshot ve xclip kurulumu
sudo apt install gnome-screenshot xclip -y
```

Daha sonra aşşığıdaki ayarlar yapılır:

Ayarlar | Klavye | Klavye Kısayolları | Kısayolları Gör ve Özelleştir | Özel Kısayollar | menüsünden yeni `+`tuşuna basarak kısayol tanımlanır. Resimler dizinine bu ekran görüntülerini kaydetmek için KOMUT kısmına aşağıdaki komut girilir:

> **Note**:Bilgisayar dili ingilizce olanlar için:

> Settings | Keyboard | Keyboard Shortcuts | View and Customize Shortcuts | Custom Shortcuts | menüsünden `+` tuşuna basarak yeni kısayol tanımlanır. Name alanına istediğiniz ismi verebilirsiniz. `Pictures` dizinine bu ekran görüntülerini kaydetmek için COMMAND kısmına aşağıdaki komut girilir:

```BASH
sh -c 'gnome-screenshot -af /home/$USER/Resimler/$(date "+%Y.%m.%d-%H.%M.%S").png'
```

Son olarak `Kısayol Ayarla` diyerek istediğiniz kombinasyonu ayarlayabilirsiniz:

> **Note**:Bilgisayar dili ingilizce olanlar için: `Set Shortcuts`

örnek: <kbd>Shift</kbd> + <kbd>Alt</kbd> + <kbd>S</kbd>

> **Note**: Eğer ekran görüntüsü aldığınız halde ekran görüntüsü kaydedilmemişse aşşığıdaki komutu girerek resim klasörüne izin verin.

```BASH
sudo chmod ugo+rwx /home/$USER/Resimler/*
```

> Verdiğiniz izni geri almak için aşağıdaki komutu girin:

```BASH
sudo chmod ugo-rwx /home/$USER/Resimler/*
```

> **Note**:Bilgisayar dili ingilizce olanlar için: Resimler yerine Pictures yazmalısınız.

![İngilizce Ayar](/ubuntu_kurulum_notlarim/image/screenshot_shourtcut.png)

## Gnome-sushi(Dosya Açma) Paketi Kurulumu

```BASH
sudo apt install gnome-sushi
```

## Ffmpeg(Video) Paketi Kurulumu

```BASH
sudo apt install  ffmpeg
```

## Imagemagick(Resim) Paketi Kurulumu

```BASH
sudo apt install imagemagick
```

## Magic-wormhole(Dosya Yollama) Paketi Kurulumu

```BASH
sudo apt install magic-wormhole
```

## Vi Editör (Metin Editör) Paketi Kurulumu

```BASH
sudo apt install vim
```

## Guake (Terminal) Kurulumu

```BASH
sudo apt install guake
```

## Neofetch(Sistem Bilgisi) Kurulumu

```BASH
 sudo apt install neofetch
```
