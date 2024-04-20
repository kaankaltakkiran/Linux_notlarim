# Linux Çalışmalarım
Linux komut satırında birden fazla **görüntü dosyası üzerinde işlem yapmak** için en uygun paketlerden birisi **imagemagick** paketidir. 
## imagemagick paketi nasıl yüklenir ?
```BASH
sudo apt install imagemagick
```
## Tip dönüşümü nasıl yapılır ?
Aşağıdaki komut **image-1.jpg dosyasını image-1.png dosyasına** dönüştürür.
```BASH
 convert image-1.jpg image-1.png
```
## Kalite nasıl belirlenir ?
Aşağıdaki komut **image-2.jpg dosyasını %70 kalite ile   image-2.png dosyasına** dönüştürür.
```BASH
convert image-2.jpg -quality 70 image-2.png
```
## Boyut dönüşümü nasıl yapılır ?
Aşağıdaki komut **image-3.jpg  dosyasını 800 piksel  olcak şekilde  pixelimage.jpg dosyasına** dönüştürür.
```BASH
convert image-3.jpg -resize 800x  pixelimage.jpg
```
Aşağıdaki komut **image-3.jpg  dosyasını 300x120 olcak şekilde resim boyutu olacak şekilde reimage.jpg dosyasına** dönüştürür.
```BASH
convert image-3.jpg -resize 300x120 reimage.jpg
```
> **Note:**  Yukarıdaki komut, **görüntü oranını (aspect ratio) korur**. Yani görüntüyü 300x120'lik bir dikdörtgen içerisine sığdırmaya çalışır. **Eğer korumasını istemiyorsanız ve oran bozulsa bile tam olarak 300x120'lik çıktı elde etmek istiyorsanız bunu ünlem (!)** koyarak belirtebilirsiniz.

Aşağıdaki komut **image-3.jpg  dosyasını 300x120 olcak şekilde resim boyutu korumadan  newimage.jpg dosyasına** dönüştürür.
```BASH
convert image-3.jpg -resize 300x120! newimage.jpg
```
> **Note:** **Genişlik (width) veya yükseklik (height)** ile resim boyutu ayarlanabilir.

Aşağıdaki komut **image-3.jpg  dosyasını 300 genişliğinde olcak şekilde width.jpg dosyasına** dönüştürür.
```BASH
 convert image-3.jpg  -resize 300 width.jpg
```
Aşağıdaki komut **image-3.jpg  dosyasını 120 yükseklikte olcak şekilde height.jpg dosyasına** dönüştürür.
```BASH
 convert image-3.jpg  -resize x120 height.jpg
```
> **Note:** Ayrıca **yüzde belirterek küçültme işlemleri** de yapılabilir.

Aşağıdaki komut **image-3.jpg  dosyasını %50 ölçücde küçük resim şeklinde küçük.jpg dosyasına** dönüştürür.
```BASH
convert image-3.jpg -resize 50% küçük.jpg
```
