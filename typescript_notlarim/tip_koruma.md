# Type Guards
**Type Guardlar bir conditional blok ile objelerinizin tiplerini daraltmanızı** sağlarlar.

## typeof
**TypeScript bu operatörün "string", "number", "bigint", "boolean", "symbol", "undefined", "object" ya da "function" string değerlerinden birini dönmesini** bekler.

**Bu typeof değerini kontrol etmek bir tür type guard'dır**.

 **Çünkü TypeScript farklı değerlerde typeof'un nasıl çalıştığını** bilir.
 
  Aşağıdaki örnekte typeof'un nasıl null string değerine dönmediğine bir bakalım:
 ```js
function printAll(strs: string | string[] | null) {
  if (typeof strs === "object") {
    for (const s of strs) {
 🚨 Object is possibly 'null'.
      console.log(s);
    }
  } else if (typeof strs === "string") {
    console.log(strs);
  } else {
    // do nothing
  }
}
 ```
**JavaScript'te arrayler birer object olduğu için örnek fonksiyonda strs değerinin bir object olup olmadığını kontrol ediyoruz**.

**Ancak maalesef ki JavaScript dünyasında null değeri de aslında bir object data tipi**.

**Böylece TypeScript bize strs değerinin sadece string[]'e değil string[] | null tiplerine kadar daralttığını** bildiriyor.

## Type Narrowing
**Type Narrowing, bir değişkenin türünü daha dar bir alana indirgeme sürecidir**. 

**Bu, bir değişkenin belirli bir türde olma olasılığını kontrol etmek ve bu koşullar altında kodun daha belirli bir türle çalışmasını** sağlamak için yapılır.

**Örneğin, bir fonksiyon bir dize veya bir sayı** döndürebilir. **Ancak, fonksiyonun sonucunun bir dize olup olmadığını kontrol etmek** isteyebiliriz. 

Bu durumda, bir tür daraltma işlemi gerçekleştirilebilir:
 ```js
function foo(): string | number {
    return Math.random() < 0.5 ? "hello" : 42;
}

const result = foo();

if (typeof result === "string") {
    // result değişkeni artık sadece string türündedir
    console.log(result.toUpperCase()); // Güvenli bir şekilde çalışır
} else {
    console.log(result.toFixed()); // Güvenli bir şekilde çalışır
}

 ```