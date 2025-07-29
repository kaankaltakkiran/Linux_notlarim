## ✅ Laravel API Projesini Ayağa Kaldırma – Adım Adım

### 1. 📁 Projeyi Kopyala veya İndir

Eğer GitHub'dan aldıysan:

```bash
git clone https://github.com/kullaniciAdi/proje-adi.git
cd proje-adi
```

---

### 2. 📦 Composer Bağımlılıklarını Kur

Projede `vendor` klasörü yoksa, aşağıdaki komutla bağımlılıkları yükle:

```bash
composer install
```

---

### 3. ⚙️ .env Dosyasını Ayarla

Projenin kök dizininde `.env` dosyası yoksa, örneğini kopyala:

```bash
cp .env.example .env
```

#### Ardından `.env` dosyasında veritabanı bağlantı bilgilerini düzenle:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=veritabani_adi
DB_USERNAME=kullanici_adi
DB_PASSWORD=sifre
```

---

### 4. 🔑 Uygulama Anahtarı Oluştur

```bash
php artisan key:generate
```

---

### 5. 🧬 Veritabanı Migrasyonlarını Çalıştır

```bash
php artisan migrate
```

> Eğer seed veya dummy data da varsa:

```bash
php artisan db:seed
```

---

### 6. 🚀 Projeyi Çalıştır

```bash
php artisan serve
```

Tarayıcıda:
📍 `http://127.0.0.1:8000/api/...`
artık API endpointlerini test edebilirsin.

---

### 7. 🛠 Gerekirse JWT veya başka paketleri kur

Eğer proje JWT içeriyorsa:

```bash
php artisan jwt:secret
```
