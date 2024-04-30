# Modules,Namespaces,Generics

## Modules
**Bir dosyada yazılan değişkenleri, fonksiyonları vb. başka bir dosyada** kullanabiliriz.

— dosya1.ts

  ```js
export var greeting : string = "Hello World!";
 ```

— dosya2.ts

  ```js
console.log(greeting); //Error: cannot find 'greeting'

greeting = "Hello TypeScript"; 
 ```

 **import anahtar kelimesini kullanarak “greeting” içe aktarmamız gerekiyor. Ancak böyle erişme imkanımız** olacaktır.

**Bir modülün derlenmesi, hedeflediğiniz hedef ortama bağlıdır. TypeScript derleyicisi, derleme sırasında belirtilen modül hedef seçeneğine dayalı olarak JavaScript kodunu** oluşturur.

 **Bir TypeScript modülünü derlemek ve JavaScript kodunu oluşturmak için aşağıdaki** komutu kullanın.
 ```js
 --module <target> <file path>
  ```
  **IDE kullanıyorsanız, Modül derleme hedefini IDE’de veya tsconfig.json dosyasında** ayarlamanız gerekir.

  ## Namespaces
**Fonksiyonların mantıksal olarak gruplanması** için kullanılır.

**Tek bir veya birden çok Fonksiyon grubunu desteklemek için class,interfaces, function and variable içerebilir**.
  ```js
namespace StringUtility 
{
    function ToCapital(str: string): string {
        return str.toUpperCase();
    }

    function SubString(str: string, from: number, length: number = 0): string {
        return str.substr(from, length);
    }
}
 ```

   > **Note**: **Varsayılan olarak, ad alanı bileşenleri diğer modüllerde veya ad alanlarında kullanılamaz**.

   > **Aşağıda gösterildiği gibi, dışa aktarma anahtar sözcüğünü kullanarak, her bileşeni dışarıdan erişilebilir kılmak için dışa aktarmanız** gerekir.

 ## Generics
**Yeniden kullanılabilir components(bileşenler) oluşturmanın** bir yolunu sunar.


**components(bileşenler)herhangi bir veri türüyle çalışmasını sağlamak ve tek bir veri türüyle kısıtlamamak için bir yol sağlar**. 

**Böylece components(bileşenler), çeşitli veri türleri ile çağrılabilir** veya kullanılabilir
  ```js
namespace StringUtility 
{
    function ToCapital(str: string): string {
        return str.toUpperCase();
    }

    function SubString(str: string, from: number, length: number = 0): string {
        return str.substr(from, length);
    }
}
 ```