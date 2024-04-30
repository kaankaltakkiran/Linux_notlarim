# İlkel Olamyan Veri Tipleri

**TypeScript'te en çok kullanılan non-primitive veri tipleri genellikle nesneler (objects) ve diziler (arrays)dir**. 

**Bunlar, genellikle karmaşık veri yapılarını temsil etmek ve verileri organize etmek** için kullanılırlar.

İlkel olmayan veri tipleri şunlardır:

  ## Nesneler (Objects):
**Nesneler, özellik-değer çiftlerini içeren karmaşık veri** yapılarıdır.

**Bir özellik bir anahtarla (property key) ilişkilendirilmiş bir değerdir**.

 **TypeScript'te, nesneleri tanımlamak için JSON benzeri sözdizimi** kullanılır.

Örneğin:
  ```js
// Bir öğrenci nesnesi örneği
let student = {
    name: "John",
    age: 25,
    grade: "A"
};
 ```
  ## Diziler (Arrays)
 **Diziler, aynı türdeki birden çok değeri içeren** koleksiyonlardır. 
 
 **TypeScript'te, diziler köşeli parantezler** içinde tanımlanır.

Örneğin:
  ```js
// Bir dizi örneği
let numbers: number[] = [1, 2, 3, 4, 5];
 ```
   ## Tuple
 **Tuple belirli bir sayıda elementin ve her bir elementin farklı tiplere sahip olabileceği bir array çeşididir**. 
 
 Tıpkı arrayler gibi ifade edilebilirler.

Örneğin:
  ```js
let myTuple: [string, number] = ['hello', 123];
 ```
## Enum
**En basit haliyle birden fazla metin, sayı veri tipini tek bir koleksiyon içerisinde** tanımlaya olanak sağlar.

Örneğin:
  ```js
enum PrintMedia {
  Newspaper = 1,
  Newsletter,
  Magazine,
  Book
}
 ```
 ## Union
**Union tipi bir değişkenin belirtilen herhangi bir tipte** olabileceğini ifade eder.

 Bu tip **| sembolü** ile tanımlanır.

Örneğin:
  ```js
function printId(id: number | string) {
  console.log("Your ID is: " + id);
}
// OK ✅
printId(101);
// OK ✅
printId("202");
 ```
  ## Fonksiyonlar (Functions)
**TypeScript'te fonksiyonlar da birer non-primitive veri tipleridir.** 

**Fonksiyonlar, belirli bir işlevi gerçekleştiren kod bloklarıdır**.
Örneğin:
  ```js
// Bir fonksiyon örneği
function greet(name: string): void {
    console.log("Hello, " + name + "!");
}

greet("John"); // Çıktı: Hello, John!
 ```

  ## any
**Bu veri tipi, belirli bir tipe sahip olmadığı zaman veya türü dinamik olarak** belirlenmesi gerektiğinde kullanılır. 

Ancak, mümkünse, bu türden kaçınılması önerilir, **çünkü belirli bir tür güvencesi sağlamaz**. 

Örneğin:
  ```js
let dynamicValue: any = 10;
dynamicValue = "Hello";
 ```
   ## type
**Bir tür tanımlamak için** kullanılır. 

**type ile oluşturulan yapılar, mevcut tiplerin birleşiminden veya dönüşümünden** oluşabilir. Bu, özellikle bir türün belirli bir şekilde kullanılması gerektiğinde veya birden fazla yerde tekrar kullanılacağında yararlıdır.

 Örneğin:
  ```js
type Point = {
    x: number;
    y: number;
};

// veya

type ID = number | string;
 ```
   ## Interface
 **Bir tür ve onun ilişkilendirilmiş özelliklerini tanımlamak için kullanılır**. 
 
 **interface, bir nesnenin nasıl görünmesi gerektiğini** belirtir.
 
 **Bu, özellikle bir sınıfın veya nesnenin davranışını belirlerken ve koda daha belgelendirici bir yaklaşım sunarken yararlıdır**. 
 
 Örneğin:
  ```js
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
 > **Note**: **Type isimlendirmesi ve Interface birbirlerine oldukça benzerler**. Çoğu durumda birini diğeri yerinde kullanabilirsiniz, Interface'in sunduğu tüm özellikler type için de geçerlidir.

 > **Aralarındaki en büyük fark type'ın yeni propertyler için yeniden açılamayacağı** ancak **interface'in her zaman genişletilebilir** olmasıdır.

  Örneğin, **var olan Interface'e yeni alanlar** ekleyebiliyoruz:
  ```js
interface Window {
  title: string
}

interface Window {
  ts: TypeScriptAPI
}

const src = 'const a = "Hello World"';
window.ts.transpileModule(src, {});
 ```

   Ama, **Type'ı oluşturulduktan sonra değiştiremiyoruz**:
  ```js
type Window = {
  title: string
}

type Window = {
  ts: TypeScriptAPI
}

 // Error: Duplicate identifier 'Window'. 🚨

 ```