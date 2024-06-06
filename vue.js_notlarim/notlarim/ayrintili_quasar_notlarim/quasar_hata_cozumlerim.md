# Quasarda Uygulama Geliştirirken Yaşadığım Sorunlar Ve Çözümü

## Cors Hatası Nasıl Çözülür ?

[Cors hakkında detaylı bilgi](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/php_notlarim/notlarim/cors_nedir.md)

Aşığıdaki kodları api dosyasına ekleyerek sorun çözülür.

```php
// CORS başlıkları
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
header('Content-Type: application/json');

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'OPTIONS') {
  http_response_code(200);
  exit;
}

```
