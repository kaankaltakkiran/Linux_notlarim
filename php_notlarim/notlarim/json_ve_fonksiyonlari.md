# Json Ve Önemli Json Php Fonksiyonları

## Json nedir ?

`JSON (JavaScript Object Notation),` web sunucuları ve uygulamalar arasında veri alışverişi yapmak için kullanılan hafif bir veri formatıdır.

Dizi, nesne, sayı, metin ve bool gibi temel veri türlerini temsil etmek için insan dostu bir metin tabanlı sözdizimi kullanır.

Örnek json yapısı:

```json
{
  "ad": "Can",
  "soyad": "Yılmaz",
  "yas": 30,
  "sehir": "İstanbul",
  "hobiler": ["film izlemek", "kitap okumak", "yüzmek"]
}
```

## json_encode() Fonksiyonu Nedir Ve Nasıl Kullanılır?

`json_encode()` fonksiyonu, PHP'de bulunan ve PHP değişkenlerini, dizilerini ve nesnelerini JavaScript Object Notation (JSON) formatına dönüştürmek için kullanılan bir fonksiyondur.

Örnek kullanım:

```php
$veri = array(
  "ad" => "Can",
  "soyad" => "Yılmaz",
  "sehir" => "İstanbul"
);
$jsonDizisi = json_encode($veri);
echo $jsonDizisi; // Çıktı: {"ad":"Can","soyad":"Yılmaz","sehir":"İstanbul"}
```

## JSON_UNESCAPED_SLASHES Nedir Ve Nasıl Kullanılır?

json_encode fonksiyonu ile JSON formatına dönüştürülen bir dizideki ters eğik çizgileri (\) kaçırmadan yazdırmayı sağlayan bir sabittir.

Örnek kullanım:

```php
$veri = array(
  "dosya_yolu" => "/home/kullanici/dosyalarim"
);

$json1 = json_encode($veri);

$json2 = json_encode($veri, JSON_UNESCAPED_SLASHES);

echo $json1; //çıktı: {"dosya_yolu":"\/home\/kullanici\/dosyalarim"}

echo $json2; //çıktı: {"dosya_yolu":"/home/kullanici/dosyalarim"}
```

## JSON_UNESCAPED_UNICODE Nedir Ve Nasıl Kullanılır?

Bu buyruk, JSON kodlarken Unicode karakterlerinin kaçmadan gönderilmesini sağlar.

Örnek kullanım:

```php
$data = array("ad" => "Ömer", "soyad" => "Şahin", "meslek" => "Yazılım Mühendisi");

echo json_encode($data); //çıktı: {"ad":"\u00D6mer","soyad":"\u015Eahin","meslek":"Yazılım Mühendisi"}

echo json_encode($data, JSON_UNESCAPED_UNICODE); //çıktı {"ad":"Ömer","soyad":"Şahin","meslek":"Yazılım Mühendisi"}
```

## JSON_PRETTY_PRINT Nedir Ve Nasıl Kullanılır?

Bu buyruk, JSON kodunu daha okunabilir hale getirir. Girinti ve satır sonları ekleyerek JSON çıktısını düzenler.

Bu, özellikle karmaşık JSON nesnelerini analiz etmeyi kolaylaştırır.

Örnek kullanım:

```php
$data = array("ad" => "Ömer", "soyad" => "Şahin", "meslek" => "Yazılım Mühendisi");
echo json_encode($data, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
```

Yukarıdaki kodun çıktısı:

```json
{
  "ad": "Ömer",
  "soyad": "Şahin",
  "meslek": "Yazılım Mühendisi"
}
```

## json_decode() Fonksiyonu Nedir Ve Nasıl Kullanılır?

`json_decode()`, Gelen HTTP isteğinin gövdesindeki JSON verisini PHP dizisine dönüştürür.

Örnek kullanım:

```php
$jsonString = '{"ad": "Can", "soyad": "Yılmaz", "yas": 30}';

$data = json_decode($jsonString);

echo $data->ad; // Çıktı: Can
echo $data->soyad; // Çıktı: Yılmaz
echo $data->yas; // Çıktı: 30
```

## file_get_contents("php://input") Yapısı Ne İşe Yarar ?

`file_get_contents("php://input"):` Bu kısım, HTTP isteğinin gövdesindeki ham verileri okur.

`php://input` bir pseudo-protokol olup, sunucuda gelen HTTP isteğinin gövdesine erişim sağlar.

## JSON.parse() Fonksiyonu Nedir Ve Nasıl Kullanılır?

`JSON.parse()`, Bir JSON string'ini JavaScript nesnesine dönüştürmek için kullanılır.

Yani, metin formatındaki JSON verisini, JavaScript'in anlayabileceği bir veri yapısına çevirir.

Bu fonksiyon, sunucudan gelen JSON yanıtlarını işlemek veya yerel depolamada saklanan JSON verilerini okumak gibi durumlarda kullanılır.

Örnek kullanım:

```Js
const jsonString = '{"ad":"Ahmet","soyad":"Yılmaz","yas":30}';
const kullanici = JSON.parse(jsonString);

console.log(kullanici.ad); // Ahmet
console.log(kullanici.soyad); // Yılmaz
console.log(kullanici.yas); // 30
```

## JSON.stringify() Fonksiyonu Nedir Ve Nasıl Kullanılır?

`JSON.parse()`, Bir JavaScript nesnesini JSON string'e dönüştürmek için kullanılır.

Yani, JavaScript'teki veri yapısını, metin formatında bir JSON string'e çevirir.

Bu fonksiyon, JSON verilerini sunucuya göndermek veya yerel depolamada saklamak gibi durumlarda kullanılır.

Örnek kullanım:

```Js
const kullanici = {
  ad: "Ayşe",
  soyad: "Öztürk",
  yas: 25
};

const jsonString = JSON.stringify(kullanici);

console.log(jsonString); // {"ad":"Ayşe","soyad":"Öztürk","yas":25}

```
