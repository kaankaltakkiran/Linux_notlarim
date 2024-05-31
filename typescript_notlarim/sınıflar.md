# Sınıf Tabanlı Objeler (Class Based Object)

## Sınıflar (Classes)
  ```js
class User {
name: string;
age: number;

constructor(a: string, b: number){
this.name = a;
this.age = b;
}
get(){
return `Isminiz: ${this. name} ve Ya1n1Z: ${this.age}`;
}
}

const user = new User("Can", 25);

user.name = "Ege";
user.age = 14;
 ```

 Yukarıdaki örnektede gördüğümüz üzere, sınıf içerisinde yapılan değişken tipi tanımlamaları ve method içerisine gönderilen parametrelerin tip tanımlamaları, değişkenler ve fonksiyonlardaki ile aynıdır.
 ## Soyut Sınıflar (Abstract Classes)
**Kendi instance objesinden türeyemeyen** sınıflardır.

**Kendisini kullanan başka sınıfların instance’ları aracılığıyla içerisindeki özelliklere erişilmesini** sağlayan sınıflardır.

  ```js
abstract class User {
name: string;
age: number;

constructor(a: string, b: number){
this.name = a;
this.age = b;
}
get(){
return `Isminiz: ${this. name} ve Ya1n1Z: ${this.age}`;
}
}

const user = new User("Can", 25); // Error: Cannot create an instance of an abstract class.
 ```

  ```js
  class Persone extends User {
constructor(a,b){
super(a,b);
}
sayHello(){
return `Merhaba ${this.name}`
}
}

const person = new Person("Can", 25);

console.log(person.get());
console.log(person.sayHello());
 ```
 **Yukarıdaki örnekte, Person sınıfı instance’ından türetilen obje ile hem Person sınıfı içindeki parametrelere hem de User sınıfı içindeki parametrelere** erişilebilir.

  > **Note**:  **Bir Class baska bir Class‘i extend** edebilir.

 >**Bir Class baska bir Abstract Class‘i extend** edebilir. Ederse **Abstract Class’in tüm abstract metod deklarasyonlarini implemente** etmek zorundadir.

 >**Bir Class bir Interface‘i implements edebilir. Ederse interface’in icindeki tüm metod deklarasyonlarini implemente etmek** mecburiyetindedir.

 >**Bir Class bir Abstract Class‘i implement** edemez.

## Interface
**Dışarıdan erişilebilir durumda olan elemanları, objelere veya sınıflara bildiren** yapılardır.

**Birbirlerinden extend** olabilirler.

**Birbirlerinden implement** olamazlar.

 **Objelere ve sınıflara** atanabilirler.

  ```js
interface IsPerson {
name: string;
age?: number;
speak(a: string): void;
}

class User implements IsPeRSON {
name: string = "Can";
age: number = 22;

speak(): string{
return `Isminiz: ${this. name} ve Ya1n1Z: ${this.age}`;
}
}

const user = new User();

console.log(user)
 ```
 > **Note**:  **public: Sınıf içerisinde kullanılan özellikleri dışarıdan erişilebilir ve değiştirilebilir** hale getirir.

 >private: **Sınıf içerisinde kullanılan özelliklerin dışarıdan erişilebilme ve değiştirilebilme durumunu devre dışı** bırakır.

 >readonly: **Sınıf veya Interface içerisinde kullanılan özelliklerin dışarıdan değiştirilebilme durumunu devre dışı** bırakır..

 >protected:**Protected aslında private e benzer. Protected özelliği atanan bir değişken veya metot, sadece sınıf içerisinden veya türetilen bir sınıf içerisinden** erişilebilir.

 > Bir **sınıf extend ettiği sınıfın protected üyelerine erişebilir ama private üyelerine** erişemez.

 ## Static
 JavaScript **superset’**dir.
  ```js
class Circle {
    static pi = 3.14;
    pi = 3;
}

Circle.pi; // Statik alana böyle erişilir.


let circleObj = new Circle();
circleObj.pi; // Statik olmaya alana böyle erişilir.
class Circle {
    static pi = 3.14;

    static calculateArea(radius:number) {
        return this.pi * radius * radius;
    }

    calculateCircumference(radius:number):number { 
        return 2 * Circle.pi * radius;
    }
}

Circle.calculateArea(5); // returns 78.5
  
let circleObj = new Circle();
circleObj.calculateCircumference(5) // returns 31.4000000
//circleObj.calculateArea(); <-- Bu şekilde çağırılamaz.
 ```
  > **Note**:   **TypeScript’te class veya constructor static** olamaz.