# Faydalı Paketler

## Vi Editör
 **1976 Yılında** yayınlanmıştır.
 
 **Vim (Vi IMproved), metin düzenleme ve programlama** için kullanılan güçlü bir metin editörüdür.
 
Vi Editör Detaylı Bilgi: [Vi](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/linux_notlar%C4%B1m/faydal%C4%B1_paketler/vi_edit%C3%B6r.md)
## Wormhole
**2014 yılında**  yayınlandı.

**Wormhole genellikle komut satırı aracılığıyla kullanılan bir dosya paylaşımı aracıdır** ve dosyaları iki bilgisayar arasında hızlı ve güvenli bir şekilde aktarmanıza olanak tanır.
 
Wormhole Detaylı Bilgi: [wormhole](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/linux_notlar%C4%B1m/faydal%C4%B1_paketler/wormhole.md)
## İmagemagick
 **1990 Yılında** yayınlanmıştır.
 
Linux **komut satırında birden fazla görüntü dosyası üzerinde işlem yapmak** için en uygun paketlerden birisi imagemagick paketidir.
 
İmagemagick Detaylı Bilgi: [İmagemagick](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/linux_notlar%C4%B1m/faydal%C4%B1_paketler/imagemagick.md)
## Ffmpeg

 **2000 Yılında** yayınlanmıştır.

**FFmpeg, açık kaynaklı bir çoklu ortam çerçevesidir. Video ve ses dosyalarını işlemek, dönüştürmek, kodlamak ve çözmek** için kullanılır.
 
Ffmpeg Detaylı Bilgi: [ffmpeg](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/linux_notlar%C4%B1m/faydal%C4%B1_paketler/ffmpeg.md)

## Tldr Pages
**2013 yılında** yayınlanmıştır.

**Tldr (Too Long; Didn't Read), özellikle karmaşık veya uzun Linux komutlarını kısa ve öz** bir şekilde açıklamak için kullanılan bir kaynaktır.
 
Tldr Pages Detaylı Bilgi: [Tldr](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/linux_notlar%C4%B1m/faydal%C4%B1_paketler/tldr.md)
## Wine
 **1993 Yılında** yayınlanmıştır.
 
**Wine, Windows uygulamalarını Linux ve diğer Unix benzeri işletim sistemlerinde çalıştırmak için bir uyumluluk katmanıdır**.
 
Wine Detaylı Bilgi: [Wine](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/linux_notlar%C4%B1m/faydal%C4%B1_paketler/wine.md)


## Node Version Manager (NVM)

**Node Version Manager (NVM), Node.js'in farklı sürümlerini yönetmek için kullanılan bir araçtır. Node.js, JavaScript tabanlı uygulamaları çalıştırmak için kullanılan** bir çalışma zamanı ortamıdır ve sürekli olarak geliştirilmektedir. Her Node.js sürümü, yeni özellikler, performans iyileştirmeleri ve hata düzeltmeleri içerebilir.
 
Node Version Manager (NVM) Detaylı Bilgi: [NVM](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/linux_notlar%C4%B1m/faydal%C4%B1_paketler/NVM.md)


## gnome-sushi
**GNOME Sushi, Ubuntu'da kullanılabilen bir dosya önizleme aracıdır**. Bu araç, **dosyalara hızlıca göz atmanızı sağlar, böylece dosya içeriğini gerçekten açmadan önce içeriği** görebilirsiniz. 
### gnome-sushi paketi nasıl yüklenir ?
```BASH
sudo apt install gnome-sushi
```
> **Note:** GNOME Sushi'yi kullanmak oldukça basittir. **Dosya Gezgini'ni açın ve önizlemesini görmek istediğiniz dosyayı seçin. Dosyayı seçtikten sonra, üzerine gelin ve Space tuşuna basın**. GNOME Sushi, seçili dosyanın hızlı bir önizlemesini gösterecektir.

## Gromit-MPX
**Gromit-MPX size ekranın üzerine açıklama notları çizmenizi veya eklemenizi** sağlayan ücretsiz ve açık kaynaklı araçtır.
### gnome-sushi paketi nasıl yüklenir ?
```BASH
sudo apt install gromit-mpx 
```
Aşığıdaki komut ile **gromit-mpx** çalışır.
```BASH
 gromit-mpx 
```

Aşığıdaki komut ile **gromit-mpx'in ayarlarına gidersiniz vi editör ile** çalışır.
```BASH
sudo vi /etc/gromit-mpx/gromit-mpx.cfg 
```
> **Note:** Pause tuşuna bastıktan sonra mausun sol clickiyle kırmızı renkte çizim başlar.Tekrar pause tuşuna basınca çizimden çıkar. Ctrl e basılı tutulunca sarı renkte çililir. Shift tuşuna basılı tutup çizince mavi renkte çizer. ctrl+pause ile tüm çizimleri ekrandan siler.Alt+pause ile uygulamadan çıkar.

## Pip(python)
**pip, Python programlama dilinde paket yönetimi için kullanılan** bir araçtır. 
### Pip nasıl yüklenir ?
```BASH
sudo apt install python3-pip
```
Pyhton paketlerinin olduğu web sitesi Detaylı Bilgi: [Pypi](https://pypi.org/)
## screenpen
**Doğrudan ekranda çizim yapılmasına olanak tanıyan ekran açıklama yazılımıdır.**
### screenpen paketi nasıl yüklenir ?
```BASH
pip install screenpen
```
## PV (Pipe Viewer)
**PV (Pipe Viewer) bir boru hattı üzerinden veri akışını gözlemlemek için yazılmış terminal tabanlı** bir araçtır. 

**Görsel bir gösterge sayesinde ne kadar veri gönderiyor, ne kadar süre içerisinde tamamlandı gibi iki komutun arasındaki sürecin detaylarını** gösteriyor.

### PV (Pipe Viewer)paketi nasıl yüklenir ?
```BASH
 sudo apt-get install pv -y
```
Aşığıdaki örnek dosya kopyalama işlemine örnektir:
```BASH
 pv kaynak_dosya > hedef_dosya
```
## Meld
**meld, Ubuntu ve diğer Linux dağıtımları için kullanılabilen bir dosya ve dizin karşılaştırma** aracıdır.
### PV (Pipe Viewer)paketi nasıl yüklenir ?
```BASH
sudo apt install meld
```
## axel
**axel, komut satırı tabanlı bir indirme** yöneticisidir. **İndirme işlemlerini hızlandırmak için çoklu bağlantı** kullanır. 
### axel paketi nasıl yüklenir ?
```BASH
sudo apt install axel
```
Aşığıdaki komut **ile 10 parçadan daha hızlı** indirir.
```BASH
axel n-10  http://example.com/bigfile.zip
```
## ncdu
**ncdu (Ncurses Disk Usage), terminal tabanlı bir disk kullanımı analiz** aracıdır.

Bu araç, **diskteki dosya ve dizinleri boyutlarına göre listeler ve böylece disk alanının nerede ve ne kadarının kullanıldığını görsel olarak** sunar. 

ncdu, kullanıcının **disk kullanımını anlamasına ve gerektiğinde gereksiz dosyaları veya dizinleri belirleyip silmesine** olanak tanır.

### ncdu paketi nasıl yüklenir ?
```BASH
sudo apt install ncdu
```
Örneğin, **ev dizininizin disk kullanımını analiz etmek** istiyorsanız, aşağıdaki gibi bir komut kullanabilirsiniz:
```BASH
ncdu ~
```
## xclip
xclip **sayılı metinler veya dosyaları X sunucusuna (grafik arayüz) kopyalamak ve yapıştırmak** için kullanılır. 

### xclip paketi nasıl yüklenir ?
```BASH
sudo apt install xclip
```
Örneğin, aşığıdaki komut **metni kopyalar**
```BASH
echo "Bu metin panoya kopyalanacak." | xclip
```
Aşığıdaki **komut ile kopyalananlar** gözükür
```BASH
xclip -o
```
## net-tools
**net-tools, ağ yönetimi ve izleme araçlarını içeren** bir pakettir.

### net-tools paketi nasıl yüklenir ?
```BASH
sudo apt install net-tools
```
Örneğin, aşığıdaki **komut ip adresini** gösterir.
```BASH
ifconfig
```
## hwinfo
**hwinfo, donanım bilgilerini detaylı bir şekilde görüntülemek için kullanılan** bir araçtır.

**Bu araç, işlemci, bellek, diskler, grafik kartları, ağ arabirimleri ve diğer donanım bileşenleri** hakkında bilgi sağlar.

### hwinfo paketi nasıl yüklenir ?
```BASH
sudo apt install hwinfo
```
Örneğin, aşığıdaki **hwinfo'yu kullanarak donanım bilgilerini** gösterir.
```BASH
sudo hwinfo
```
Örneğin, aşığıdaki **bellek bilgilerini görmek için** gösterir.
```BASH
sudo hwinfo --memory
```
## hardinfo
**hardinfo, Ubuntu'da donanım ve sistem bilgilerini detaylı bir şekilde görüntülemek için kullanılan bir araçtır**.

Bu araç, **işlemci, bellek, diskler, grafik kartları, ağ arabirimleri ve diğer donanım bileşenleri** hakkında bilgi sağlar. 

### hardinfo paketi nasıl yüklenir ?
```BASH
sudo apt install hardinfo
```
## gnome-shell-extension-manager
**gnome-shell-extension-manager, GNOME masaüstü ortamında kabuk (shell) uzantılarını yönetmek için kullanılan bir araçtır.** 

Bu araç, **GNOME Shell'e eklenmiş uzantıları görüntülemenize, etkinleştirmenize, devre dışı bırakmanıza veya kaldırmanıza** olanak tanır.

### gnome-shell-extension-manager paketi nasıl yüklenir ?
```BASH
sudo apt install gnome-shell-extension-manager
```
## software-properties-common
**software-properties-common, Ubuntu'daki yazılım paketi kaynaklarını yönetmek için kullanılan bir yardımcı** araçtır. 

Bu araç, **Ubuntu yazılım kaynaklarını eklemek, kaldırmak veya yapılandırmak** için kullanılır.

### software-properties-common paketi nasıl yüklenir ?
```BASH
sudo apt install software-properties-common
```

## apt-transport-https
**apt-transport-https, HTTPS üzerinden güvenli bir şekilde Ubuntu paket deposundan paketler indirmek** için gereken bir araçtır. 

**HTTPS protokolü, indirilen paketlerin güvenliğini artırır ve ortadaki kişilerin paketleri manipüle** etmesini önler.

### apt-transport-httpspaketi nasıl yüklenir ?
```BASH
sudo apt install apt-transport-https
```
## wget ve curl
**wget ve curl, Ubuntu'da internet üzerinden dosya indirmek veya web sunucularına istek göndermek için kullanılan komut satırı** araçlarıdır.

### wget nasıl yüklenir ?
```BASH
sudo apt install wget
```
Örneğin, aşığıdaki komut **Ubuntu disk görüntüsünü** indirir.
```BASH
wget http://releases.ubuntu.com/20.04/ubuntu-20.04.3-desktop-amd64.iso
```

### curl nasıl yüklenir ?
```BASH
sudo apt install curl
```
Örneğin, aşığıdaki komut **Ubuntu disk görüntüsünü** indirir.
```BASH
curl http://releases.ubuntu.com/20.04/ubuntu-20.04.3-desktop-amd64.iso
```




