# JWT Kurulum

```bash
composer require php-open-source-saver/jwt-auth
```

## JWT Yapılandırma

```bash
php artisan vendor:publish --provider="PHPOpenSourceSaver\JWTAuth\Providers\LaravelServiceProvider"
```

> **Note:** Bu komut, `config/jwt.php` dosyasını oluşturur.

## JWT Gizli Anahtar Oluşturma

```bash
php artisan jwt:secret
```

> **Note:** Bu komut, `.env` dosyasına `JWT_SECRET` anahtarını ekler.

## Auth Konfigürasyon

**Dosya:** `config/auth.php`

<details>
<summary><b>auth.php</b></summary>

```php

     'defaults' => [
        'guard' => env('AUTH_GUARD', 'api'),
        'passwords' => env('AUTH_PASSWORD_BROKER', 'users'),
    ],

 'guards' => [
        'api' => [
            'driver' => 'jwt',
            'provider' => 'users',
        ],
    ],
```

</details>

> **Notes:** Bu dosyada `17. satırda ` yer alan guard kısmındaki `web` yerine `api` yazılmalıdır.

> Bu dosyada 44.satıra `guards` bölümü eklenmelidir.

> `AUTH_GUARD` `.env` dosyasında `api` olarak ayarlanabilir.

```bash
AUTH_GUARD=api
```
