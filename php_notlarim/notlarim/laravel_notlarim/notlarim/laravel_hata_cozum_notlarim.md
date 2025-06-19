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

### Kaynakça-

- [Laravel Resmi Dokümantasyonu](https://laravel.com/docs)

- [Database Bağlantı Sorunu Çözüm Videosu](https://www.youtube.com/watch?v=AppwyIBAs74&list=FLRi8LZ2PetKpAdDVN17oDxg)
