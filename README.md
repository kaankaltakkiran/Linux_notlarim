# Linux Notlarım

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

## **pwd**
**pwd** komutunu hangi **dizinde (klasörde) olduğunuzu bulmak** için kullanılır.
## **cd**
**cd** dosya sisteminde **gezinmek için.**
-   **cd ..** (iki noktayla) b**ir üst dizine gitmek** için.
-   **cd** direkt olarak **ana klasöre gitmek** için.
-   **cd-** (tireli) **bir önceki dizine gitmek** için.

## **ls**
**ls** komutu **bir dizinin içeriğini görmek için** kullanılır.
> **Note:**  **ll** komutu **bir dizinin içeriğini görmek için** kullanılır.

## **rm**
**rm -f** **Dosyaları ve dizinleri kaldırmak** için kullanılır.
> **Note:**  **rm -rf** komutu **bir dizinin içeriğini ve kendisini silmek** için kullanılır. 
## **history**
**history** Bu komut, **geçmiş terminalde yazılan komutları** gösterir.
## **top**
**top** Bu komut, **Linux sistemlerinde çalışan işlem ve sistem kaynaklarını izlemek** için kullanılan bir komuttur.
## **du**
**du** komutu (disk usage), Linux ve diğer Unix benzeri işletim sistemlerinde **disk kullanımını incelemek** için kullanılır.
> **Note:**  **du -h** komutu **disk kullanımı gb cinsinden gösterir** kullanılır.
## **df**
**df** Bu komut, mevcut dosya sistemi üzerindeki **disk bölümlerinin ve ağ dosya sistemlerinin kullanılan ve boş disk alanlarını raporlar.**



