# Linux Notlarım
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
## Genel Notlarım
|Komut                        |Açıklama                      
-------------------------------|-----------------------------|
|`Apt`            |paket yönetim işlemleri için kullanılan komuttur.|
|`sudo apt update`  |Bu komut, ubutntuda bulunan **tüm repoların listesini günceller.**|    
|`sudo apt upgrade`| Bu komut, yüklü olan tüm paketleri **en son sürüme yükseltir**|    
|`sudo su` | Bu komut ile **en yetkili kullanıcı** oluruz.|    
|`sudo apt autoremove`|Bu komut, **diğer paketlerin kaldırılmasıyla birlikte sistemde kalmış olabilen ve artık kullanılmayan tüm paketleri kaldırır.**|    
|`sudo apt update && sudo apt upgrade && sudo apt autoremove` |Bu komut **işlem başarılıysa güncelleme yapar ve gereksiz paketleri siler.**|    

**Apt,** paket yönetim işlemleri için kullanılan komuttur.

**sudo apt update**: Bu komut, ubutntuda bulunan **tüm repoların listesini günceller.**

**sudo apt upgrade**: Bu komut, yüklü olan tüm paketleri **en son sürüme yükseltir**.

**sudo su**: Bu komut ile **en yetkili kullanıcı** oluruz.

**sudo apt autoremove**:Bu komut, **diğer paketlerin kaldırılmasıyla birlikte sistemde kalmış olabilen ve artık kullanılmayan tüm paketleri kaldırır.**

**sudo apt update && sudo apt upgrade && sudo apt autoremove** :Bu komut **işlem başarılıysa güncelleme yapar ve gereksiz paketleri siler.**


<kbd>Alt</kbd> + <kbd> Control</kbd>+ <kbd>T</kbd>:Bu komut ile terminal **ekranı açılır.**

<kbd> Control</kbd> + <kbd>U</kbd>:Bu komut, terminalda ki **en soldaki yazıyı siler.**

<kbd> Control</kbd> + <kbd>D</kbd>: Bu komut , **terminali kaydedip kapatır.**

<kbd> Control</kbd> + <kbd>L</kbd>: Bu komut , **terminali temizler.**

<kbd> Control</kbd> + <kbd>⇧ Shift</kbd> + <kbd>V</kbd>Bu komut , **kopyaladığımız içeriği terminale yapıştırır.**

<kbd> Control</kbd> + <kbd>R</kbd>Bu komut , terminalde **arama yapmamıza olanak sağlar.**

## Linuxte uygulama nasıl yüklenir?
**Birinci yöntem:**: indirmiş olduğumuz **.deb** uzantılı dosyayı çalıştırıp kurabliliriz.

**örnek kullanım:**  sudo dpkg -i filename

**İkinci yöntem:**: İlgili uygulamanın gerekli kodlarla reposundaki listeyi çekip.
##### pwd
**pwd** komutunu hangi **dizinde (klasörde) olduğunuzu bulmak** için kullanılır.

Örnek çıktı: /home/kaan
```BASH
pwd
```
##### cd
**cd** dosya sisteminde **gezinmek için** kullanılır.

Aşağıdaki komut Downloads dizinine gider
```BASH
cd  Downloads
```
Aşağıdaki komut bir üst dizine gider.
```BASH
cd ..
```
##### ls
Dizin altında yer alan dosyaları listeler.

Örnek çıktı: Documents   kaan.txt 
```BASH
ls
```
##### mkdir
**mkdir klasör_adı:** belirtilen isimde **klasör oluşturur.**

Örnek çıktı: resimlerim adında klasör oluşturur.
```BASH
mkdir resimlerim 
```
##### touch
**touch dosya_adı:** belirtilen isimde **dosya oluşturur.**

Örnek çıktı: notlarım adında txt dosyası oluşturur.
```BASH
touch notlarım.txt 
```
##### cp
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
##### rm
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
##### cat
**cat dosya_adı**: **dosya içeriğini görüntülemek** için kullanılır.

Aşağıdaki komut kaan.txt dosyasının içeriğini gösterir.
```BASH
cat kaan.txt
```
##### history
**history** Bu komut, **geçmiş terminalde yazılan komutları** gösterir.

```BASH
history
```
##### top
Bu komut, **Linux sistemlerinde çalışan işlem ve sistem kaynaklarını izlemek** için kullanılan bir komuttur.

```BASH
top
```
##### du
**du** komutu (disk usage), Linux ve diğer Unix benzeri işletim sistemlerinde **disk kullanımını incelemek** için kullanılır.

```BASH
du
```
##### df
**df** Bu komut, mevcut dosya sistemi üzerindeki **disk bölümlerinin ve ağ dosya sistemlerinin kullanılan ve boş disk alanlarını raporlar.**

```BASH
df
```
##### date
Güncel Saat ve tarihi gösterir. 

örnek çıktı: Prş 18 Nis 2024 17:04:11 +03

```BASH
date
```
##### uptime
**uptime:** sistemin açık kalma süresini gösterir.

 örnek çıktı:17:05:36 up  7:22,  3 users,  load average: 1,08, 0,70, 0,66

```BASH
uptime
```
##### w
 **w** : sistemler ilgili özet bilgiler verir.
```BASH
w
```
##### whoami
 **whoami:** giriş yapan kullanıcıyı gösterir. 
 
 örnek çıktı: kaan
```BASH
whoami
```
##### uname
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
##### free
**free:** RAM durumunu görmek için kullanılabilir.
```BASH
free
```
## **grep**
 Verilen **data içerisinden istenilen kriterlere ait kelimeleri aramak için** kullanılan komuttur.
> **Note:**  **i** ile büyük küçük harfe bakmadan arama yapar.
>  **-r** ile alt dizinlerde recursive olarak arama yapar.
>   **-v** ile yazılan kriterle uyuşanlar dışındaki çıktıları ekrana getirir.
## **find**
**find {dosya_yolu} –name ‘aranacak ifade’:** **Dosya ve dizinleri aramak için** kullanılır. Verilen dizin ve alt klasörlerinde arama yapar.
## **head**
 varsayılan olarak **bir dosyanın ilk 10 satırını getirir.**
 > **Note:**  **-n** parametresi ile satır sayısı belirlenebilir.
## **tail**
 varsayılan olarak **bir dosyanın son 10 satırını getirir.**
  > **Note:**  **-n** parametresi ile satır sayısı belirlenebilir.
  Dosya izinleri
  ## **  Dosya izinleri**
**x (çalıştırma)** = 1

  **w (yazma)** = 2
  
  **r (okuma)** = 4 
  
  Tüm haklar verildiğinde sayısal değer 7ye eşit olur (4+2+1)
  






