### Quasar İle Githubtan Otomait Projeyi Build Eden Sistem

- [Detaylı Bilgi](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/hosting_notlarim/notlarim/quasar_web_site_deploy.md)

---

### Vds Server(Debian) Yunohost Ve My_webapp İle Proje Deploy Adımları

1. `Node.js Git` Yüklü olmalı:

```bash
sudo apt update
sudo apt install -y git curl build-essential vim
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
```

2.  `My Webapp ` Yüklenmeli(Yunohost Üzerinden)

3.  Quasar Projenizi Klonlayın Ve Build Alın:

```bash
cd /var/www/my_webapp__3/www/
sudo git clone https://github.com/kullaniciadi/projeadi.git .
```

4.  Quasar Projenizde Bağımlılıkları Yükleyin Ve Build Alın:

```bash
cd /var/www/my_webapp__3/www/Therapify/Frontend
npm install
quasar build
```

Daha sonra build aldığımız dosyayı `www` yoluna taşı:

```bash
sudo cp -r /var/www/my_webapp__3/www/Therapify/Frontend/dist/spa/* /var/www/my_webapp__3/www/
sudo chown -R www-data:www-data /var/www/my_webapp__3/www/
```

5. Otomatik Build Systemi İçin `pm2` Yüklenir:

```bash
sudo npm install -g pm2
```

6. Sunucuda `Webhook` oluşturuyoruz:

```bash
sudo vim /var/www/my_webapp__3/webhook.js
```

Örnek Kod:

```js
const { exec } = require("child_process");
const http = require("http");

http
  .createServer((req, res) => {
    if (req.method === "POST") {
      exec(
        "cd /var/www/my_webapp__3/www/Therapify/Frontend && git pull && npm install && quasar build && sudo cp -r dist/spa/* /var/www/my_webapp__3/www/ && sudo chown -R www-data:www-data /var/www/my_webapp__3/www/",
        (error, stdout, stderr) => {
          if (error) {
            console.error(`Error: ${error.message}`);
            return;
          }
          console.log(`stdout: ${stdout}`);
          console.error(`stderr: ${stderr}`);
        }
      );
      res.writeHead(200);
      res.end("Webhook executed");
    } else {
      res.writeHead(405);
      res.end("Method Not Allowed");
    }
  })
  .listen(4000, () => console.log("Webhook listening on port 4000"));
```

> **Note**: Port Sorun Çıkarırsa Yunohost Üzerinden Açın

7. PM2 ile Güncel Webhook Script'ini Çalıştır:

```bash
sudo pm2 delete webhook
sudo pm2 start /var/www/my_webapp__3/webhook.js --name webhook
sudo pm2 save
```

Bu komut İle Çalışıp Çalışmadığını Kontrol Edin:

```bash
pm2 status
pm2 logs webhook
```

8. Github Webhook Oluştur:

Payload URL: http://<Server_ip>:4000/
Content Type: application/json
Trigger Events: Sadece push olayı seçili olmalı.

> **Note:**Tetikleme Sonuçları `Github>WebHooks>Recent Delivers`

## **Nasıl Çalışır?**

1. GitHub’daki kodunuz güncellendiğinde, webhook URL'sine bir istek gönderir.
2. Webhook script'i bu isteği alır ve şu işlemleri yapar:
   - Kodları `git pull` ile günceller.
   - Gerekli bağımlılıkları yükler (`npm install`).
   - Projeyi build eder (`quasar build`).
   - Build edilen dosyaları web klasörüne taşır.
3. PM2, Webhook script'inin her zaman çalışır durumda olmasını sağlar.

Bu rehberi takip ederek GitHub'daki projenizi sunucunuzda otomatik olarak güncelleyebilirsiniz! 😊

#### Kaynakça

- [Chatgpt Kaynak](https://chatgpt.com/share/6787d000-7360-8005-8e59-bb9f397e56e8)
