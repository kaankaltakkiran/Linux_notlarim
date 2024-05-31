# Type Assertions(Tip Doğrulama)
**Bazen TypeScript compiler'ını verdiğimiz değer tiplerini ondan daha iyi bildiğimizi ikna etmemiz gerekebilir.**

Olası bir tiplemenin önüne geçerek daha doğru bir tip oluşturabiliriz.

**Örneğin document.getElementById yazdığınızda TypeScript bunun bi çeşit HTMLElement olduğunu tahmin edecektir ancak siz sayfanızda her zaman ID'si olan bir HTMLCanvasElement'i olacağını** biliyorsunuzdur.

Bu tür durumlarda daha spesifik bir tip belirlemek amacıyla type assertion kullanabilirsiniz.

Örneğin:
 ```js
const myCanvas = document.getElementById("main_canvas") as HTMLCanvasElement;
```
**Kodunuz bir .tsx dosyası içerisinde değilse bu yapıyı küçüktür/büyüktür işaretleri ile de kullanabilirsiniz** (.tsx dosyalarında bu kullanım componentlar ile karışabiliyor):
 ```js
const myCanvas = <HTMLCanvasElement>document.getElementById("main_canvas");
```
**Bir any değerinden number değerine gibi başka bir tipe geçişlerde de type assertion'ı** kullanırız.

 **Ancak TypeScript sadece daha az ya da daha spesifik tiplere dönüşümlerde buna izin verir.**.
 Örneğin:
 ```js
const x = "hello" as number;

🚨 Conversion of type 'string' to type 'number' may be a mistake 
because neither type sufficiently overlaps with the other. 
If this was intentional, convert the expression to 'unknown' first.
```