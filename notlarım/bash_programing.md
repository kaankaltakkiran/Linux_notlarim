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
Aşağıdaki komut ile **vi editör** ile oluşturduğunuz **.sh dosyasına** bu komutunu yapıştırmalıyız.   **<kbd>i</kbd> ile (insert) moduna** giriyoruz. Komutu**yapıştırıyoruz ve <kbd>Escape</kbd> veya <kbd>Control</kbd> + <kbd>C</kbd>insert modundan çıkıyoruz**. Son olarak **dosyayı ```:wq ``` ile kaydedip kapatıyoruz.**
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
Aşağıdaki komut ile **vi editör** ile oluşturduğunuz **.sh dosyasına** bu komutunu yapıştırmalıyız.   **<kbd>i</kbd> ile (insert) moduna** giriyoruz. Komutu**yapıştırıyoruz ve <kbd>Escape</kbd> veya <kbd>Control</kbd> + <kbd>C</kbd>insert modundan çıkıyoruz**. Son olarak **dosyayı ```:wq ``` ile kaydedip kapatıyoruz.**
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
## While Komutu İle Örnek
Aşağıdaki komut ile **vi editör** ile oluşturduğunuz **.sh dosyasına** bu komutunu yapıştırmalıyız.   **<kbd>i</kbd> ile (insert) moduna** giriyoruz. Komutu **yapıştırıyoruz ve <kbd>Escape</kbd> veya <kbd>Control</kbd> + <kbd>C</kbd>insert modundan çıkıyoruz**. Son olarak **dosyayı ```:wq ``` ile kaydedip kapatıyoruz.**
Aşağıdaki komut  `sayac` adında bir değişkeni başlatır ve ardından while döngüsü içinde `sayac` **değeri 5** olana kadar işlem yapar.
 Her döngüde, döngü değişkeninin değerini ekrana yazdırır ve döngü değişkenini bir artırır. 
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
> **Note:** **: **`-le`, bir sayının başka bir sayıdan "küçük veya eşit" olduğunu kontrol etmek için** kullanılan bir koşul ifadesidir
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

