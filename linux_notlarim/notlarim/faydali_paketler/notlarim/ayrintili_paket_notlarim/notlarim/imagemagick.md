# İmagemagick Notlarım
1990 Yılında yayınlanmıştır.
 
Linux komut satırında birden fazlagörüntü dosyası üzerinde işlem yapmak için en uygun paketlerden birisiimagemagick paketidir. 
## imagemagick paketi nasıl yüklenir ?
```BASH
sudo apt install imagemagick
```
## Tip dönüşümü nasıl yapılır ?
Aşağıdaki komutimage-1.jpg dosyasını image-1.png dosyasına dönüştürür.
```BASH
 convert image-1.jpg image-1.png
```
## Kalite nasıl belirlenir ?
Aşağıdaki komutimage-2.jpg dosyasını %70 kalite ile   image-2.png dosyasına dönüştürür.
```BASH
convert image-2.jpg -quality 70 image-2.png
```
## Boyut dönüşümü nasıl yapılır ?
Aşağıdaki komutimage-3.jpg  dosyasını 800 piksel  olcak şekilde  pixelimage.jpg dosyasına dönüştürür.
```BASH
convert image-3.jpg -resize 800x  pixelimage.jpg
```
Aşağıdaki komutimage-3.jpg  dosyasını 300x120 olcak şekilde resim boyutu olacak şekilde reimage.jpg dosyasına dönüştürür.
```BASH
convert image-3.jpg -resize 300x120 reimage.jpg
```
>Note:  Yukarıdaki komut,görüntü oranını (aspect ratio) korur. Yani görüntüyü 300x120'lik bir dikdörtgen içerisine sığdırmaya çalışır.Eğer korumasını istemiyorsanız ve oran bozulsa bile tam olarak 300x120'lik çıktı elde etmek istiyorsanız bunu ünlem (!) koyarak belirtebilirsiniz.

Aşağıdaki komutimage-3.jpg  dosyasını 300x120 olcak şekilde resim boyutu korumadan  newimage.jpg dosyasına dönüştürür.
```BASH
convert image-3.jpg -resize 300x120! newimage.jpg
```
>Note:Genişlik (width) veya yükseklik (height) ile resim boyutu ayarlanabilir.

Aşağıdaki komutimage-3.jpg  dosyasını 300 genişliğinde olcak şekilde width.jpg dosyasına dönüştürür.
```BASH
 convert image-3.jpg  -resize 300 width.jpg
```
Aşağıdaki komutimage-3.jpg  dosyasını 120 yükseklikte olcak şekilde height.jpg dosyasına dönüştürür.
```BASH
 convert image-3.jpg  -resize x120 height.jpg
```
>Note: Ayrıcayüzde belirterek küçültme işlemleri de yapılabilir.

Aşağıdaki komutimage-3.jpg  dosyasını %50 ölçücde küçük resim şeklinde küçük.jpg dosyasına dönüştürür.
```BASH
convert image-3.jpg -resize 50% küçük.jpg
```
## Resim döndürme nasıl yapılır ?
Aşağıdaki komutimage-3.jpg resmini 90 derece döndürür ve  rotate90image.jpg dosyasına dönüştürür.
```BASH
convert image-3.jpg -rotate 90 rotate90image.jpg
```
## Resim aynalama nasıl yapılır ?
Aynalama işlemleri içinflip ve flop seçenekleri kullanılır. flip görüntüyü başaşağı çevirir (x-ekseninde aynalama), flop ise soldan sağa doğru (y-ekseninde) çevirir.

Aşağıdaki komutimage-3.jpg resmine flip işlemini yapar  flipped.jpg dosyasına dönüştürür.
```BASH
convert image-3.jpg -flip flipped.jpg
```
Aşağıdaki komutimage-3.jpg resmine flop işlemini flopped.png dosyasına dönüştürür.
```BASH
convert image-3.jpg -flop flopped.png
```
Aşağıdaki komutimage-3.jpg resmini hem flip hem de flop işlemi uygular flipflop.png dosyasına dönüştürür.
```BASH
convert image-3.jpg -flip -flop flipflop.png
```
