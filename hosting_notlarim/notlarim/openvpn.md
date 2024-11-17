# OpenVPN Kurulum Notlarım

## OpenVPN Nedir ?

[OpenVPN](https://yunohost.org/), internet üzerindeki veri aktarımınızı güvenli hale getirmek için tasarlanmış, açık kaynak kodlu bir VPN protokolüdür.

## Kendi Sunucuna Nasıl OpenVPN Kurulur ?

Öncelikle terminalden ssh ile kendi serverımıza bağlanıyoruz.

```bash
ssh root@YOUR_SERVER_IP
```

1. ##### Scripti İndirmek İçin Curl Kurulumu

```bash
sudo apt install curl -y
```

2. ##### [Script İndirme Ve Çalıştırma İzni Verme](https://github.com/angristan/openvpn-install)

```bash
curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
chmod +x openvpn-install.sh
```

3. ##### Scripti Çalıştırma Komutu

```bash
bash openvpn-install.sh
```

4. ##### Sorulan Sorulara Cevap

   1. İlk olarak `sunucu ipsini` soruyor. Otamatik olarak geliyor <kbd>⏎ Enter</kbd> tuşuna basıyoruz.
   2. `ipv6` desteklesin mi diye soruyor. <kbd>y</kbd> tuşuna basıyoruz.

   3) OpenVPN hangi `portta` çalışsın diye soruyor. Seçenekler arasında default 1194 portunda ,custom ve random port ataması seçilebir. <kbd>3.</kbd> seçenek olan random port seçme seçilebilir.
   4) `Udp mi Tcp` mi olsun diye soruyor. Udp daha hızlı ama yasaklanmış olabilir. <kbd>1.</kbd> seçenek olan Udp seçilebilir.
   5) Hangi `dns sağalyıcısı` seçmek isterseniz diye soruyor. Default olan <kbd>AdGuard</kbd> dns kalabilir.
   6) `Compression` varsıyalan olarak <kbd>n</kbd> seçili ve <kbd>n</kbd> seçilmeli.
   7) `Şifreleme ayarlarını` kişelleştirmek istiyor musun diye soruyor. <kbd>n</kbd> Cevabını veriyoruz.
   8) Sorular bitti. <kbd>⏎ Enter</kbd> basarak yükleme işlemi başlıyor.

5. ##### Kurulum Tamamlandıktan Sonra Yapılacaklar

   1. `Client name` soruyor. Yani vpninizi isimlendirip <kbd>⏎ Enter</kbd> basıyoruz. Örneğin kaanpc gibi.
   2. Vpn Bağlanırken `şifre` koyulsun mu diye soruyor. <kbd>1</kbd> seçerek şifre koymak istemiyoruz.
   3. Her şey tamamsa vpn dosyamızı oluşutmuş oluyor. Örneğin `kaanpc.ovpn`

6. ##### Vpn Nasıl Kullanılır ?
   ssh ile bağlandığımız serverdan çıkıp aşığıdaki komut ile `sftp` şeklinde bağlanıyoruz. Bu şekilde vpn dosyamızı indriyoruz.

```bash
sftp root@SUNUCU_IP_ADDRESS
```

Daha sonra aşağıdaki komut ile adını belirlediğimiz `vpn dosyasını` indriyoruz.

```bash
get/root/CLIENT_NAME
```

> **Note:** Aşağıdaki komut ile qrcode ile vpn dosyanızı indrebilirsiniz.

```bash
qrencode -t ansiutf8 < OLUŞTRUDUĞUNUZ_VPN_ADI(Client Name)
```

Sonra internet ayarlarından vpn kısmından indirdiğimiz `vpn dosyasını import ediyoruz.`

Aşığıdaki komutu yeniden çalıştırarak `farklı cihazlar` için tekrardan adımları takip ederek vpn dosyası oluşturuyoruz

```bash
bash openvpn-install.sh
```

Son olarak [ip konumunu öğrenerek](https://ipleak.net/) internete bağlandığınız ülke değişmiş olmalıdır.

## Kaynakça

- [OpenVpn Resmi Web Sitesi](https://openvpn.net/)

- [OpenVpn Github Script](https://github.com/angristan/openvpn-install)

- [OpenVpn Kurulum Yotube Videosu](https://www.youtube.com/watch?v=X06u5AM_2F0)

- [Tcp Vs Udp](https://medium.com/@mmehmetisik/tcp-ve-udp-veri-i%CC%87leti%C5%9Fiminde-temel-protokoller-88c366b9598f)

- [İp Test](https://ipleak.net/)
