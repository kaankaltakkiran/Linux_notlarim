# laravel Proje Yapısı

# 📁 Laravel Proje Yapısı (Klasörler ve Amaçları)

Laravel kurulduktan sonra aşağıdaki gibi bir proje yapısı oluşur:

```
example-app/
├── app/
├── bootstrap/
├── config/
├── database/
├── public/
├── resources/
├── routes/
├── storage/
├── tests/
├── vendor/
├── artisan
├── composer.json
└── .env
```

---

## 📂 `app/` – Uygulamanın Kalbi

Uygulama ile ilgili tüm iş mantığı buradadır.

| Klasör/Dosya        | Açıklama                              |
| ------------------- | ------------------------------------- |
| `Http/Controllers/` | Controller'lar burada yer alır        |
| `Models/`           | Veritabanı modelleri burada           |
| `Http/Middleware/`  | Middleware (ara katmanlar)            |
| `Providers/`        | Servis sağlayıcıları (boot, register) |

---

## 📂 `bootstrap/`

Uygulama başlatılırken çalışan dosyalar.

- `app.php` ➝ Laravel framework’ü başlatır.
- `cache/` ➝ Performans için önbellekler burada tutulur.

---

## 📂 `config/`

Tüm ayar dosyaları burada. Örn:

| Dosya          | Açıklama                       |
| -------------- | ------------------------------ |
| `app.php`      | Uygulama adı, timezone, locale |
| `database.php` | Veritabanı ayarları            |
| `mail.php`     | Mail ayarları                  |

---

## 📂 `database/`

Veritabanı işlemleriyle ilgili her şey burada.

| Alt Klasör    | Açıklama                 |
| ------------- | ------------------------ |
| `migrations/` | Veritabanı şemaları      |
| `seeders/`    | Örnek veri oluşturucular |
| `factories/`  | Test verisi üreticileri  |

---

## 📂 `public/`

Web sunucusunun çalıştırdığı dizindir.

- `index.php` → Laravel uygulamasını başlatır.
- CSS, JS, resim dosyaları gibi **public** içerikler burada bulunur.

> Not: Web sunucusunda `public/` dizini "root" olarak ayarlanmalıdır.

---

## 📂 `resources/`

Kullanıcıya gösterilecek arayüzler burada.

| Klasör        | Açıklama                             |
| ------------- | ------------------------------------ |
| `views/`      | Blade dosyaları (`.blade.php`)       |
| `lang/`       | Dil dosyaları (i18n çeviri)          |
| `css/`, `js/` | Asset kaynakları (vite ile derlenir) |

---

## 📂 `routes/`

Tüm rotalar bu klasörde tanımlanır.

| Dosya          | Amaç                           |
| -------------- | ------------------------------ |
| `web.php`      | Web rotaları                   |
| `api.php`      | API rotaları (genellikle JSON) |
| `console.php`  | Artisan komutları              |
| `channels.php` | WebSocket, broadcast rotaları  |

---

## 📂 `storage/`

Dosya sistemi ve önbellek klasörleri.

| Klasör       | Açıklama                        |
| ------------ | ------------------------------- |
| `logs/`      | Uygulama log'ları (hatalar vs.) |
| `framework/` | Cache, sessions, views          |
| `app/`       | Uygulamanın ürettiği dosyalar   |

---

## 📂 `tests/`

PHPUnit ile yazılmış test dosyaları.

- `Feature/` ➝ Genel işlevleri test eder
- `Unit/` ➝ Sınıf, fonksiyon gibi birimleri test eder

---

## 📂 `vendor/`

Tüm Composer ile yüklenen paketler burada bulunur. Laravel çekirdeği bile aslında buradadır.

---

## 📄 Diğer Önemli Dosyalar

| Dosya            | Açıklama                                         |
| ---------------- | ------------------------------------------------ |
| `.env`           | Ortam değişkenleri (DB bilgisi, API key)         |
| `artisan`        | Laravel komut satırı aracı (CLI)                 |
| `composer.json`  | Bağımlılık listesi                               |
| `package.json`   | Frontend JS bağımlılıkları (Vite, Vue vs.)       |
| `vite.config.js` | Vite yapılandırması (Laravel Mix'in yerini aldı) |

---

## ✅ Kısaca

Laravel’in klasör yapısı:

- Kodlar: `app/`
- Görseller: `resources/views/`
- Rotalar: `routes/`
- Veritabanı: `database/`
- Ayarlar: `config/`
- Başlangıç: `public/index.php`

---
