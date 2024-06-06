# Genel Php Notlarım

## isset() Fonksiyonu Nedir Ve Nasıl Kullanılır ?

Bir değişkenin tanımlanmış olup olmadığını ve null değerinde olup olmadığını kontrol eder.

Değişken tanımlıysa ve null değilse TRUE, değilse FALSE döndürür.

Örnek kullanım:

```php
$x = 5;

if (isset($x)) {
  echo "x değişkeni tanımlı ve null değeri değil.";
} else {
  echo "x değişkeni tanımsız veya null.";
}
// çıktı: x değişkeni tanımlı ve null değeri değil.
```

## intval() Fonksiyonu Nedir Ve Nasıl Kullanılır ?

Bir değişkeni tamsayıya dönüştürür.

Değişken tamsayıysa, o değeri; değilse, değişkenin tamsayıya dönüştürülebilen kısmını döndürür. Küsürlü sayılar yuvarlanır.

```php
$x = "12.34";
$y = 5.67;
echo intval($x) . " " . intval($y); // çıktı: 5 12.5
```
