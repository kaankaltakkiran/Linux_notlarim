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

## Detaylı Migration Konusu

# 🧱 Laravel Migration Kısaca

- **Migration:** Kod yazarak veritabanı tablosu oluşturma, değiştirme, silme işlemleridir.
- `php artisan make:migration` komutu ile oluşturulur.
- `up()` ➝ tabloyu oluşturur / değiştirir
- `down()` ➝ yapılan işlemi geri alır (rollback için)

---

## 📦 1. Migration Oluşturma

```bash
php artisan make:migration create_posts_table
```

Oluşan dosya: `database/migrations/202x_xx_xx_xxxxxx_create_posts_table.php`

---

## 🔨 2. Migration Yapısı

```php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('content');
            $table->timestamps(); // created_at ve updated_at
        });
    }

    public function down()
    {
        Schema::dropIfExists('posts');
    }
};
```

---

## 🔍 `up()` Nedir?

- **`up()`** fonksiyonu, migration **ilerletildiğinde** çalışır.
- Genellikle tablo oluşturma, sütun ekleme burada yapılır.

---

## 🔁 `down()` Nedir?

- **`down()`**, `migrate:rollback` komutunda çalışır.
- `up()` fonksiyonunda yapılan işlemleri **geri almak** için kullanılır.

> Örn: `up()` tablo oluşturuyorsa → `down()` o tabloyu siler.

---

## 🔧 `Blueprint` Nedir?

- Migration içinde tabloyu tanımlarken kullanılan yardımcı sınıftır.
- `$table` ifadesi aslında bir `Blueprint` nesnesidir.
- Yani `$table->string('name')` gibi metotlar, tabloya sütun eklemeye yarar.

---

## 🔣 Blueprint ile Sık Kullanılan Sütun Türleri

| Komut                          | Açıklama                     |
| ------------------------------ | ---------------------------- |
| `$table->id()`                 | Otomatik artan `id`          |
| `$table->string('title')`      | 255 karakterlik string       |
| `$table->text('content')`      | Uzun metin                   |
| `$table->integer('views')`     | Tamsayı                      |
| `$table->boolean('is_active')` | True / False                 |
| `$table->timestamps()`         | `created_at` ve `updated_at` |

---

## 🚀 Sık Kullanılan Migration Komutları

| Komut                                        | Açıklama                                 |
| -------------------------------------------- | ---------------------------------------- |
| `php artisan make:controller AuthController` | Controller oluşturur                     |
| `php artisan make:migration`                 | Yeni migration dosyası oluşturur         |
| `php artisan migrate`                        | Migration’ları uygular (up çalışır)      |
| `php artisan migrate:rollback`               | Son migration'ı geri alır (down çalışır) |
| `php artisan migrate:refresh`                | Tüm migrationları sıfırdan çalıştırır    |
| `php artisan migrate:fresh`                  | Veritabanını sıfırlar ve yeniden kurar   |
| `php artisan migrate:status`                 | Hangi migration’lar çalışmış gösterir    |

---

## 📌 Örnek: posts tablosu

```php
Schema::create('posts', function (Blueprint $table) {
    $table->id();
    $table->string('title');
    $table->text('body');
    $table->boolean('published')->default(false);
    $table->timestamps();
});
```

---

## ✅ Kısaca Özet

| Kavram      | Anlamı                                         |
| ----------- | ---------------------------------------------- |
| `migration` | Kodla tablo oluşturma sistemi                  |
| `up()`      | Tabloyu oluşturur, sütun ekler                 |
| `down()`    | Tabloyu siler, değişiklikleri geri alır        |
| `Blueprint` | Tabloya sütun tanımlamak için kullanılan sınıf |
| `migrate`   | Migration'ları çalıştırır, tabloları oluşturur |
