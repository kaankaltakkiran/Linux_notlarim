# Laravel Register Login Notlarım

# 🔐 Laravel'de `Auth::attempt()` ve `Auth::login()` Nedir?

Laravel, kullanıcı giriş işlemleri için içinde hazır `Auth` sistemi barındırır. Bu sistem sayesinde formdan gelen kullanıcı bilgileriyle **oturum başlatmak**, **şifre kontrolü yapmak**, **kullanıcıyı oturum açmış saymak** çok kolaydır.

Laravel'in `Auth` sınıfı birçok yardımcı fonksiyon içerir. Bunlardan en sık kullanılan ikisi:

| Fonksiyon         | Ne Yapar?                                                     |
| ----------------- | ------------------------------------------------------------- |
| `Auth::attempt()` | E-posta + şifre ile kullanıcı doğrulaması yapar               |
| `Auth::login()`   | Belirli bir kullanıcıyı (şifre kontrolü yapmadan) oturum açar |

---

## 🧪 1. `Auth::attempt()` – Kullanıcı Bilgileri ile Giriş

### 🔸 Ne işe yarar?

Formdan gelen e-posta ve şifre bilgilerini alır, veritabanındaki kullanıcı ile **eşleşiyorsa** oturum başlatır.

### 🧠 Laravel şifreleri otomatik olarak `bcrypt` ile hashlediği için, `attempt()` bu hash'i **otomatik kontrol eder.**

### 🔨 Örnek:

```php
use Illuminate\Support\Facades\Auth;

public function login(Request $request)
{
    $credentials = $request->only('email', 'password');

    if (Auth::attempt($credentials)) {
        // Giriş başarılı → kullanıcı oturum açtı
        return redirect()->intended('dashboard');
    } else {
        // Giriş başarısız
        return back()->withErrors([
            'email' => 'E-posta ya da şifre hatalı.',
        ]);
    }
}
```

### 📌 Not:

- `Auth::attempt()` TRUE dönerse giriş başarılıdır.
- Giriş başarılıysa Laravel otomatik olarak kullanıcıyı "oturum açmış" kabul eder.

---

## 🧪 2. `Auth::login()` – Kullanıcıyı Doğrudan Giriş Yaptır

### 🔸 Ne işe yarar?

Bir kullanıcı nesnesini (model) alır ve **şifre kontrolü yapmadan** oturum başlatır.

### 🔨 Örnek:

```php
$user = User::find(1); // id=1 olan kullanıcıyı al
Auth::login($user);   // Doğrudan giriş yaptır
```

### 📌 Nerede kullanılır?

- Sosyal medya girişlerinde
- Admin panelinden bir kullanıcıya giriş yapma
- `remember me` veya otomatik oturum işlemlerinde

---

## 🔐 Kullanıcı Girişi Sonrası Kontroller

| Kod              | Anlamı                             |
| ---------------- | ---------------------------------- |
| `Auth::check()`  | Kullanıcı giriş yapmış mı?         |
| `Auth::user()`   | Giriş yapan kullanıcıyı getirir    |
| `Auth::id()`     | Giriş yapan kullanıcının ID'si     |
| `Auth::logout()` | Kullanıcının oturumunu sonlandırır |

---

## ✅ Kısaca Özet

| Fonksiyon         | Açıklama                                    |
| ----------------- | ------------------------------------------- |
| `Auth::attempt()` | Formdan gelen e-posta/şifre ile giriş yapar |
| `Auth::login()`   | Kullanıcı nesnesi ile direkt giriş yaptırır |
| `Auth::logout()`  | Oturumu kapatır                             |

---

## 🧪 Gerçekçi Senaryo

```php
// LoginController.php

public function login(Request $request)
{
    $credentials = $request->only('email', 'password');

    if (Auth::attempt($credentials)) {
        // Kullanıcı giriş yaptı
        return redirect()->route('dashboard');
    }

    return back()->with('error', 'Giriş başarısız');
}
```

---

İstersen Laravel'in Auth sistemini `laravel breeze`, `laravel ui` veya `jetstream` gibi paketlerle de kurabiliriz. Login + register sayfaları otomatik geliyor. Yardımcı olayım mı?

Harika gidiyorsun Kaan! Laravel’in `Auth` sistemiyle ilgili bilmen gereken önemli kavramları, fonksiyonları ve özellikle `intended()` gibi sık kullanılan yapıları **basit ve örnekli** şekilde aşağıda topladım.

---

# 🔐 Laravel Auth Sistemi Genel Bilgi

Laravel'in `Auth` sistemi, kullanıcı kimlik doğrulama işlemlerini (giriş, çıkış, yetkilendirme, oturum yönetimi) hızlıca yapmanı sağlar. Laravel bu işlemleri kolaylaştırmak için birçok yardımcı fonksiyon sunar.

---

## ✅ `Auth::attempt()` (Giriş yapma)

```php
Auth::attempt(['email' => $email, 'password' => $password]);
```

Eğer bilgiler doğruysa giriş yapar, değilse `false` döner.

---

## 🧭 `redirect()->intended('hedef')` Nedir?

### 📌 Ne işe yarar?

Kullanıcı giriş yapmadan önce bir **korumalı sayfaya** (örneğin `/dashboard`) gitmeye çalıştıysa ve sistem onu `/login` sayfasına yönlendirdiyse, giriş yaptıktan sonra **tekrar o önceki sayfaya otomatik yönlendirilmesini sağlar.**

### 🔧 Kullanımı:

```php
if (Auth::attempt($credentials)) {
    return redirect()->intended('dashboard');
}
```

Bu sayede kullanıcı giriş yaptıktan sonra, girişten önce gitmek istediği yere döner.
Eğer böyle bir yönlendirme yoksa `'dashboard'` gibi varsayılan adrese gider.

### 🧠 Kısaca:

> `intended()` ➝ Giriş öncesi hedeflenen sayfaya yönlendir.

---

## 📚 Laravel'de Sık Kullanılan `Auth` Fonksiyonları

| Fonksiyon                | Açıklama                                                           |
| ------------------------ | ------------------------------------------------------------------ |
| `Auth::attempt()`        | Kullanıcı girişini kontrol eder (şifre dahil)                      |
| `Auth::login($user)`     | Şifre kontrol etmeden oturum açtırır (direkt login)                |
| `Auth::check()`          | Kullanıcı giriş yapmış mı? (`true/false`)                          |
| `Auth::user()`           | Giriş yapan kullanıcıyı getirir (`User` modeli)                    |
| `Auth::id()`             | Giriş yapan kullanıcının ID’sini getirir                           |
| `Auth::logout()`         | Oturumu kapatır                                                    |
| `redirect()->intended()` | Kullanıcıyı giriş yapmadan önceki hedef sayfaya yönlendirir        |
| `auth()->guard()`        | Belirli guard (örneğin admin, api) kullanarak giriş/çıkış yönetimi |

---

## 🧪 Giriş ve Yönlendirme Örneği

```php
public function login(Request $request)
{
    $credentials = $request->only('email', 'password');

    if (Auth::attempt($credentials)) {
        // Başarılı giriş → önceki hedef sayfaya veya dashboard'a yönlendir
        return redirect()->intended('dashboard');
    }

    return back()->withErrors([
        'email' => 'Giriş bilgileri hatalı.',
    ]);
}
```

---

## 🧩 Guard Nedir?

Laravel'de birden fazla kullanıcı türü varsa (örneğin: kullanıcı + admin), **guard** sistemiyle onları ayırabilirsin.

```php
auth()->guard('admin')->attempt([...]);
```

Bunun ayarları `config/auth.php` dosyasındadır.

---

## 🔐 Auth Sistemini Otomatik Kurmak (İsteğe bağlı)

| Paket            | Özellikler                                         |
| ---------------- | -------------------------------------------------- |
| `Laravel Breeze` | Hafif auth (login/register) + Blade + Tailwind     |
| `Laravel UI`     | Auth sistemi + Bootstrap / Vue / React seçenekleri |
| `Jetstream`      | Gelişmiş auth: 2FA, team, API token, vs.           |

Kurmak için örnek:

```bash
composer require laravel/breeze --dev
php artisan breeze:install
npm install && npm run dev
php artisan migrate
```

---

## ✅ Kısaca Özet

| Yapı                     | Anlamı                                           |
| ------------------------ | ------------------------------------------------ |
| `Auth::attempt()`        | Giriş bilgileri ile oturum başlat                |
| `Auth::login($user)`     | Doğrudan kullanıcıyı giriş yaptır                |
| `Auth::logout()`         | Oturumu kapat                                    |
| `Auth::check()`          | Giriş yapılmış mı kontrol et                     |
| `redirect()->intended()` | Girişten önce gidilmek istenen sayfaya yönlendir |

---

# 🔐 Laravel Oturum (Session) Yönetimi

Kullanıcı giriş yaptıktan sonra sistemde onu "oturum açık" olarak tutar. Çıkış yapıldığında bu oturum kapatılır.

Laravel’de bu işlemler güvenli şekilde yapılır:

---

## 🔸 `Auth::logout()` – Kullanıcı Oturumunu Sonlandırır

### 📌 Ne işe yarar?

- Giriş yapmış kullanıcıyı sistemden **çıkış** yaptırır.
- Kullanıcıyı oturumdan (session’dan) **ayırır.**
- Genellikle `logout` butonlarında kullanılır.

### 🔧 Kullanımı:

```php
use Illuminate\Support\Facades\Auth;

public function logout(Request $request)
{
    Auth::logout();

    $request->session()->invalidate();
    $request->session()->regenerateToken();

    return redirect('/login');
}
```

---

## 🔸 `$request->session()->invalidate()` – Oturumu Geçersiz Kılar

### 📌 Ne işe yarar?

- Session ID’yi geçersiz yapar.
- Kullanıcının eski oturumu artık kullanılamaz hale gelir.
- Güvenlik amacıyla kullanılır (örneğin çerez kopyalama saldırılarına karşı).

### 🧠 Neden kullanılır?

> Kullanıcı çıkış yaptıysa, eski oturumun çerezlerinin bir şekilde ele geçirilmesi durumunda tekrar erişilmesini engeller.

---

## 🔸 `$request->session()->regenerateToken()` – CSRF Token’ı Yeniler

### 📌 Ne işe yarar?

- Yeni bir **CSRF token** üretir.
- Oturumu kapatıp tekrar giriş yapılınca **eski token’ı kullanarak form gönderimi yapılamasın** diye güvenlik sağlar.

### 🧠 Ne zaman kullanılır?

> Genellikle **logout** ve **login** işlemlerinden sonra yapılır.

---

## 🔐 Örnek: Güvenli Logout Metodu

```php
public function logout(Request $request)
{
    Auth::logout(); // kullanıcıyı çıkış yaptır

    $request->session()->invalidate();       // oturumu geçersiz yap
    $request->session()->regenerateToken();  // csrf token'ı yenile

    return redirect('/login'); // login sayfasına yönlendir
}
```

---

## ✅ Kısaca Özet Tablo

| Komut                                    | Görevi                                              |
| ---------------------------------------- | --------------------------------------------------- |
| `Auth::logout()`                         | Kullanıcıyı sistemden çıkarır                       |
| `$request->session()->invalidate()`      | Oturumu sıfırlar, eski session ID'yi geçersiz yapar |
| `$request->session()->regenerateToken()` | CSRF token'ı yeniler (güvenlik için)                |

---

## 👨‍💻 Ekstra Bilgi: `login()` sonrası da kullanılabilir

```php
Auth::login($user);
$request->session()->regenerate(); // oturum ID'si değişir
```

---

# 🛡️ Laravel Middleware Rehberi

---

## 📌 Middleware Nedir?

Middleware = Laravel’in "gümrük kapısı" gibi çalışır.

> Bir HTTP isteği sunucuya ulaşmadan **önce veya sonra** kontrol etmek için kullanılır.

Örneğin:

- Kullanıcı giriş yapmış mı?
- Admin mi?
- Site bakımdaysa durdur?
- API token doğru mu?

---

## ✅ Laravel'de Hazır Middleware'ler

| Middleware Adı | Ne Yapar?                                   |
| -------------- | ------------------------------------------- |
| `auth`         | Kullanıcı giriş yapmış mı kontrol eder      |
| `guest`        | Giriş yapmamış kullanıcıya izin verir       |
| `verified`     | E-posta doğrulaması yapılmış mı?            |
| `throttle`     | Rate limiting (örneğin 60 istek/dk)         |
| `csrf`         | CSRF koruması sağlar                        |
| `signed`       | İmza doğrulaması olan linkleri kontrol eder |

## 🧪 Sık Kullanılan Middleware Metotları

| Metot/Fonksiyon        | Görevi                                       |
| ---------------------- | -------------------------------------------- |
| `handle()`             | Middleware’in ana çalıştığı fonksiyon        |
| `$next($request)`      | İsteği sıradaki aşamaya iletir               |
| `return redirect()`    | Kullanıcıyı yönlendirir (örneğin yetkisizse) |
| `abort(403)`           | Erişim yasak (HTTP 403) döner                |
| `return response(...)` | Kendi özel cevabını dönebilir                |

---

## 📦 Middleware Kullanım Alanları

| Amaç                         | Middleware                          |
| ---------------------------- | ----------------------------------- |
| Giriş kontrolü               | `auth`                              |
| Sadece misafirler (girişsiz) | `guest`                             |
| Admin yetkisi                | Özel middleware (`CheckAdmin` gibi) |
| E-posta doğrulama            | `verified`                          |
| Çok fazla istek (spam)       | `throttle:60,1`                     |

---

## 🧠 Örnek: Admin Kontrolü Middleware

```php
public function handle(Request $request, Closure $next)
{
    if (!auth()->check() || auth()->user()->role !== 'admin') {
        abort(403, 'Bu alana sadece yöneticiler erişebilir.');
    }

    return $next($request);
}
```

---

## 🧠 Örnek: API Token Doğrulama Middleware

```php
public function handle(Request $request, Closure $next)
{
    if ($request->header('API_KEY') !== config('app.api_key')) {
        return response()->json(['error' => 'Unauthorized'], 401);
    }

    return $next($request);
}
```

---

## ✅ Kısaca Özet

| Kavram            | Anlamı                                         |
| ----------------- | ---------------------------------------------- |
| Middleware        | HTTP isteğini filtrelemek için kullanılan yapı |
| `handle()`        | Middleware’in çalıştığı ana metot              |
| `$next($request)` | Devam etmesini sağlar                          |
| `abort()`         | Hata döndürür (örneğin 403, 401)               |
| `redirect()`      | Başka bir sayfaya yönlendirir                  |
