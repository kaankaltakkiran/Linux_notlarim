# Arch linux(Garuda linux(Kde)) Kurulum Notlarım

## [Garuda Linux](https://garudalinux.org/) Özellikleri

`Garuda Linux,` Arch Linux işletim sistemi tabanlı bir Linux dağıtımıdır. KDE Plasma dahil, çeşitli popüler Linux masaüstü ortamlarında mevcuttur. Paket yöneticisi olarak Pacman'ı kullanır ve yuvarlanan sürüm güncelleme modeline sahiptir.

Garuda terimi Hinduizm kaynaklı olup kartal benzeri, ilahi bir güneş kuşu ve kuşların kralı anlamına gelir.

---

## Garuda Linux Kurulum Adımları

### LAMA (Linux, Apache, MySQL, and Adminer) Kurulum Notları

#### Apache Kurulum Notları

Aşağıdaki komut sistemi günceller:

```bash
sudo pacman -Syu
```

Aşağıdaki komut `vi editörü` yükler:

```bash
sudo pacman -S vim
```

Aşağıdaki komut `apache` yükler:

```bash
sudo pacman -S apache
```

Aşağıdaki komut `apache confing ` dosyasını vi editör ile açar:

```bash
sudo vi /etc/httpd/conf/httpd.conf
```

Daha sonra aşağıdaki işlemler yapılır:

```bash
# # işareti olan yer kaldırılır
LoadModule unique_id_module modules/mod_unique_id.so
```

Bu ayardan sonra `apache` aktif edilir ve yeniden başlatılır.

```bash
sudo systemctl enable httpd
sudo systemctl restart httpd

```

Aşağıdaki komut ile `apache` servis durumunu görebilirsiniz.

```bash
sudo systemctl status httpd
```

Apache masaüstüne kısayol oluşturma ve izin verme:

```bash
ln -s /srv/http ~/Desktop/http_local
sudo chmod -R u+w /srv/http

```

- [Bir sorun yoksa localhost Düzgün Görünecektir](http://localhost/)

---

#### Mysql(Mariadb) Kurulum Notları

Aşağıdaki komut `mariadb` yükler:

```bash
sudo pacman -S mariadb
```

Aşağıdaki komut gerekli `mariadb` ayarlarını yapar ve aktif eder:

```bash
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mariadb
sudo systemctl enable mariadb
```

Aşağıdaki komut veritabanı güvenlik ayarlarını(şifre,kullanıcı vb) ayarları yapar:

```bash
sudo mysql_secure_installation
```

- Root şifresi oluşturun.
- Anonim kullanıcıları kaldırın.
- Test veritabanını silin.

Aşağıdaki komut ile `mariadb` servis durumunu görebilirsiniz.

```bash
sudo systemctl status mariadb
```

Kurulum başarılı ise mysql versiyonu

```bash
mysql --version
```

---

#### Php Kurulum Notları

Aşağıdaki komut `php ve php-apache` yükler:

```bash
sudo pacman -S php php-apache
```

Aşağıdaki komut `apache confing ` dosyasını vi editör ile açar:

```bash
sudo vi /etc/httpd/conf/httpd.conf
```

Daha sonra aşağıdaki işlemler yapılır:

```bash
# Başına # işareti eklenir
LoadModule mpm_event_module modules/mod_mpm_event.so
```

`En aşağı` satıra eklenir:

```bash
LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
LoadModule php_module modules/libphp.so
AddHandler php-script php
Include conf/extra/php_module.conf
```

Apache yeniden başlatmak için:

```bash
sudo systemctl restart httpd
```

Kurulumu denemek için:

```bash
sudo vi /srv/http/test.php
```

test.php:

```php
<?php
phpinfo();
?>
```

Php versiyon kontrol:

```bash
php -version
```

---

#### Adminer Kurulum Notları

Adminer yükleme dizini oluşturun:

```bash
sudo mkdir -p /srv/http/adminer

```

Oluşturduğunuz dizine gidip `admineri ` yükleyin:

```bash
sudo wget -O /srv/http/adminer/index.php https://www.adminer.org/latest.php
```

Gerekli `izinleri` verin:

```bash
sudo chown -R http:http /srv/http/adminer
sudo chmod -R 755 /srv/http/adminer
```

Gerekli `izinleri` verin:

```bash
sudo chown -R http:http /srv/http/adminer
sudo chmod -R 755 /srv/http/adminer
```

Apache dizinine gidin:

```bash
sudo vi /etc/httpd/conf/httpd.conf
```

En aşağıya ekleyin:

```bash
<Directory "/srv/http/adminer">
    AllowOverride All
    Require all granted
</Directory>
```

`Php.ini` dosyasına gidin:

```bash
sudo vi  /etc/php/php.ini
```

Ardından aşağıdaki `,` işaretini kaldırın

```bash
extension=mysqli
```

`Apache` yeniden başlatın:

```bash
sudo systemctl restart httpd
```

- [Bir sorun yoksa localhost Adminer Ekranı Görünecektir](http://localhost/adminer/)

`httpd.conf` son hali:

```bash

```

### Nodejs,npm Kurulum Notları

Aşağıdaki komut nodejs ve npm yükler:

```bash
sudo pacman -S nodejs npm
```

Kurulum kontrol:

```bash
node -v
npm -v
```

### Git Kurulum Notları

Aşağıdaki komut git yükler:

```bash
sudo pacman -S git
```

Aşağıdaki komut git confing ayarlarını yapar:

```bash
git config --global user.email "durdu.kaan.kaltakkiran@gmail.com"
git config --global user.name "Kaan Kaltakkıran"
```

Aşağıdaki komut git confing ayarlarını listeler:

```bash
git config --global --list
```

### Flatpak Kurulum Notları

Aşağıdaki komut flatpak yükler ve yeniden başlatır:

```bash
sudo pacman -S flatpak
sudo reboot
```

Flatpak versiyon kontrol:

```bash
flatpak --version
```

---

### Alias Kurulum Notları

Aşağıdaki komut fish terminal confing dosyasına gider:

```bash
sudo vim ~/.config/fish/config.fish
```

Aşağıdaki örnek alias:

```bash
alias gunaydin='paru -Syu --noconfirm && flatpak update'
```

Değişikliğin aktif olması için:

```bash
source ~/.config/fish/config.fish
```
