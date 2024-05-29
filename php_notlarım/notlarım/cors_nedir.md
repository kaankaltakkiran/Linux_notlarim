## CORS Nedir?
CORS (Cross-Origin Resource Sharing), bir web sayfasının kendi domaini dışındaki bir kaynağa (API, resim, CSS dosyası vb.) erişim yapmasına izin vermek için kullanılan bir güvenlik mekanizmasıdır.

 Tarayıcılar, bir kaynağa yapılan isteğin güvenli olup olmadığını kontrol etmek için CORS politikalarını uygularlar.
 
  CORS hatası genellikle, sunucunun gelen isteklere izin vermediğinde ortaya çıkar.
  ## CORS Hatası Nasıl Engellenir ?
Sunucunuzun doğru CORS başlıklarını döndürmesini sağlayarak, tarayıcının isteğe izin vermesini sağlarsınız.

Bu kod parçası, sunucunuzun gelen isteklerin hangi domainlerden, hangi HTTP yöntemleriyle ve hangi başlıklarla yapılabileceğini belirler.

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
### CORS Başlıklarının Anlamı Nedir?

1. `header('Access-Control-Allow-Origin: *')`:
- Bu başlık, hangi domainlerin bu kaynağa erişim yapabileceğini belirler. `*` kullanmak, tüm domainlere izin verir. 

- Belirli bir domain izin vermek isterseniz, `*` yerine domain adını kullanabilirsiniz (örneğin, http://example.com).

2. `header('Access-Control-Allow-Methods: GET, POST, OPTIONS')`:

- Bu başlık, hangi HTTP yöntemlerinin (GET, POST, OPTIONS gibi) izinli olduğunu belirler.

- Bu örnekte GET, POST ve OPTIONS yöntemlerine izin verilmiştir.

3. `header('Access-Control-Allow-Headers: Content-Type, Authorization')`:

- Bu başlık, hangi özel başlıkların izinli olduğunu belirler. 

- Bu örnekte Content-Type ve Authorization başlıklarına izin verilmiştir.

4. `header('Content-Type: application/json')`:

- Bu başlık, sunucunun döndüreceği içeriğin türünü belirtir.

 - Bu örnekte **JSON** olarak belirtilmiştir.

 5. `$method = $_SERVER['REQUEST_METHOD']`:

- Bu satır, gelen HTTP isteğinin yöntemini alır (GET, POST, OPTIONS gibi).

> "OPTIONS" isteği, tarayıcı tarafından sunucuya gönderilen bir preflight (ön kontrol) isteğidir. Bu istek, belirli **bir HTTP isteğinin (genellikle GET, POST, PUT, DELETE vb.) güvenli olup olmadığını kontrol eder**.

  6. `if ($method === 'OPTIONS') { http_response_code(200); exit; }`:

- Bu kontrol, gelen isteğin OPTIONS yöntemi olup olmadığını kontrol eder.

 - Eğer OPTIONS isteği ise, sunucu 200 HTTP durumu kodu ile yanıt verir ve işlemi sonlandırır (exit;).

   ## json_decode ve php://input Ne İşe Yarar ?
Örnek Kod:
  ```php
<?php
$data = json_decode(file_get_contents("php://input"));

// $data artık JSON verisinin PHP'deki temsilidir. Yani:
// $data->name "John Doe" değerini,
// $data->age ise 30 değerini tutar.

// Veriyi kullanarak bir işlem yapabilirsiniz, örneğin:
if (isset($data->name) && isset($data->age)) {
    echo "Name: " . $data->name . "\n";
    echo "Age: " . $data->age . "\n";
} else {
    echo "Invalid input";
}
?>
 ```
 1. `json_decode()`:
-  Json formatındaki verileri php formatına çevirir.
 2. `file_get_contents("php://input")`:
-  Bu, gönderilen POST isteğinin gövdesini alır, yani '{"name":"John Doe","age":30}' metnini.

- `php://input`, PHP'de HTTP isteğinin gövdesine doğrudan erişmek için kullanılan özel bir veri akış kaynağıdır. Belirli durumlarda, özellikle ham POST ve PUT istekleri için kullanışlıdır.