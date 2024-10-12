# FFmpeg Notlarım
2000 Yılında yayınlanmıştır.
 
 FFmpeg, açık kaynaklı bir çoklu ortam çerçevesidir. Video ve ses dosyalarını işlemek, dönüştürmek, kodlamak ve çözmek için kullanılır. 
## FFmpeg nasıl yüklenir ?
```BASH
sudo apt install ffmpeg
```
## Video dönüştürme işlemi nasıl yapılır ?
Aşağıdaki komutexampleVideo.mp4 adlı mp4 türündeki videoyu transformVideo adlı mp3 formatına çevirir.
```BASH
ffmpeg -i exampleVideo.mp4 transformVideo.mp3
```
>Note:** -i, ffmpeg'in giriş dosyasını belirtmek için kullanılan bir seçenektir. Yani, ffmpeg'e hangi dosyanın giriş olarak kullanılacağını söyler. Örneğin,-i exampleVideo.mp4 komutu, ffmpeg'e exampleVideo.mp4 dosyasının giriş olarak kullanılması gerektiğini belirtir.

## Komut satırından video nasıl oynatılır?
Aşağıdaki komutffplay komut ile ismini yazdığınız videoyu oynatır.
```BASH
ffplay  exampleVideo.mp4
```
