### Webhook ve PM2 ile Otomatik Deployment Rehberi

Bu rehber, bir Node.js projesini **Webhook** ve **PM2** kullanarak otomatik olarak nasıl deploy edeceğinizi anlatır.

---

### Webhook

- Webhook, bir olay gerçekleştiğinde (örneğin, GitHub’da bir commit yapıldığında) başka bir sunucuya otomatik olarak HTTP isteği gönderen bir mekanizmadır.

- Bu projede, Webhook kullanarak GitHub'daki kodlarınızı sunucunuzda otomatik olarak güncellemek ve yeniden build almak için bir sistem kurduk.

### PM2

- PM2, Node.js uygulamalarını yönetmek için kullanılan bir **process manager**dır.
- PM2 sayesinde:
  - Uygulamalarınızı sürekli çalıştırabilirsiniz.
  - Uygulama hatalarını görebilir, yeniden başlatabilirsiniz.
  - Logları izleyebilirsiniz.

---

## **Adım Adım Kurulum**

### 1. **Node.js ve PM2 Kurulumu**

```bash
sudo apt update
sudo apt install -y nodejs npm
sudo npm install -g pm2
```

### 2. **Projenizi Sunucuya Kopyalayın**

- GitHub’dan projenizi sunucunuza klonlayın:
  ```bash
  git clone https://github.com/kullanici-adi/proje-adi.git /var/www/proje-adi
  cd /var/www/proje-adi
  ```
- Proje bağımlılıklarını yükleyin:
  ```bash
  npm install
  ```

### 3. **Webhook Script'i Yazın**

Bu script, GitHub’dan gelen isteği alır ve projenizi günceller.

- Script’i şu konumda oluşturun: `/var/www/proje-adi/webhook.js`

```javascript
const { exec } = require("child_process");
const http = require("http");

http
  .createServer((req, res) => {
    if (req.method === "POST") {
      console.log("Webhook received");
      exec(
        "cd /var/www/proje-adi && git pull && npm install && quasar build && sudo cp -r dist/spa/* /var/www/proje-adi/www && sudo chown -R www-data:www-data /var/www/proje-adi/www",
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

### 4. **Webhook Script'ini PM2 ile Çalıştırın**

- PM2 ile script'i başlatın ve yönetmeye başlayın:
  ```bash
  pm2 start /var/www/proje-adi/webhook.js --name webhook
  pm2 save
  pm2 startup
  ```

### 5. **Güvenlik Duvarını Yapılandırın**

- Webhook'un çalıştığı portu açın:
  ```bash
  sudo ufw allow 4000
  ```

### 6. **GitHub Webhook Ayarı**

- GitHub projenizde, **Settings > Webhooks** kısmına gidin.
- **Payload URL**: `http://sunucu-ip-adresi:4000/` olarak ayarlayın.
- **Content type**: `application/json` seçin.
- **Trigger events**: `push` seçeneğini işaretleyin.

---

## **Nasıl Çalışır?**

1. GitHub’daki kodunuz güncellendiğinde, webhook URL'sine bir istek gönderir.
2. Webhook script'i bu isteği alır ve şu işlemleri yapar:
   - Kodları `git pull` ile günceller.
   - Gerekli bağımlılıkları yükler (`npm install`).
   - Projeyi build eder (`quasar build`).
   - Build edilen dosyaları web klasörüne taşır.
3. PM2, Webhook script'inin her zaman çalışır durumda olmasını sağlar.

---

## **Kontrol ve Sorun Giderme**

### PM2 Loglarını Kontrol Etmek

Webhook script'inizin çalışıp çalışmadığını kontrol edin:

```bash
pm2 logs webhook
```

### GitHub Webhook Testi

GitHub'da **Settings > Webhooks** kısmına gidin ve **Redeliver** seçeneğiyle testi tekrar yapın. Eğer `200 OK` görüyorsanız, sistem düzgün çalışıyor demektir.

---

## **Ekstra Öneriler**

- **HTTPS Kullanımı**: Eğer bir alan adınız varsa ve HTTPS kullanıyorsanız, webhook URL'sini `https://` olarak ayarlayın.
- **Logları İzleyin**: Olası hataları görmek için `pm2 logs webhook` komutunu düzenli olarak kullanın.
- **Güncellemeleri Deneyin**: Sistemin her adımını manuel olarak test edin (ör. `git pull`, `npm install`).

---

Bu rehberi takip ederek GitHub'daki projenizi sunucunuzda otomatik olarak güncelleyebilirsiniz! 😊

#### Kaynakça

- [Chatgpt Kaynak](https://chatgpt.com/share/6787d000-7360-8005-8e59-bb9f397e56e8)
