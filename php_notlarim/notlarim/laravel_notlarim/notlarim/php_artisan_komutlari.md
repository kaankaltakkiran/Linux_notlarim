# 🧰 Laravel Sık Kullanılan `php artisan` Komutları Tablosu

---

## 🔧 GENEL KOMUTLAR

| Komut                        | Açıklama                                                                        |
| ---------------------------- | ------------------------------------------------------------------------------- |
| `php artisan list`           | Tüm mevcut Artisan komutlarını listeler                                         |
| `php artisan help <komut>`   | Komut hakkında yardım/detay verir                                               |
| `php artisan serve`          | Geliştirme sunucusunu başlatır ([http://127.0.0.1:8000](http://127.0.0.1:8000)) |
| `php artisan tinker`         | Etkileşimli Laravel terminali (model testleri için çok kullanılır)              |
| `php artisan route:list`     | Tanımlı tüm rotaları listeler                                                   |
| `php artisan clear-compiled` | Derlenmiş sınıfları temizler                                                    |

---

## ⚙️ UYGULAMA TEMİZLEME / CACHE

| Komut                        | Açıklama                                    |
| ---------------------------- | ------------------------------------------- |
| `php artisan config:cache`   | Tüm config dosyalarını önbelleğe alır       |
| `php artisan config:clear`   | Config önbelleğini temizler                 |
| `php artisan route:cache`    | Route’ları önbelleğe alır (performans için) |
| `php artisan route:clear`    | Route önbelleğini temizler                  |
| `php artisan view:cache`     | Blade şablonlarını derleyip önbelleğe alır  |
| `php artisan view:clear`     | Derlenmiş Blade şablonlarını temizler       |
| `php artisan optimize:clear` | Tüm cache ve optimize dosyalarını temizler  |

---

## 🛠️ MIGRATION & DATABASE

| Komut                                           | Açıklama                                                |
| ----------------------------------------------- | ------------------------------------------------------- |
| `php artisan migrate`                           | Migration dosyalarını çalıştırır (veritabanı oluşturur) |
| `php artisan migrate:fresh`                     | Tüm tabloları siler ve yeniden oluşturur                |
| `php artisan migrate:refresh`                   | Tabloları sıfırlar ve yeniden migration çalıştırır      |
| `php artisan migrate:rollback`                  | Son yapılan migration'ı geri alır                       |
| `php artisan make:migration create_posts_table` | Yeni migration dosyası oluşturur                        |

---

## 📦 MODEL – CONTROLLER – RESOURCE

| Komut                                                      | Açıklama                     |
| ---------------------------------------------------------- | ---------------------------- |
| `php artisan make:model Product`                           | Model oluşturur              |
| `php artisan make:model Product -m`                        | Model + migration oluşturur  |
| `php artisan make:controller ProductController`            | Sıradan controller oluşturur |
| `php artisan make:controller ProductController --resource` | Resource (CRUD) controller   |
| `php artisan make:controller Api/ProductController`        | API controller oluşturur     |

---

## 🧪 SEEDER & FACTORY

| Komut                                                     | Açıklama                           |
| --------------------------------------------------------- | ---------------------------------- |
| `php artisan make:seeder ProductSeeder`                   | Seeder oluşturur                   |
| `php artisan make:factory ProductFactory --model=Product` | Model için factory oluşturur       |
| `php artisan db:seed`                                     | Seeder’ı çalıştırır                |
| `php artisan db:seed --class=ProductSeeder`               | Belirli bir seeder'ı çalıştırır    |
| `php artisan migrate:fresh --seed`                        | Veritabanını sıfırlar ve seed eder |

---

## 🔐 AUTH & SANCTUM

| Komut                                                                            | Açıklama                                                                |
| -------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `php artisan make:auth`                                                          | Laravel 6'da klasik auth sistemini kurar (Jetstream sonrası devre dışı) |
| `php artisan vendor:publish --provider="Laravel\Sanctum\SanctumServiceProvider"` | Sanctum kurulum dosyalarını yayınlar                                    |

---

## 🧩 MIDDLEWARE, REQUEST, EVENT vs.

| Komut                                                | Açıklama                                        |
| ---------------------------------------------------- | ----------------------------------------------- |
| `php artisan make:middleware CheckAge`               | Middleware oluşturur                            |
| `php artisan make:request StoreProductRequest`       | Form Request sınıfı oluşturur (validasyon için) |
| `php artisan make:event OrderShipped`                | Event sınıfı oluşturur                          |
| `php artisan make:listener SendShipmentNotification` | Listener oluşturur                              |

---

## 🧪 TEST KOMUTLARI

| Komut                                   | Açıklama                              |
| --------------------------------------- | ------------------------------------- |
| `php artisan make:test ProductTest`     | Test sınıfı oluşturur                 |
| `php artisan test`                      | Uygulamanın testlerini çalıştırır     |
| `php artisan test --filter=ProductTest` | Belirli bir test dosyasını çalıştırır |

---

## 💡 BONUS: ÇOK KULLANILAN KOMBO KOMUTLAR

```bash
php artisan make:model Post -mcr
```

> `-mcr`: Model + Migration + Controller (resource) aynı anda oluşturur.

---
