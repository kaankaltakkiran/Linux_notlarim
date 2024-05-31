# İlkel Veri Tipleri
TypeScript'te kullanılan ilkel veri tipleri, programlamada temel veri depolama ve işlemleri yapmak için kullanılan basit veri türleridir.

İlkel veri tipleri şunlardır:
## Number
  ```js
let age: number = 25;
let pi: number = 3.14;
 ```
 ## String
  ```js
let name: string = "John"; //çift tırnak
let message: string = 'Hello, world!'; //tek tırnak
 ```
  ## Boolean
  ```js
let isLogged: boolean = true;
let isOpen: boolean = false;
 ```
 ## Null Ve Undefined
  ```js
let emptyValue: null = null; // bilinçli olarak hiçbir değere sahip değildir
let notDefined: undefined = undefined; //değişken henüz  tanımlanmamıştır
 ```
  ## Void

  ```js
function logMessage(): void { //değer döndürmez
    console.log("This is a log message");
}
//değer döndüren fonksiyon
   let logDetails = (user: { name: string; age: number }): string => { 
   return `Isminiz: ${user. name} ve Ya1n1Z: ${user.age}`;
};
//zorunlu parametresi olmayan fonksiyon
 let logDetails = (user: { name: string; age: number }, action?): string => {
if(action === "add"){
return "Kullanıcı Eklendi."
}
   return `Isminiz: ${user. name} ve Ya1n1Z: ${user.age}`;
};
 ```
 ## Never
  ```js
  //Bir şeyin asla olmayacağından emin olduğunuzda kullanılır
function throwError(errorMsg: string): never { 
            throw new Error(errorMsg); 
} 

function keepProcessing(): never { 
            while (true) { 
         console.log('I always does something and never ends.')
     }
}
 ```
 ## symbol
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
 # İlkel Olamyan Veri Tipleri
   ## Nesneler (Objects):
  ```js
// Bir öğrenci nesnesi örneği
let student = {
    name: "John",
    age: 25,
    grade: "A"
};
 ```
  ## Diziler (Arrays)
  ```js
// Bir dizi örneği
let numbers: number[] = [1, 2, 3, 4, 5];
 ```
   ## Tuple
  ```js
  //Tuple belirli bir sayıda elementin ve her bir elementin farklı tiplere sahip olabileceği arraydir.
let myTuple: [string, number] = ['hello', 123];
 ```
## Enum
  ```js
  //birden fazla metin, sayı veri tipini tek bir koleksiyon içinde tutar
enum PrintMedia {
  Newspaper = 1,
  Newsletter,
  Magazine,
  Book
}
 ```
 ## Union
Örneğin:
  ```js
  //Union tipi bir değişkenin belirtilen herhangi bir tipte
function printId(id: number | string) {
  console.log("Your ID is: " + id);
}
// OK ✅
printId(101);
// OK ✅
printId("202");
 ```
 ## Fonksiyonlar (Functions)
  ```js
// Bir fonksiyon örneği
function greet(name: string): void {
    console.log("Hello, " + name + "!");
}

greet("John"); // Çıktı: Hello, John!
 ```

 ## Any
  ```js
  //belirli bir tipe sahip olmadığı zaman veya türü dinamik olarak belirlenmesinde kullanılır
let dynamicValue: any = 10;
dynamicValue = "Hello";
 ```
   ## Type
  ```js
  //bir tür tanımlamak için kullanılır
type Point = {
    x: number;
    y: number;
};

 ```
   ## Interface
  ```js
  //bir tür ve onun ilişkilendirilmiş özelliklerini tanımlamak için kullanılır
interface Point {
    x: number;
    y: number;
}
// veya
interface User {
    id: number;
    username: string;
    email: string;
}
 ```
  ```js
  //type'ı oluşturulduktan sonra değiştirelebilir
interface Window {
  title: string
}

interface Window {
  ts: TypeScriptAPI
}

const src = 'const a = "Hello World"';
window.ts.transpileModule(src, {});
 ```
  ```js
  //type'ı oluşturulduktan sonra değiştiremiyoruz
type Window = {
  title: string
}

type Window = {
  ts: TypeScriptAPI
}

 // Error: Duplicate identifier 'Window'. 🚨
 ```
 # Literal types(Sabit Türler)
## Literal types
 ```js
let x: "hello" = "hello";

✅ // OK
x = "hello";

x = "howdy";
🚨 Type '"howdy"' is not assignable to type '"hello"'.
 ```
  ```js
let direction: 'up' | 'down' | 'left' | 'right'; // direction değişkeni sadece 'up', 'down', 'left' veya 'right' değerlerinden birine sahip olabilir.
direction = 'up'; // geçerli
direction = 'diagonal'; // hata: 'diagonal' değeri izin verilen değerler arasında değil

let statusCode: 200 | 404 | 500; // statusCode değişkeni sadece 200, 404 veya 500 değerlerinden birine sahip olabilir.
statusCode = 200; // geçerli
statusCode = 400; // hata: 400 değeri izin verilen değerler arasında değil
 ```