# Laravel Factories Seeders Notlarım

# 🌱 Laravel Factory & Seeder Rehberi

---

## 🔹 Factory Nedir?

> **Factory**, modeller (örneğin User, Post) için otomatik sahte (fake) veri üretmeni sağlar.

```bash
php artisan make:factory ProductFactory --model=Product
```

Oluşan dosya: `database/factories/ProductFactory.php`

### 🔧 Örnek `ProductFactory`

```php
use Faker\Generator as Faker;

public function definition(): array
{
    return [
        'name' => fake()->words(2, true),
        'price' => fake()->randomFloat(2, 10, 500),
        'stock' => fake()->numberBetween(1, 100),
    ];
}
```

### ✅ Kullanımı

```php
Product::factory()->count(50)->create(); // 50 sahte ürün oluşturur
```

---

## 🔹 Seeder Nedir?

> **Seeder**, belirli tabloları **otomatik olarak verilerle doldurur.**

```bash
php artisan make:seeder ProductSeeder
```

Oluşan dosya: `database/seeders/ProductSeeder.php`

### 🔧 Örnek `ProductSeeder`

```php
use Illuminate\Database\Seeder;
use App\Models\Product;

class ProductSeeder extends Seeder
{
    public function run(): void
    {
        Product::factory()->count(50)->create(); // 50 ürün oluştur
    }
}
```

---

## 🔗 Seeder'ı `DatabaseSeeder` dosyasına ekle

`database/seeders/DatabaseSeeder.php` dosyasında şu satırı ekle:

```php
public function run(): void
{
    $this->call([
        ProductSeeder::class,
    ]);
}
```

---

## 🧪 Artisan Komutları

| Komut                                       | Açıklama                            |
| ------------------------------------------- | ----------------------------------- |
| `php artisan make:factory ModelFactory`     | Factory oluşturur                   |
| `php artisan make:seeder SeederName`        | Seeder dosyası oluşturur            |
| `php artisan db:seed`                       | `DatabaseSeeder` çalıştırır         |
| `php artisan db:seed --class=ProductSeeder` | Sadece belirli seeder çalıştırır    |
| `php artisan migrate:fresh --seed`          | Tüm tabloları sıfırlar ve seed eder |

---

## 🎯 Örnek Uygulama

### 1. Ürün Modeli Oluştur:

```bash
php artisan make:model Product -m
```

Migration dosyasını düzenle:

```php
Schema::create('products', function (Blueprint $table) {
    $table->id();
    $table->string('name');
    $table->decimal('price', 8, 2);
    $table->integer('stock');
    $table->timestamps();
});
```

```bash
php artisan migrate
```

---

### 2. Factory oluştur:

```bash
php artisan make:factory ProductFactory --model=Product
```

### 3. Seeder oluştur:

```bash
php artisan make:seeder ProductSeeder
```

İçine şunu yaz:

```php
Product::factory()->count(20)->create();
```

`DatabaseSeeder.php` içinde çağır:

```php
$this->call(ProductSeeder::class);
```

---

### 4. Seeder’ı çalıştır:

```bash
php artisan db:seed
```

🟢 Veritabanında artık 20 sahte ürün olacak.

---

## ✅ Özet Tablo

| Yapı       | Görev                                    |
| ---------- | ---------------------------------------- |
| Factory    | Sahte veri üretimi (fake)                |
| Seeder     | Veritabanına verileri otomatik doldurmak |
| `create()` | Veritabanına yazmak                      |
| `make()`   | Hafızada nesne oluşturur, kaydetmez      |

---
