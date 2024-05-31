# İlkel Veri Tipleri
TypeScript'te kullanılan ilkel veri tipleri, programlamada temel veri depolama ve işlemleri yapmak için kullanılan basit veri türleridir.

İlkel veri tipleri şunlardır:
## number
  ```js
let age: number = 25;
let pi: number = 3.14;
 ```
 ## string
  ```js
let name: string = "John"; //çift tırnak
let message: string = 'Hello, world!'; //tek tırnak
 ```
  ## boolean
  ```js
let isLogged: boolean = true;
let isOpen: boolean = false;
 ```
 ## null ve undefined
  ```js
let emptyValue: null = null; // bilinçli olarak hiçbir değere sahip değildir
let notDefined: undefined = undefined; //değişken henüz  tanımlanmamıştır
 ```
  ## void

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