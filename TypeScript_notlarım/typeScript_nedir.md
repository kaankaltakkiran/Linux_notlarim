# TypeScript Notlarım

## TypeScript Nedir?
**Temelde TypeScript, JavaScript kodunun okunabilirliğini ve sürdürülebilirliğini artırmak** için statik tipleme özellikleri ekleyerek JavaScript'in eksiklerini giderir.

**TypeScript, JavaScript kodunu yazarken hataları erken aşamada tespit ederek geliştirme sürecini hızlandırır**. Ayrıca, **büyük projelerde çalışırken, değişkenlerin ve fonksiyonların türlerini belirterek kodun anlaşılırlığını artırır ve ekiplerin birlikte çalışmasını** kolaylaştırır.

**Microsoft tarafından geliştirilen ve desteklenen, ücretsiz ve open source bir proje olan TypeScript bünyesinde barındırdığı derleyici sayesinde, yazılan kodu JavaScriptkoduna çevirir.** TypeScript gerek client (istemci) taraflı, gerekse server (sunucu) taraflı yazılım geliştirmede kullanılabilmektedir.

> **Note**: **Dinamik tipte yazılan diller çalışma zamanında(run-time)** tür denetimi gerçekleştirir.

> **Statik tipte yazılan diller derleme zamanında(compile-time)** tür denetimi gerçekleştirir.


## Neden TypeScript ?
 **TypeScript in temel amacı static type checking yaparak geliştirme aşamasında tip kontrolünü**sağlamaktır.

 **Static Type sistemler, programlarımızı çalıştırdığımızda değerlerimizin ne olacağını ve davranışlarını** tanımlar. TypeScript bu **bilgiyi kullanır ve bize ne zaman hata alacağımızı** söyler.

 ```js
const message = "hello!";

message();

/* This expression is not callable.
Type 'String' has no call signatures. */
```
**Yukarıda ki kod bloğunu çalıştırdığımızda hata mesajı karşımıza** çıkacaktır. TypeScript ise kodu çalıştırmadan önce bize bir **hata mesajı** verecektir.

**TypeScript aynı zamanda çalışma öncesi hataları yakalamamızı** da sağlar. 

Örneğin aşağıdaki **kod bloğunu çalıştırdığımızda console a undefined** değerini yazar.
 ```js
 const user = {
  name: "Daniel",
  age: 26,
};

console.log(user.location);
```
**TypeScript kullandığımız takdirde kullandığımız editörümüz de karşımıza aşağıdaki hata mesajı** çıkacaktır.

> **Note**: **Property 'location' does not exist on type '{ name: string; age: number; }**'.

## Bilinemesi Gerekenler

### JavaScript (JS)

**JavaScript, web tarayıcılarında ve çoğu modern web tarayıcısı tarafından desteklenen bir programlama dilidir.**

**İlk olarak Netscape Communications Corporation tarafından** geliştirilmiştir. 

**JavaScript, web sayfalarını etkileşimli hale getirmek, kullanıcıyla etkileşim sağlamak, web uygulamalarını geliştirmek ve dinamik içerik oluşturmak için kullanılır.**

**JavaScript, ECMAScript standartlarına uygun olarak geliştirilir ve sürekli** olarak güncellenir.

### ECMAScript (ES)

**ECMAScript, JavaScript dilinin standartlarının belirlendiği bir spesifikasyon** serisidir. 

**JavaScript'in resmi olarak bir dil olarak tanımlanması ve geliştirilmesi bu standartlar üzerine dayanır.**

 Yani, JavaScript aslında **ECMAScript'in bir uygulamasıdır**. 
 
 **ECMAScript, dilin yapısını, özelliklerini ve davranışlarını** tanımlayan bir dizi standart belirler. Örneğin, ES5, ES6 (ya da ECMAScript 2015), ES7 gibi sürümler bu standartlar arasında yer alır.

 ### TypeScript (TS)
 
 **TypeScript, JavaScript'in genişletilmiş bir versiyonudur.**
 
 **Microsoft tarafından geliştirilmiştir. TypeScript, JavaScript kodunu daha güvenli, okunabilir ve bakımı kolay hale getirmek için tasarlanmıştır.** 
 
 Bununla birlikte, **TypeScript, JavaScript koduna tip belirtme, statik tip denetimi ve diğer gelişmiş özellikler ekleyerek kodun daha sağlam** hale gelmesini sağlar. 
 
 **TypeScript, JavaScript'e transpile edilebilir, yani TypeScript kodu, tarayıcılar veya Node.js gibi JavaScript çalışma zamanlarında çalışabilen JavaScript** koduna dönüştürülebilir.
