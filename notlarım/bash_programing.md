# Bash Programlama Notlarım
**Bash, "Bourne Again Shell"** kısaltmasıyla da bilinen bir Unix kabuk programlama dili ve komut işlemcisidir. Ubuntu Linux gibi bir Unix tabanlı işletim sisteminde, 

**Bash oldukça yaygın olarak kullanılır ve sistem yönetimi, dosya işlemleri, otomasyon ve betik yazma** gibi birçok amaç için kullanılabilir.

## Bash programlama nasıl yapılır ?
**Vi editör**  ile bash programlama yapacağımız **.sh uzantılı** dosyamızı oluşturuyoruz.
```BASH
vim firstFolder.sh
```
Daha sonra **<kbd>i</kbd> ile (insert) moduna** giriyoruz.
 Bütün bash scriptleri aşağıdaki satırla başlamalıdır:
 ```BASH
#!/bin/bash
```
Bu kodu dosyamıza **yapıştırıyoruz ve <kbd>Escape</kbd> veya <kbd>Control</kbd> + <kbd>C</kbd>insert modundan çıkıyoruz**. Son olarak **dosyayı ```:w ``` ile kaydediyoruz.**

Aşağıdaki komut bash script’inin konumunu görüntüleyecektir.
Örnek çıktı:  **/usr/bin/bash**
 ```BASH
which bash
```
## Örnek Basit Fonksiyon Uygulaması
Aşağıdaki komut ile **vi editör** ile oluşturduğunuz **.sh dosyasına** bu komutunu yapıştırmalıyız.   **<kbd>i</kbd> ile (insert) moduna** giriyoruz. Komutu **yapıştırıyoruz ve <kbd>Escape</kbd> veya <kbd>Control</kbd> + <kbd>C</kbd>insert modundan çıkıyoruz**. Son olarak **dosyayı ```:wq ``` ile kaydedip kapatıyoruz.**
 ```BASH
#!/bin/bash
testfunction(){
   echo "Merhaba"
}
testfunction
```
Daha sonra aşağıdaki komut ile **bash dosyamızı çalıştırıyoruz**.
Şu şekilde çıktı almalıyız: **Merhaba**
 ```BASH
bash firstFolder.sh 
```
## Örnek Parametreli Fonksiyon Uygulaması
Aşağıdaki komutu  **vi editör** ile oluşturduğunuz **.sh dosyasına** yapıştırmalıyız.   **<kbd>i</kbd> ile (insert) moduna** giriyoruz. Komutu **yapıştırıyoruz ve <kbd>Escape</kbd> veya <kbd>Control</kbd> + <kbd>C</kbd> insert modundan çıkıyoruz**. Son olarak **dosyayı ```:wq ``` ile kaydedip kapatıyoruz.**
 ```BASH
#!/bin/bash
testfunction(){
   echo $1
}
testfunction "Selam"
```
Daha sonra aşağıdaki komut ile **bash dosyamızı çalıştırıyoruz**. Örnek olarak **Selam parametresini** yazıyoruz.
Şu şekilde çıktı almalıyız: **Selam**
 ```BASH
bash firstFolder.sh 
```
## While İle Örnek
Aşağıdaki komutu **vi editör** ile oluşturduğunuz **.sh dosyasına** yapıştırmalıyız.   **<kbd>i</kbd> ile (insert) moduna** giriyoruz. Komutu **yapıştırıyoruz ve <kbd>Escape</kbd> veya <kbd>Control</kbd> + <kbd>C</kbd>insert modundan çıkıyoruz**. Son olarak **dosyayı ```:wq ``` ile kaydedip kapatıyoruz.**

Aşağıdaki komut  `sayac` adında bir değişkeni başlatır ve ardından while döngüsü içinde `sayac` **değeri 5** olana kadar işlem yapar.

 Her döngüde, **döngü değişkeninin değerini ekrana yazdırır ve döngü değişkenini bir artırır**. 
 
 Son olarak, döngü tamamlandığında **"Döngü bitti."** mesajını yazdırır.
 
 ```BASH
#!/bin/bash
# Başlangıç değeri
sayac=1
# While döngüsü
while [ $sayac -le 5 ]; do
    echo "Sayac: $sayac"
    sayac=$((sayac + 1)) # Sayacı bir artır
done
echo "Döngü bitti."
```
> **Note:** **: **`-le`, bir sayının başka bir sayıdan "küçük veya eşit" olduğunu kontrol etmek için** kullanılan bir koşul ifadesidir.

Daha sonra aşağıdaki komut ile **bash dosyamızı çalıştırıyoruz**.
 ```BASH
bash firstFolder.sh 
```
Şu şekilde çıktı almalıyız: 
Sayac: 1
Sayac: 2
Sayac: 3
Sayac: 4
Sayac: 5
Döngü bitti.

## İf Else İle Örnek
Aşağıdaki komutu **vi editör** ile oluşturduğunuz **.sh dosyasına** yapıştırmalıyız.   **<kbd>i</kbd> ile (insert) moduna** giriyoruz. Komutu **yapıştırıyoruz ve <kbd>Escape</kbd> veya <kbd>Control</kbd> + <kbd>C</kbd>insert modundan çıkıyoruz**. Son olarak **dosyayı ```:wq ``` ile kaydedip kapatıyoruz.**

Bu betik dosyası, **kullanıcıdan bir sayı girmesini ister. Ardından, girilen sayıyı kontrol eder ve ekrana bu sayının pozitif, negatif veya sıfır** olduğunu yazdırır.
 
 ```BASH
#!/bin/bash

# Kullanıcıya bir sayı girmesini isteyelim
echo "Lütfen bir sayı girin:"
read sayi

# Girilen sayıyı kontrol edelim
if [ $sayi -gt 0 ]; then
    echo "Girilen sayı pozitif."
elif [ $sayi -lt 0 ]; then
    echo "Girilen sayı negatif."
else
    echo "Girilen sayı sıfırdır."
fi
```
**if ifadesi, koşulun doğru olduğu** durumları belirtir.

**elif ifadesi, if ifadesi doğru değilse** diğer koşulları kontrol eder.

**else ifadesi, hiçbir koşul doğru değilse** çalışır.

> **Note:** **: **fi, "if" ifadesinin tersidir ve "end if" anlamına gelir. Bash'te, bir "if" bloğunun sonunu** belirtmek için kullanılır.

> **-gt "greater than", -lt "less than" ve -eq "equal"** anlamlarına gelir.

Daha sonra aşağıdaki komut ile **bash dosyamızı çalıştırıyoruz**.
 ```BASH
bash firstFolder.sh 
```
Örneğin 0 sayısını girdik. Şu şekilde çıktı almalıyız:
Girilen sayı sıfırdır.

