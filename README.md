# Linux Notlarım
## Vim Editör
 **1991 Yılında** yayınlanmıştır.
 
 **Vim (Vi IMproved), metin düzenleme ve programlama** için kullanılan güçlü bir metin editörüdür.
 
Vim Editör Detaylı Bilgi: [Vim](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/notlar%C4%B1m/vim_edit%C3%B6r.md)
## Wormhole
**2014 yılında**  yayınlandı.

**Wormhole genellikle komut satırı aracılığıyla kullanılan bir dosya paylaşımı aracıdır** ve dosyaları iki bilgisayar arasında hızlı ve güvenli bir şekilde aktarmanıza olanak tanır.
 
Wormhole Detaylı Bilgi: [wormhole](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/notlar%C4%B1m/wormhole.md)
## İmagemagick
 **1990 Yılında** yayınlanmıştır.
 
Linux **komut satırında birden fazla görüntü dosyası üzerinde işlem yapmak** için en uygun paketlerden birisi imagemagick paketidir.
 
İmagemagick Detaylı Bilgi: [İmagemagick](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/notlar%C4%B1m/imagemagick.md)
## Ffmpeg

 **2000 Yılında** yayınlanmıştır.

**FFmpeg, açık kaynaklı bir çoklu ortam çerçevesidir. Video ve ses dosyalarını işlemek, dönüştürmek, kodlamak ve çözmek** için kullanılır.
 
Ffmpeg Detaylı Bilgi: [ffmpeg](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/notlar%C4%B1m/ffmpeg.md)
## Linux Shell OperatörLeri
**Linux komutlarının zincirlenmesi, birkaç komutun birleştirilmesi ve aralarında kullanılan operatörün davranışına göre yürütülmesi** anlamına gelir.
 
Shell OperatörLeri Detaylı Bilgi: [Shell OperatörLeri](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/notlar%C4%B1m/shell_operat%C3%B6rleri.md)
## Tldr Pages
**2013 yılında** yayınlanmıştır.

**Tldr (Too Long; Didn't Read), özellikle karmaşık veya uzun Linux komutlarını kısa ve öz** bir şekilde açıklamak için kullanılan bir kaynaktır.
 
Tldr Pages Detaylı Bilgi: [Tldr](https://github.com/kaankaltakkiran/Linux_notlarim/edit/main/notlar%C4%B1m/tldr.md)

## Linux Dosya Hiyerarşisi
|Komut                        |Açıklama                      
-------------------------------|-----------------------------|
|`/bin`            |Kullanıcı ve sistem yöneticisine ait çalıştırılabilir dosyaları barındırır.|
|`/opt`            | Add-on yazılımların bulunduğu alandır. |
|`/boot`|Linux Kernelini barındıran (vmlinuz), sistem haritalarını ve ikinci seviye boot yükleyicilerini barındıran dizindir.|
|`/root`            |  Bir sistemde en yetkili kullanıcı olan "root" kullanıcısına ait dizindir. |
|`/dev`            |  Donanımlara erişebilmek için gerekli dosyaları barındırır. (/media)  |
|`/sbin`            |  Sistem yöneticisine ait çalıştırılabilir dosyaları barındırır. |
|`/etc`            | Sistemde çalışan servislerin konfigürasyonları için gerekli dosyaları barındırır. (Telnet, ssh, samba, apache, dhcp vb.) Servisleri başlatma betikleri de burada bulunu |
|`/home`            |  Kullanıcılara ait dizindir.  |
|`/tmp`            |  Geçici dosyaların yer aldığı dizindir.  |
|`/lib`            | Sistem kütüphanelerini barındırır.  |
|`/usr`            | Paylaşılan dosyaların barındığı dizindir. Burada çalışabilen dosyalar bulunmakla beraber, doküman ve kullanıcı programlarına ait dosyalar da yer almaktadır.  |
|`/mnt`            |  Sisteme dışarıdan bağlanacak olan donanım aygıtlarının, bağlantı noktalarını belirten dizindir.|
|`/proc`            | Sistem hakkında gerekli bilgilerin bulunduğu sanal dizindir. Bilgisayar boot olduğunda Ram de oluşturulur. Sistemde çalışan geçici süreçler bu dizin altında çalışırlar.|

<kbd>Alt</kbd> + <kbd> Control</kbd>+ <kbd>T</kbd>:Bu komut ile terminal **ekranı açılır.**

<kbd> Control</kbd> + <kbd>U</kbd>:Bu komut, terminalda ki **en soldaki yazıyı siler.**

<kbd> Control</kbd> + <kbd>D</kbd>: Bu komut , **terminali kaydedip kapatır.**

<kbd> Control</kbd> + <kbd>L</kbd>: Bu komut , **terminali temizler.**

<kbd> Control</kbd> + <kbd>⇧ Shift</kbd> + <kbd>V</kbd>Bu komut , **kopyaladığımız içeriği terminale yapıştırır.**

<kbd> Control</kbd> + <kbd>R</kbd>Bu komut , terminalde **arama yapmamıza olanak sağlar.**
## gnome-sushi
**GNOME Sushi, Ubuntu'da kullanılabilen bir dosya önizleme aracıdır**. Bu araç, **dosyalara hızlıca göz atmanızı sağlar, böylece dosya içeriğini gerçekten açmadan önce içeriği** görebilirsiniz. 
### gnome-sushi paketi nasıl yüklenir ?
```BASH
sudo apt install gnome-sushi
```
> **Note:** GNOME Sushi'yi kullanmak oldukça basittir. **Dosya Gezgini'ni açın ve önizlemesini görmek istediğiniz dosyayı seçin. Dosyayı seçtikten sonra, üzerine gelin ve Space tuşuna basın**. GNOME Sushi, seçili dosyanın hızlı bir önizlemesini gösterecektir.

## which
**which komutu, bir programın tam yolunu (yani, çalıştırılabilir dosyanın dizin yolunu) bulmak** için kullanılır. Özellikle, bir komutun **hangi dizinde olduğunu belirlemek** için sıkça kullanılır.

Aşağıdaki komut **spotifyın yolunu** gösterir.

Örnek çıktı: /snap/bin/spotify
```BASH
which spotify
```
Aşağıdaki komut **firefox yolunu** gösterir.

Örnek çıktı: /usr/bin/firefox
```BASH
 which firefox
```
## alias
**alias komutu, kısayollar oluşturmanızı sağlar. Bu kısayollar, sık kullandığınız uzun komutları daha kısa bir adla** çağırmanıza izin verir.

Genel kullanımı aşağıdaki gibidir:
```BASH
alias kısayol="bu kısa yolun tetikleyeceği komut"
```
Aşağıdaki komut **disk boyutunu daha anlamlı gösteren du-h komutunu disk adında tanımlanır**. Daha sonra **komut satırına disk yazarak** komut çalıştırılır.
```BASH
alias disk='du -h'
```

## pwd
**pwd** komutunu hangi **dizinde (klasörde) olduğunuzu bulmak** için kullanılır.

Örnek çıktı: /home/kaan
```BASH
pwd
```
## man
Bu komutu **başka bir komutun ne işe yaradığını öğrenmek** için kullanılır. “man” komutu “manual”(kitapçık) kelimesinden gelir.
Aşağıdaki komut ls komutu ve aldığı parametreler hakkında bilgi verir.
```BASH
man ls
```
## cd
**cd** dosya sisteminde **gezinmek için** kullanılır.

Aşağıdaki komut Downloads dizinine gider
```BASH
cd  Downloads
```
Aşağıdaki komut bir üst dizine gider.
```BASH
cd ..
```
## wc
Linux’ta **wc (word count) komutu dosyada bulunan satır sayısını, kelime sayısını ve karakter sayısını** çıktı olarak verir.

Örnek çıktı:  5  5 40 kaan.txt
```BASH
wc kaan.txt
```
Aşağıdaki komut **-c ile sadece karakter sayısını** gösterir.
```BASH
wc -c kaan.txt 
```
Aşağıdaki komut **-l ile sadece satır sayısını** gösterir.
```BASH
wc -l kaan.txt 
```
Aşağıdaki komut **-c ile sadece kelime sayısını** gösterir.
```BASH
wc -w kaan.txt 
```

## ls
Dizin altında yer alan dosyaları listeler.

Örnek çıktı: Documents   kaan.txt 
```BASH
 ls
```
Aşağıdaki komut **gizli dosyları** da gösterir.
```BASH
ls -a
```
Aşağıdaki komut  **Değiştirilme tarihine** göre sıralar.
```BASH
ls -t
```
Aşağıdaki komut   **Ters sıralama yapar**.
```BASH
ls -r
```
Aşağıdaki komut **Dizin altındaki dosyaların kapasitesini, oluşturulma
tarihini ve özelliğini** gösterir.

```BASH
ls -l
```
Aşağıdaki komut **Dosya boyutuna göre** sıralar.
```BASH
ls -S
```
Aşağıdaki komut **/var klasörü altındaki dosyaları** listeler.
```BASH
ls /var
```
## wget
**internetten dosya çekmeye yarayan**, Web GET sözcüklerinin kısaltması olan bir program.

Örnek çıktı: adresi intall.sh dosyasına kaydeder.
```BASH
wget http://www.plugged.in/downloads/plugged.sh -O install.sh
```
Aşağıdaki komut dosya yarım kalmışsa, **kaldığı yerden devam ettirmek için -c parametresini** vermemiz yeterlidir.

```BASH
wget -c http://www.plugged.in/downloads/plugged.sh
```
Aşağıdaki komut **İndirme hızını limitlemek için limit-rate parametresi** kullanılır.

```BASH
wget --limit-rate=400k http://mirror.rackdc.com/CentOS/7/isos/x86_64/CentOS-7-x86_64-Minimal-1503-01.iso
```
Aşağıdaki komut Bazı durumlarda indirme işlemini kaç kez deneyeceğinizi belirtmek isteyebilirsiniz.
```BASH
wget --tries=10 http://plugged.in/downloads/plugged.sh
```
## mkdir
**mkdir klasör_adı:** belirtilen isimde **klasör oluşturur.**

Örnek çıktı: resimlerim adında klasör oluşturur.
```BASH
mkdir resimlerim 
```

Aşağıdaki komut  Bir dizini silmek için **rmdir** (remove directory) komutu kullanılır.

Örnek çıktı: reisimlerim adlı dizin silinir.
```BASH
rmdir resimlerim 
```
## touch
**touch dosya_adı:** belirtilen isimde **dosya oluşturur.**

Örnek çıktı: notlarım adında txt dosyası oluşturur.
```BASH
touch notlarım.txt 
```
## sed

Linux **sed komutu string bazlı dosyalarımızda bul ve değiştir işlemi** yapmamızı sağlar.

Örnek çıktı: kaan.txt yer alan ilk metnini son metni ile değiştirir.
```BASH
sed 's/ilk/son/g' kaan.txt
```
## cut
Bir **dosya içerisindeki satırların içerdiği alanları keserek belirli bir yere kopyalamak için** kullanılır.
Seçenekler
-b : Karakter konumlarını belirler.Byte tipinde işlem yaparak karakterleri byte birimiyle algılar.

-c : Karakter konumlarını belirler.Byte tipinde işlem yaparak karakterleri karakter olarak algılar.

-f : Özel bir ayıraçla ayrılan alanları tanımlamak amacıyla kullanılır.

-d : Ayıraçları tanımlamak için kullanılır.

-s : -f seçeneği kullanıldığı durumlarda, ayıraca sahip olmayan satırların atlanmasını sağlar.

-n : Tek byte’tan fazla olan karakterleri tamamiyle alır.

Örnek çıktı:
Ali 90
Ayşe 85
Mehmet 75
dosyasından şuı çıktıyı verir:
Ali
Ayşe
Mehmet

```BASH
cut -d ' ' -f 1 students.txt
```
## crontab
 Crontab bir komutu, **scripti ya da uygulamayı belirlediğiniz zaman veya belirli zaman aralıklarıyla çalışmasını** sağlamaktadır. 

Aşağıdaki komut **crontab komutunu düzenlemeye** yarar.
```BASH
crontab -e
```
Aşağıdaki komut **Crontab dosyasını listelemek ve içindeki işlerin listesini görmek** için  kullanıyoruz. 
```BASH
crontab -l
```
Aşağıdaki komut **Crontab dosyasını silmek** için 
```BASH
crontab -r
```
## xargs
bir komuttan gelen **standart çıktıyı başka bir komuta argüman** olarak yönlendirebilirsiniz.

Aşağıdaki komut önce mevcut dizindeki .txt dosyalarını listeleyecek (ls *.txt), sonra bu dosyaları "rm" komutuna argüman olarak geçirecek ve böylece hepsini silecektir.
```BASH
ls *.txt | xargs rm
```
## cp
Dosyaların kopyalanması için, cp (copy) komutu kullanılır.
> **Note:**  Dizin kopyalamak için **-r** parametresi gereklidir.

Örnek Kullanım: kaan.txt dosyasını Downloads dizinine kopyalar
```BASH
cp kaan.txt /home/kaan/Downloads
```

Örnek Kullanım: Music dizinini Videos dizininin içine kopyalar
```BASH
cp -r /home/kaan/Music /home/kaan/Videos
```

## rm
**rm -f** **Dosyaları ve dizinleri kaldırmak** için kullanılır.

> **Note:**  **rm -rf** komutu **bir dizinin içeriğini ve kendisini silmek** için kullanılır.

Aşağıdaki komut kaan.txt dosyasını siler.
```BASH
rm -f kaan.txt
```
Aşağıdaki komut deneme dizini ve içeriğini siler.
```BASH
 rm -rf deneme
```
Aşağıdaki komut **-i işlemi onaylamanızı ister**, hata olasılığını azaltmak için kullanılır.

Örnek çıktı: deneme.txt onay sorarak silmemezi sağlar.
```BASH
 rm -i deneme.txt
```
Aşağıdaki komut Bulunduğunuz **dizin altında bulunan tüm dosyaları silmek için ise ‘*’ karakteri** kullanılır.

Örnek çıktı: **a harfi ile başlayan** tüm dosyaları siler.
```BASH
rm -i a*
```
Örnek çıktı: **içinde at geçen** tüm dosyaları siler.
```BASH
 rm -i *at*
```
## cat
**cat dosya_adı**: **dosya içeriğini görüntülemek** için kullanılır.

Aşağıdaki komut kaan.txt dosyasının içeriğini gösterir.
```BASH
cat kaan.txt
```
## seq
seq ile girilen sayı değeri kadar sayı  oluşturur.

Örnek çıktı: 
1
2
3
4
5
```BASH
seq 5
```
Aşağıdaki komut **1 ile 20 arasında** sayı üretir.
```BASH
seq 1 20
```
Aşağıdaki komut **1 ile başlayan 5 er artan 36 biten** sayıları üretir.
Örnek çıktı: 
1
6
11
16
21
26
31
36
```BASH
seq 1 5 36
```
## grep
-r parametresi ile bulunduğunuz ya da belirttiğiniz bir dizinde bulunan tüm metin dosyalarında arama yapılır

Aşağıdaki komut içinde **a geçen dosyalarda arama** yapar
```BASH
grep -r a
```
Aşağıdaki komut **kaan.txt dosyasında -i ile küçük/büyük harf duyarsız şekilde kaan kelimesini arar**
```BASH
grep -i kaan kaan.txt
```

Aşağıdaki komut içinde **a geçen dosyalarda satır numarası ile arama** yapar
```BASH
grep -n a
```
Aşağıdaki komutta **-v** ile  **a geçmeyen dosyalarda satır numarası ile arama** yapar
```BASH
grep -v a Ankara
```

## less
 Dosyanın içeriğinin görüntülenmesini sağlar. **Dosyanın içeriği, yukarı ve aşağı ok
tuşları ile görüntülenebilir**.

Aşağıdaki komut kaan.txt dosyasının içeriğini gösterir.
```BASH
less kaan.txt
```
## history
**history** Bu komut, **geçmiş terminalde yazılan komutları** gösterir.

```BASH
history
```
## top
Bu komut, **Linux sistemlerinde çalışan işlem ve sistem kaynaklarını izlemek** için kullanılan bir komuttur.

```BASH
top
```
## du
**du** komutu (disk usage), Linux ve diğer Unix benzeri işletim sistemlerinde **disk kullanımını incelemek** için kullanılır.

```BASH
du
```
Aşağıdaki komut Disk kullanımını insan tarafından **okunabilir bir formatta (KB, MB, GB gibi)** gösterir.
```BASH
du -h
```
 Toplam kullanılan **disk alanını yalnızca bir satırda gösterir**, alt dizinlerin detaylarını göstermez.
 örnek çıktı: 3823084
```BASH
du -s
```
 **Boyutları megabayt cinsinden** gösterir.
 örnek çıktı: 3738
```BASH
du -m

```
## df
**df** Bu komut, mevcut dosya sistemi üzerindeki **disk bölümlerinin ve ağ dosya sistemlerinin kullanılan ve boş disk alanlarını raporlar.**

```BASH
df
```
## find
find komutu ile **dosya ve dizin aramaları yapılabilir**.

Aşağıdaki komut Desktop dizinindeki tüm dosya ve dizinleri getirir.

```BASH
find Desktop

```
Aşağıdaki komut **-name parametresi ile arananılan dosyayı** bulur.

Örnek çıktı: ./Downloads/kaan.txt
```BASH
find -name  kaan.txt

```
Aşağıdaki komut -name parametresi **ile k harfi ile biten** dosyaları bulur

Örnek çıktı: ./Downloads/denek.txt
```BASH
find Desktop -name *k

```
Aşağıdaki komut -type parametresi **ile dosya türüne göre göre** dosyaları bulur

-type d : dizin sonuçlarını gösterir.

Örnek çıktı: ./Downloads/kaan.jpg
```BASH
find Images -type d -name *png

```
## head
 varsayılan olarak **bir dosyanın ilk 10 satırını getirir.**
 
```BASH
head kaan.txt
```
Aşağıdaki komut **-n parameretsi ile ilk 2 satırı** getir.

```BASH
head -n2 kaan.txt 

```
## tail
 varsayılan olarak **bir dosyanın son 10 satırını getirir.**
 
```BASH
tail
```
Aşağıdaki komut **-n parameretsi ile son 2 satırı** getir.

```BASH
tail -n2 kaan.txt 

```
## pipe
 **| operatörü ise bir komutun çıktısını bir başka komuta girdi** olarak vermeye yarar.

Aşağıdaki komut **kaan.txt doyasının içeriğini okur head ile ilk 2 satırdaki içeriği** getirir.
```BASH
 cat kaan.txt | head -n 2
```

## date
Güncel Saat ve tarihi gösterir. 

örnek çıktı: Prş 18 Nis 2024 17:04:11 +03

```BASH
date
```
## uptime
**uptime:** sistemin açık kalma süresini gösterir.

 örnek çıktı:17:05:36 up  7:22,  3 users,  load average: 1,08, 0,70, 0,66

```BASH
uptime
```
## w
 **w** : sistemler ilgili özet bilgiler verir.
```BASH
w
```
## whoami
 **whoami:** giriş yapan kullanıcıyı gösterir. 
 
 örnek çıktı: kaan
```BASH
whoami
```
## uname
 **uname**: sistem bilgilerini getirir. –a tüm bilgilerle birlikte gelir.
  örnek çıktı: Linux
```BASH
uname
```
Aşşağıdaki komut daha ayrıntılı sistem bilgisi sunar.

ÖRnek çıktı : Linux KaanPc 6.5.0-27-generic #28~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC Fri Mar 15 10:51:06 UTC 2 x86_64 x86_64 x86_64 GNU/Linux

```BASH
 uname -a
```
## free
**free:** RAM durumunu görmek için kullanılabilir.
```BASH
free
```





