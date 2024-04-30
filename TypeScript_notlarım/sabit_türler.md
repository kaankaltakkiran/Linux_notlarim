# Literal types(Sabit Türler)
**Genel tiplerin yanı sıra doğrudan kendi string ve number değişkenlerimizle de tipler oluşturabiliriz.** 

**Tıpkı JavaScript'in var ve let ile tanımlanmış değişkenlerinin değişebildiği ancak const ile tanımlanan değişkenlerin değişmemesi gibi TypeScript'te de değişmeyecek tipler** oluşturabiliriz.
örneğin:
## Literal types
 ```js
let x: "hello" = "hello";

✅ // OK
x = "hello";

x = "howdy";
🚨 Type '"howdy"' is not assignable to type '"hello"'.
 ```

 Örneğin, **bir değişkenin sadece belirli bir string veya sayı değerine sahip olmasını istiyorsanız, literal types** kullanabilirsiniz. 
 
 İşte birkaç örnek:

  ```js
let direction: 'up' | 'down' | 'left' | 'right'; // direction değişkeni sadece 'up', 'down', 'left' veya 'right' değerlerinden birine sahip olabilir.
direction = 'up'; // geçerli
direction = 'diagonal'; // hata: 'diagonal' değeri izin verilen değerler arasında değil

let statusCode: 200 | 404 | 500; // statusCode değişkeni sadece 200, 404 veya 500 değerlerinden birine sahip olabilir.
statusCode = 200; // geçerli
statusCode = 400; // hata: 400 değeri izin verilen değerler arasında değil

 ```