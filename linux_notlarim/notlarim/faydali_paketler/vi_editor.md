# Vi Editör Notlarım
 1976 Yılında yayınlanmıştır.
 
Linux'ta Vim (Vi IMproved), metin düzenleme ve programlama için kullanılan güçlü bir metin editörüdür. Vim, komut satırı tabanlı bir editördür ve genellikle programcılar, sistem yöneticileri ve yazılım geliştiricileri tarafından tercih edilir. 

Vim editörden çıkmak için ```:q! ``` komutu kullanılır.
## Genel özet tablosu
|Komut                       |Açıklama                         |
|-------------------------------|-----------------------------|
|<kbd>i</kbd>|insert moduna geçilir|
|<kbd>Escape</kbd> veya <kbd>Control</kbd> + <kbd>C</kbd>| insert modundan çıkılır|
|```:w ```|kaydet ama kapatma|
|```:wq ``` |kaydet ve kapat|
|```:q! ``` |kapat (quit) kaydedilmeyen değişiklik var ise hata verir|
|```d ``` |Seçili metni kesmek için kullanılır|
|```dd ``` |tüm satırı seçerek  kesme işlemi yapılır|
|```y``` |Seçili metni kopyalamak için kullanılır|
|```yy``` |tüm satırı seçerek  kopyalama işlemi yapılır|
|```p``` |Kesilmiş veya kopyalanan metni yapıştırmak için kullanılır|
|<kbd>u</kbd>|Son yapılan işlemi geri almak için kullanılır|
|<kbd>Control</kbd> + <kbd>R</kbd> |Geri alınan bir işlemi  ileri almak için kullanılır|
|<kbd>0</kbd> |satırın başına gitmek için kullanılır|
|<kbd>$</kbd> |satırın sonuna gitmek için kullanılır|
|```/arama_kelimesi``` |aranacak kelime yazılarak arama yapılır|
|```:s/eski/yeni/g``` |Metin dosyasında kelime değiştirme işlemi yapılabilir|

## Vim editör paketi nasıl yüklenir ?
```BASH
sudo apt install vim 
```
## Vim editör ile dosya nasıl açılır ?
Aşağıdaki komut kaan.txt doyasını vim editör ile açar.
```BASH
vim kaan.txt
```
## Vim editör nasıl kullanılır ?
Vim Editör tamamen klavye ile yönetilmektedir. Bu sebeple öncelikle <kbd>i</kbd> tuşuna basıp ekle (insert) moduna geçiyoruz. Sol aşşağı kısımda INSERT yazdığını göreceksiniz.
Daha sonra metin düzenleme işleminiz bittikten sonra <kbd>Escape</kbd> veya <kbd>Control</kbd> + <kbd>C</kbd> insert modundan çıkılır.
## Vim editörden nasıl çıkılır ?
Aşağıdaki komut kaydet ama kapatma (write) işlemini yapar.
```BASH
:w 
```
Aşağıdaki komut kaydet ve kapat (write quit) işlemini yapar.
```BASH
:wq
```
Aşağıdaki komut kapat (quit) kaydedilmeyen değişiklik var ise hata verir işlemini yapar.
```BASH
:q!
```
## Metin kesme, kopyalama, yapıştırma işlemi nasıl yapılır ?
Aşağıdaki komut Seçili metni kesmek için kullanılır.
```BASH
d 
```
> Note: Aşağıdaki komut tüm satırı seçerek  kesme işlemi yapılır.
```BASH
dd
```
Aşağıdaki komut Seçili metni kopyalamak için kullanılır.
```BASH
y
```
> Note: Aşağıdaki komut tüm satırı seçerek  kopyalama işlemi yapılır.
```BASH
yy
```
Aşağıdaki komut Kesilmiş veya kopyalanan metni yapıştırmak için kullanılır.
```BASH
p
```
## İleri ve Geri Alma işlemi nasıl yapılır ?
Aşağıdaki komut Son yapılan işlemi <kbd>U</kbd> ile geri almak için kullanılır.
```BASH
u
```
Aşağıdaki komut Geri alınan bir işlemi <kbd>Control</kbd> + <kbd>R</kbd> ile ileri almak için kullanılır.
```BASH
ctrl+r
```
## Satır başına ve satır sonuna nasıl gelinir ?
Aşağıdaki komut <kbd>0</kbd> ile satırın başına gitmek için kullanılır.
```BASH
0
```
Aşağıdaki komut <kbd>$</kbd> ile satırın sonuna gitmek için kullanılır
```BASH
$
```
## Arama ve değiştirme işlemi nasıl yapılır ?
Aşağıdaki komut /arama_kelimesi yazılarak arama işlemi yapılır
```BASH
/arama_kelimesi
```
Aşağıdaki komut Metin dosyasında kelime değiştirme işlemi yapılabilir.
```BASH
:s/eski/yeni/g
```
> Note: s: Bu, "substitute" (değiştir) komutunu temsil eder. Bu komut, belirli bir metin örneğini başka bir metinle değiştirmek için kullanılır.

> g: Bu, "global" anlamına gelir ve komutun bir satırda birden fazla eşleşme bulunursa hepsini değiştirmesini sağlar. Ancak, g kullanılmazsa, yalnızca bir satırda ilk eşleşme değiştirilir.
