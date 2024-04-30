# İlkel Veri Tipleri
**TypeScript'te kullanılan ilkel veri tipleri, programlamada temel veri depolama ve işlemleri yapmak için kullanılan basit veri türleridir.** 

İlkel veri tipleri şunlardır:
## number
 Bu veri tipi **sayıları temsil eder. Hem tam sayılar (integer) hem de ondalık sayılar (float) bu kategoriye** girer. 
 
 Örneğin:
  ```js
let age: number = 25;
let pi: number = 3.14;
 ```
 ## number
**Metin veya karakter dizilerini temsil eder. Tek tırnak ('), çift tırnak ("), veya backtick (`) içinde tanımlanabilirler**. 

Örneğin:
  ```js
let name: string = "John";
let message: string = 'Hello, world!';
 ```
  ## boolean
**Sadece iki değere sahip olan veri tipidir: true veya false**. 

**Koşullu ifadelerde** sıkça kullanılır. Örneğin: 

Örneğin:
  ```js
let isLogged: boolean = true;
let isOpen: boolean = false;
 ```

  ## null ve undefined
**null ve undefined JavaScript'te özel** değerlerdir.

**null, bir değişkenin bilinçli olarak hiçbir değere sahip olmadığını ifade ederken**,

**undefined, bir değişkenin henüz atanmamış veya tanımlanmamış olduğunu belirtir**. 

Örneğin:
  ```js
let emptyValue: null = null;
let notDefined: undefined = undefined;
 ```
  ## any
**Bu veri tipi, belirli bir tipe sahip olmadığı zaman veya türü dinamik olarak** belirlenmesi gerektiğinde kullanılır. 

Ancak, mümkünse, bu türden kaçınılması önerilir, **çünkü belirli bir tür güvencesi sağlamaz**. 

Örneğin:
  ```js
let dynamicValue: any = 10;
dynamicValue = "Hello";
 ```

   ## any
**Fonksiyonların bir değer döndürmediği durumları** ifade eder.

**Yani, bir fonksiyonun geri dönüş değeri yoksa, bu tip kullanılır**. 

Örneğin:
  ```js
function logMessage(): void {
    console.log("This is a log message");
}
 ```

 ## symbol
**Symbol, JavaScript dilinde benzersiz değerler** oluşturmak için kullanılır ve genellikle nesnelerin özel özelliklerini tanımlamak için kullanılır.

**Her bir symbol değeri eşsizdir ve diğer hiçbir symbol değeri ile eşleşmez**. 

**Yani, iki farklı symbol değeri birbirine eşit değildir**. 

Bu, symbol değerlerinin diğer veri tiplerinden farklı olduğu anlamına gelir.

Örneğin:
  ```js
// Benzersiz bir symbol oluşturma
const symbol1 = Symbol();
const symbol2 = Symbol('description');

// Nesne oluşturma
const obj = {};

// Nesneye symbol tabanlı özellikler ekleme
obj[symbol1] = 'value1';
obj[symbol2] = 'value2';

// Nesnenin symbol tabanlı özelliklerine erişim
console.log(obj[symbol1]); // "value1"
console.log(obj[symbol2]); // "value2"

 ```