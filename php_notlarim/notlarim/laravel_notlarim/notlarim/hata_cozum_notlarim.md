# Laravel Hata Çözüm Notlarım

## Database Bağlantı Sorunu

Laravel projesini oluştduktan sonra veritabanı için `.env` dosyasında `DB_PASSWORD` kısmına databese şifresini yazmalıyız ve `DB_DATABASE` adına karşılık gelen database adı local database de oluşturulmalı.

Örnek `.env` database kısmı:

```bash
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=first_project
DB_USERNAME=root
DB_PASSWORD=database_sifresi
```

Daha sonra `ctrl+c` ile projeyi durdurup terminalden `migration` komutu çalıştırmalıyız. Aşağıdaki komut ile veritabanı tablolarını oluşturabiliriz.

```bash
php artisan migrate
```

Son olarak projemizi başlatmak için terminalden aşağıdaki komutu çalıştırmalıyız:

```bash
composer run dev
```

## Laravel Türkiye Timezone Ayarlama

Laravel projesinde Türkiye için timezone ayarlamak için `config/app.php` dosyasında `timezone` kısmını aşağıdaki gibi düzenleyebiliriz:

```php

'timezone' => env('APP_TIMEZONE', 'UTC'),
```

ve `.env` dosyasında `APP_TIMEZONE` değerini ekle ve timezone `Europe/Istanbul` olarak ayarlayabiliriz:

```bash
APP_TIMEZONE=Europe/Istanbul
```

## Laravel Personel Token Expire Date Ayarlama

`config/sanctum.php` dosyasında `expiration` değerini ayarlayarak personel token'larının ne kadar süre geçerli olacağını belirleyebiliriz. Örneğin, 1 gün geçerli olacak şekilde ayarlamak için:

```php
'expiration' => 3600
```

`app/controllers/AuthController.php` dosyasında örneğin kullanıcı login işlemi sırasında token oluştururken `expiresAt` parametresini kullanarak token'ın geçerlilik süresini belirleyebiliriz. Örneğin, 1 gün geçerli olacak şekilde:

```php
 $token=$user->createToken($user->name,expiresAt: now()->addDay());
```

### Kaynakça-

- [Laravel Resmi Dokümantasyonu](https://laravel.com/docs)

- [Database Bağlantı Sorunu Çözüm Videosu](https://www.youtube.com/watch?v=AppwyIBAs74&list=FLRi8LZ2PetKpAdDVN17oDxg)

- [Türk Timezone Forum](https://laravel.gen.tr/d/4164-local-timezone-ayari)

- [Timezone Ayarlama](https://docs.vultr.com/how-to-set-the-timezone-in-laravel)
