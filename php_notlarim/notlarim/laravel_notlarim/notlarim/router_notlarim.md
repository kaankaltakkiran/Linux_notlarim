# laravel Router Notlarım

# 🚦 Laravel Routing (Rotalama) Sistemi

Laravel’de route tanımlamaları genellikle `routes/web.php` veya `routes/api.php` dosyalarında yapılır.

| Dosya     | Ne için kullanılır                        |
| --------- | ----------------------------------------- |
| `web.php` | Web arayüzü için (oturum, CSRF, vs)       |
| `api.php` | API istekleri için (genellikle stateless) |

---

## 🔹 Temel Route Tanımları

### 1. GET route

```php
Route::get('/hello', function () {
    return 'Merhaba Laravel!';
});
```

### 2. POST route

```php
Route::post('/gonder', function () {
    return 'Form gönderildi!';
});
```

### 3. Route ile Controller çağırmak

```php
Route::get('/products', [ProductController::class, 'index']);
```

---

## 🔹 Route Metotları

| Metot    | Açıklama                     |
| -------- | ---------------------------- |
| `get`    | Tarayıcıdan veri çekmek      |
| `post`   | Veri göndermek (form vs)     |
| `put`    | Veri güncellemek             |
| `delete` | Veri silmek                  |
| `patch`  | Veri güncellemek (kısmi)     |
| `any`    | Her HTTP metodu kabul edilir |
| `match`  | Belirli HTTP metodları için  |

### Örnek:

```php
Route::match(['get', 'post'], '/contact', [ContactController::class, 'handle']);
Route::any('/search', [SearchController::class, 'query']);
```

---

## 📌 Route Parametreleri

### Zorunlu Parametre

```php
Route::get('/user/{id}', function ($id) {
    return "Kullanıcı ID: " . $id;
});
```

### Opsiyonel Parametre

```php
Route::get('/kategori/{ad?}', function ($ad = null) {
    return $ad ?? 'Kategori seçilmedi';
});
```

---

## 🔐 Route Middleware Ekleme

```php
Route::get('/dashboard', function () {
    return 'Admin Paneli';
})->middleware('auth');
```

---

# 🧩 Route::resource – CRUD Rotalarını Otomatik Oluşturur

Laravel’de CRUD işlemleri için tek tek 7 tane route yazmak yerine **tek satırda** `resource` ile hepsini oluşturabilirsin:

```php
Route::resource('products', ProductController::class);
```

### Bu şu 7 rotayı oluşturur:

| HTTP Metodu | URL                 | Controller Metodu | Amaç            |
| ----------- | ------------------- | ----------------- | --------------- |
| GET         | /products           | index             | Listele         |
| GET         | /products/create    | create            | Form göster     |
| POST        | /products           | store             | Kaydet          |
| GET         | /products/{id}      | show              | Tek ürün göster |
| GET         | /products/{id}/edit | edit              | Formu doldur    |
| PUT/PATCH   | /products/{id}      | update            | Güncelle        |
| DELETE      | /products/{id}      | destroy           | Sil             |

### 🔨 Controller Oluştur:

```bash
php artisan make:controller ProductController --resource
```

Bu komut, içinde bu 7 metodu barındıran bir controller üretir.

---

## 📂 Route Grupları

### Prefix ile:

```php
Route::prefix('admin')->group(function () {
    Route::get('/panel', function () {
        return 'Admin Paneli';
    });

    Route::get('/ayarlar', function () {
        return 'Ayarlar';
    });
});
```

### Middleware ile:

```php
Route::middleware(['auth'])->group(function () {
    Route::get('/profile', function () {
        return 'Profil sayfası';
    });
});
```

---

## ✅ Özet Tablo

| Yapı                  | Anlamı                                                     |
| --------------------- | ---------------------------------------------------------- |
| `Route::get()`        | GET isteği (sayfa gösterme)                                |
| `Route::post()`       | POST isteği (form gönderme)                                |
| `Route::resource()`   | CRUD rotalarını topluca tanımlar                           |
| `Route::middleware()` | Giriş gibi kontrol şartları ekler                          |
| `Route::prefix()`     | URL başına grup yolu ekler                                 |
| `Route::name()`       | Rotalara isim vererek kolay yönlendirme yapılmasını sağlar |

---

## 🎁 Bonus: Route'a İsim Verme

```php
Route::get('/anasayfa', [PageController::class, 'home'])->name('home');
```

Kullanımı:

```blade
<a href="{{ route('home') }}">Anasayfa</a>
```
