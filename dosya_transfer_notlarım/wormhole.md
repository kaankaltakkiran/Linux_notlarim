# Dosya transfer notlarım
**Wormhole genellikle komut satırı aracılığıyla kullanılan bir dosya paylaşımı aracıdır ve dosyaları iki bilgisayar arasında hızlı ve güvenli** bir şekilde aktarmanıza olanak tanır.
## Wormhole nasıl yüklenir ?
```BASH
sudo apt install magic-wormhole
```
## Dosya transferi nasıl yapılır ?
Aşağıdaki komut ile **göndermek istediğiniz dosya adını** yazarak dosya gönderilir.
```BASH
wormhole send dosya_adı
```
> **Note:** Komutu çalıştırdıktan sonra, **terminal size bir paylaşım kodu verecektir**. **Bu kodu kopyalayın. ve dosyayı paylaşmak istediğiniz kişiye verin**.

Aşağıdaki komut ile gönderdiğiniz dosyayı alacak kişi yazmalı ve bu komutu çalıştırdıktan sonra, paylaşım kodunu isteyen bir prompt alacaktır. Buraya önceden kopyaladığınız paylaşım kodunu yapıştırın ve enter tuşuna basın. Dosya otomatik olarak alınacaktır.

Örnek çıktı :wormhole receive 8-company-upset
```BASH
wormhole receive
```
