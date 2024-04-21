# Linux metin editör notlarım
Linux'ta Vim (Vi IMproved), metin düzenleme ve programlama için kullanılan güçlü bir metin editörüdür. Vim, komut satırı tabanlı bir editördür ve genellikle programcılar, sistem yöneticileri ve yazılım geliştiricileri tarafından tercih edilir. 

## Vim editör paketi nasıl yüklenir ?
```BASH
sudo apt install vim 
```
## Vim editör ile dosya nasıl açılır ?
Aşağıdaki komut **kaan.txt doyasını vim editör** ile açar.
```BASH
vim kaan.txt
```
## Vim editör nasıl kullanılır ?
Vim Editör **tamamen klavye ile** yönetilmektedir. Bu sebeple öncelikle **<kbd>i</kbd> tuşuna basıp ekle (insert) moduna** geçiyoruz. **Sol aşşağı kısımda INSERT** yazdığını göreceksiniz.
Daha sonra metin düzenleme işleminiz bittikten sonra <kbd>Escape</kbd> veya <kbd>Control</kbd> + <kbd>C</kbd> insert modundan çıkılır.
## Vim editörden nasıl çıkılır ?
Aşağıdaki komut **kaydet ama kapatma (write)** işlemini yapar.
```BASH
:w 
```
Aşağıdaki komut **kaydet ve kapat (write quit)** işlemini yapar.
```BASH
:wq
```
Aşağıdaki komut **kapat (quit) kaydedilmeyen değişiklik var ise hata verir** işlemini yapar.
```BASH
:q!
```
## Metin kesme, kopyalama, yapıştırma işlemi nasıl yapılır ?
Aşağıdaki komut **Seçili metni kesmek için kullanılır.**
```BASH
d 
```
> **Note:** Aşağıdaki komut **tüm satırı seçerek  kesme işlemi yapılır.**
```BASH
dd
```
Aşağıdaki komut **Seçili metni kopyalamak için kullanılır**.
```BASH
y
```
> **Note:** Aşağıdaki komut **tüm satırı seçerek  kopyalama işlemi yapılır**.
```BASH
yy
```
Aşağıdaki komut **Kesilmiş veya kopyalanan metni yapıştırmak için kullanılır.**
```BASH
p
```
## İleri ve Geri Alma işlemi nasıl yapılır ?
Aşağıdaki komut **Son yapılan işlemi geri almak için kullanılır.**
```BASH
u
```
Aşağıdaki komut **Geri alınan bir işlemi ileri almak için kullanılır.**
```BASH
ctrl+r
```
