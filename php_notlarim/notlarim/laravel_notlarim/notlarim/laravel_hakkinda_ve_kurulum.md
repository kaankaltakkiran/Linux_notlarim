# 🌟 Laravel Nedir?

**Laravel**, PHP ile yazılmış, açık kaynak kodlu, MVC (Model-View-Controller) mimarisine sahip, modern bir web uygulama çatısıdır (framework). Laravel sayesinde:

- Routing (yönlendirme),
- Authentication (kimlik doğrulama),
- ORM (Eloquent ile veritabanı işlemleri),
- Blade Template Engine,
- RESTful API geliştirme,
- Queue, Event, Notification gibi gelişmiş yapıların yönetimi

gibi işlevleri hızlı ve düzenli bir şekilde gerçekleştirebilirsin.

---

# 🛠 Laravel Kurulumu (Arch Linux & Diğer Linux Dağıtımları)

## ✅ Gerekli Araçlar

Laravel çalıştırmak için aşağıdakilere ihtiyacın var:

- PHP (>=8.1)
- Composer
- Laravel Installer (isteğe bağlı)
- Web sunucusu: Apache, Nginx veya Laravel'in yerleşik sunucusu
- (Opsiyonel) MySQL, MariaDB veya SQLite gibi veritabanları

---

## 🐧 Arch Linux'ta Laravel Kurulumu

### 1. PHP Kurulumu

```bash
sudo pacman -S php php-cli php-gd php-curl php-mbstring php-xml php-pgsql php-sqlite php-intl unzip
```

### 2. Composer Kurulumu

```bash
sudo pacman -S composer
```

Doğrulamak için:

```bash
composer --version
```

### 3. Laravel Installer (Opsiyonel)

Bu komut PHP, Composer, and the Laravel installer kurulumunu yapar linux dağıtımına için:

```bash
/bin/bash -c "$(curl -fsSL https://php.new/install/linux/8.4)"
```

> Note: Bu komutu çalıştırdıktan sonra oturumu yeniden başlat.

fish terminal kullanıyorsan şu komutu çalıştır ve oturumunu yeniden başlat:

```bash
set -Ux PATH /home/kaan/.config/herd-lite/bin $PATH
```

```bash
set -U fish_user_paths $fish_user_paths /home/kaan/.config/herd-lite/bin
```

Kontrol etmek için:

```bash
which composer
composer --version

which laravel
laravel --version

```

Eğer şu tarz çıktılar alırsan her şey çalışıyor demektir:

```bash
/home/kaan/.config/herd-lite/bin/composer
Composer version 2.x.x ...

/home/kaan/.config/herd-lite/bin/laravel
Laravel Installer 5.x ...
```

Laravel installer global olarak kurulabilir:

```bash
composer global require laravel/installer
```

### 4. Yeni Proje Oluşturma

#### Laravel Installer ile:

```bash
laravel new example-app
```

#### Composer ile:

```bash
composer create-project laravel/laravel proje-adi
```

### 5. Geliştirme Sunucusunu Başlatma

```bash
cd example-app
npm install && npm run build
composer run dev
```

Sonrasında `http://127.0.0.1:8000` adresinde projeni görebilirsin.

---

## 🐧 Diğer Dağıtımlarda Laravel Kurulumu

### Ubuntu/Debian

```bash
sudo apt update
sudo apt install php php-cli php-mbstring php-xml php-curl php-zip php-bcmath unzip curl git composer
```

Composer kurulu değilse:

```bash
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
```

Sonrası Arch ile aynı: `composer create-project` veya `laravel new`.

---

## 💡 Laravel Kurulum Sonrası İpuçları

- `.env` dosyasında veritabanı ve diğer yapılandırmaları yapabilirsin.
- `php artisan migrate` komutu ile veritabanı tablolarını oluşturabilirsin.
- `php artisan make:controller`, `make:model`, `make:migration` gibi artisan komutları geliştirmeni hızlandırır.

---

## 🧪 Test

Laravel projen çalışıyor mu diye test etmek için tarayıcında:

```
http://localhost:8000
```

adresine git. Laravel sayfası geliyorsa her şey yolunda 🎉

---
