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
   ## void
**Fonksiyonların bir değer döndürmediği durumları** ifade eder.

**Yani, bir fonksiyonun geri dönüş değeri yoksa, bu tip kullanılır**. 

Örneğin:
  ```js
function logMessage(): void {
    console.log("This is a log message");
}
 ```
 **Geriye Değer Döndürebilen** Fonksiyonlar:
   ```js
   let logDetails = (user: { name: string; age: number }): string => {
   return `Isminiz: ${user. name} ve Ya1n1Z: ${user.age}`;
};
  ```
   **Parametresi Zorunlu (Required) Olmayan** Fonksiyonlar:
   ```js
 let logDetails = (user: { name: string; age: number }, action?): string => {
if(action === "add"){
return "Kullanıcı Eklendi."
}
   return `Isminiz: ${user. name} ve Ya1n1Z: ${user.age}`;
};
  ```
 ## Never
 **Bir şeyin asla olmayacağından emin olduğunuzda kullanılır.** 

 **Örneğin, bitiş noktasına geri dönmeyen veya her zaman bir istisna atan bir işlev yazarsınızJavaScript’e empty** olarak adalandırılır. 

Örneğin:
  ```js
function throwError(errorMsg: string): never { 
            throw new Error(errorMsg); 
} 

function keepProcessing(): never { 
            while (true) { 
         console.log('I always does something and never ends.')
     }
}
 ```
  **Yukarıdaki örnekte, throwError()işlev bir hata atar ve keepProcessing()işlev her zaman yürütülür ve while döngüsü hiçbir zaman sona ermediğinden hiçbir zaman bir bitiş noktasına ulaşmaz.**
  
   **Bu nedenle, asla gerçekleşmeyecek veya bir işlevden geri dönmeyecek değeri belirtmek için asla türü** kullanılır.

  > **Note**: **Void türü, as’ın hiçbir değere sahip olamayacağı bir değer olarak undefined veya null değerine** sahip olabilir.
  ```js
let something: void = null;
let nothing: never = null; // Error: Type 'null' is not assignable to type 'never'
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