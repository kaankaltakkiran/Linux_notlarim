## JWT Token Nedir?

**JSON Web Token (JWT)**, iki sistem arasında güvenli bir şekilde bilgi alışverişi yapmak için kullanılan bir standarttır. JWT, bilgileri JSON formatında saklar ve genellikle güvenlik amacıyla bir şifreleme veya imzalama algoritması ile korunur.

JWT, genellikle aşağıdaki senaryolarda kullanılır:

- Kullanıcı doğrulama (Authentication)
- Yetkilendirme (Authorization)
- API güvenliği

### JWT'nin Yapısı

Bir JWT üç bölüme ayrılır:

1. **Header (Başlık):** Token türü ve algoritmayı içerir.
2. **Payload (Yük):** Taşınacak bilgileri içerir (örneğin, kullanıcı id, rol).
3. **Signature (İmza):** Token'ın manipüle edilmediğini doğrular.

JWT şu şekilde görünür:

```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJyb2xlIjoiYWRtaW4iLCJleHAiOjE2OTM4NjQ4MDB9.TJVA95OrM7E2cBab30RMHrHDcEfxjoYZgeFONFh7HgQ
```

JWT noktalarla ayrılmış üç bölümden oluşur:

- **Header** (Base64URL ile kodlanmış)
- **Payload** (Base64URL ile kodlanmış)
- **Signature** (Base64URL ile kodlanmış)

---

## JWT Kullanımı

1. **Token oluşturma:** Kullanıcı giriş yaptığında bir token oluşturulur.
2. **Token doğrulama:** API'ye yapılan her istekte bu token doğrulanır.
3. **Token'ın geçerliliğini kontrol etme:** Expiration süresi kontrol edilir.

---

## PHP ile JWT Örneği

PHP'de JWT oluşturmak ve doğrulamak için `firebase/php-jwt` kütüphanesini kullanabilirsiniz.

### Adım 1: Kütüphaneyi Yükleme

Önce [Composer](https://getcomposer.org/) ile kütüphaneyi yükleyin:

```bash
composer require firebase/php-jwt
```

---

### Adım 2: JWT Token Oluşturma

```php
<?php
require 'vendor/autoload.php';

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

$key = "gizli_anahtar"; // İmzalama anahtarınız
$payload = [
    'user_id' => 1,
    'role' => 'admin',
    'iat' => time(), // Token oluşturma zamanı
    'exp' => time() + 3600 // Token geçerlilik süresi (1 saat)
];

// Token oluştur
$jwt = JWT::encode($payload, $key, 'HS256');

echo "Oluşturulan JWT: " . $jwt;
```

---

### Adım 3: JWT Token Doğrulama

```php
<?php
require 'vendor/autoload.php';

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

$key = "gizli_anahtar"; // İmzalama anahtarınız
$receivedToken = $_GET['token']; // Örneğin GET parametresinden token alınır

try {
    // Token doğrulama
    $decoded = JWT::decode($receivedToken, new Key($key, 'HS256'));
    $decodedArray = (array) $decoded;
    echo "Doğrulama başarılı! Kullanıcı bilgileri:\n";
    print_r($decodedArray);
} catch (Exception $e) {
    // Hata durumunda
    echo "Token doğrulama başarısız: " . $e->getMessage();
}
```

---

## Çalışma Mantığı

1. **Token Oluşturma:**

   - Kullanıcı giriş yapar.
   - Kimlik bilgileri doğrulandıktan sonra bir JWT token oluşturulur ve kullanıcıya döndürülür.

2. **Token Doğrulama:**
   - Kullanıcı her API isteğinde token'ı sunar.
   - Sunucu token'ı doğrular ve geçerliliğini kontrol eder.

---

## Avantajları

- **Taşınabilirlik:** Token herhangi bir istemcide kullanılabilir.
- **İmza Kontrolü:** Token üzerinde oynama yapılamaz, bu güvenliği artırır.
- **Durumsuz:** Sunucu tarafında oturum bilgisi tutulmaz.

---

## Örnek Kullanım Akışı

1. **Kullanıcı giriş yapar ve JWT alır.**
2. **JWT, istemci tarafından saklanır (örneğin, tarayıcıda `localStorage`).**
3. **Her istekte JWT, `Authorization: Bearer <token>` şeklinde gönderilir.**
4. **Sunucu, JWT'yi doğrular ve geçerliliğini kontrol eder.**

Bu yapı modern web uygulamalarında sıkça kullanılan güvenli bir yöntemdir.

### Kaynakça

- [Chatgpt Kaynak](https://chatgpt.com/share/67719714-98c0-8008-910b-7278763a6906)

- [Jwt Medium Yazısı](https://tugrulbayrak.medium.com/jwt-json-web-tokens-nedir-nasil-calisir-5ca6ebc1584a)

- [Jwt Web Sitesi](https://jwt.io/)
