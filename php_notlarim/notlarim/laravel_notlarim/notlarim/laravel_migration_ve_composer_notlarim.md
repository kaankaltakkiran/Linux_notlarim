# Laravel Migration Ve Composer Notlarım

Laravel'de **migration** (göç) kavramı, **veritabanı tablolarını kod yazarak oluşturmak ve yönetmek** için kullanılan güçlü bir sistemdir. İşte sade ve anlaşılır bir şekilde açıklaması:

---

## 🧱 Laravel Migration Nedir?

Migration, veritabanı tablolarını PHP kodu ile tanımlamana olanak sağlayan **veritabanı şeması kontrol sistemidir**.

Tıpkı versiyon kontrol sistemi gibi çalışır. Kodla tablo oluşturur, günceller, silersin. SQL yazmadan tabloları yönetebilirsin.

---

## 🧠 Ne İşe Yarar?

- Veritabanını **kodla yönetirsin** (SQL dosyası gerekmez).
- Ekiple çalışırken herkesin veritabanı aynı kalır.
- Geri alınabilir değişiklikler yapabilirsin (rollback).
- Projeyi bir sunucudan diğerine taşırken kolaylık sağlar.

---

## 🔨 Örnek: Migration Nasıl Oluşturulur?

```bash
php artisan make:migration create_users_table
```

Bu komut `database/migrations` klasörüne şunu benzeri bir dosya oluşturur:

```php
public function up()
{
    Schema::create('users', function (Blueprint $table) {
        $table->id();
        $table->string('name');
        $table->string('email')->unique();
        $table->timestamps();
    });
}
```

Bu kod, `users` adında bir tablo oluşturur.

---

## 🚀 Migration’ı Uygulama (Veritabanında tabloyu oluşturmak)

```bash
php artisan migrate
```

Bu komutla Laravel, tüm tanımlı migration dosyalarını çalıştırır ve tabloları veritabanında oluşturur.

---

## 🔁 Migration Geri Alma (Rollback)

Yanlış bir değişiklik yaptıysan geri alabilirsin:

```bash
php artisan migrate:rollback
```

Bu komut son yapılan migration’ı geri alır (tabloyu siler veya son değişikliği geri çeker).

---

## 🧪 Migration Dosyalarının Yeri

Tüm migration dosyaları şurada tutulur:

```
/database/migrations/
```

Örn: `2024_06_19_000000_create_users_table.php`

---

## 🧩 Migration ile Seeder Arasındaki Fark

| Özellik        | Migration              | Seeder                   |
| -------------- | ---------------------- | ------------------------ |
| Amaç           | Tablo yapısı oluşturur | Tabloya örnek veri ekler |
| Komut          | `php artisan migrate`  | `php artisan db:seed`    |
| Nerede Bulunur | `database/migrations/` | `database/seeders/`      |

---

## 🧰 Composer Nedir?

**Composer**, PHP için bir **paket yönetim aracıdır**.

Tıpkı:

- **Node.js**'te `npm`
- **Python**'da `pip`
- **Java**'da `Maven` veya `Gradle`

gibi, Composer da **projen için gerekli kütüphaneleri otomatik indirir, kurar, günceller**.

---

## 🎯 Ne İşe Yarar?

### 1. **Laravel gibi framework’leri kurmanı sağlar.**

```bash
composer create-project laravel/laravel example-app
```

### 2. **Gerekli bağımlılıkları (kütüphaneleri) yükler.**

Projenin içinde `composer.json` diye bir dosya olur. Orada yazan tüm bağımlılıkları indirir.

```bash
composer install
```

### 3. **Yeni kütüphane ekleyebilirsin.**

```bash
composer require guzzlehttp/guzzle
```

### 4. **PSR-4 ile otomatik class yükleme yapar.**

Yani `autoload` sistemini yönetir. Kendi yazdığın sınıfları bile Composer otomatik tanır hale getirir.

---

## 📁 Önemli Composer Dosyaları

| Dosya Adı         | Açıklama                                   |
| ----------------- | ------------------------------------------ |
| `composer.json`   | Hangi paketlerin kullanılacağını yazar.    |
| `composer.lock`   | Hangi versiyonların yüklendiğini sabitler. |
| `vendor/` klasörü | Tüm kütüphaneler buraya yüklenir.          |

---
