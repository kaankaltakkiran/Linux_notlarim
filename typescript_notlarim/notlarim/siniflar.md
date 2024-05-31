# Sınıf Tabanlı Objeler (Class Based Object)

## Sınıflar (Classes)
  ```js
  //Sınıf tanımlama
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

 ## Soyut Sınıflar (Abstract Classes)
  ```js
//Kendi instance objesinden türeyemeyen** sınıflardır.
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

 ## Static
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