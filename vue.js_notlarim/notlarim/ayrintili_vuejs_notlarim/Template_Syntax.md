# Template Syntax(Yazım Şekli) 
**Vue, işlenen DOM'u temel bileşen örneğinin verilerine bildirimsel olarak bağlamanıza olanak tanıyan HTML tabanlı** bir şablon sözdizimi kullanır. Tüm Vue şablonları, teknik özelliklerle uyumlu tarayıcılar ve HTML ayrıştırıcıları tarafından ayrıştırılabilen sözdizimsel olarak geçerli HTML'dir.


**Vue, şablonları yüksek düzeyde optimize edilmiş JavaScript** koduna derler. Reaktivite sistemi ile birlikte Vue, uygulama durumu değiştiğinde yeniden işlenecek minimum sayıda bileşeni akıllı bir şekilde belirleyebilir ve minimum miktarda DOM manipülasyonu uygulayabilir.

## Text Interpolation(Metin Yazımı)
Aşşağıda **verilen örnekteki msg değeri değeri değiştiğinde** güncellenecektir.
```js
<span>Message: {{ msg }}</span>
```
## Raw Html(v-html İle Html Çıktısı Alma)
Aşşağıda verilen örnekte **v-html Directiviyle span etkinetine html öğe** ekrana yazdırılır
```js
<p>Using text interpolation: {{ rawHtml }}</p>
<p>Using v-html directive: <span v-html="rawHtml"></span></p>
```

## Attribute Bindings (V-bind İle Nitelik Bağlama)
Aşşağıda verilen örnekte **v-bind ile div elementinin id özelliğine değer bağlıyoruz**.
```js
<div v-bind:id="dynamicId"></div>
```
> **Note**: **Aşığıdaki örnekteki gibi kısa yazım şekli** de mevcuttur. Her iki yazım şeklide geçerlidir.
 ```js
<div :id="dynamicId"></div>
```
Başka bir örnek:
 ```js
<!-- same as :id="id" -->
<div :id></div>

<!-- this also works -->
<div v-bind:id></div>
```
Javascript ile data binding örneği:
 ```js
{{ number + 1 }}

{{ ok ? 'YES' : 'NO' }}

{{ message.split('').reverse().join('') }}

<div :id="`list-${id}`"></div>
```
## Directives(Bağlamlar)
Aşşağıda verilen örnekte **v-if ile eğer seen değeri true ise p elementi gözükecektir.**.
```js
<p v-if="seen">Now you see me</p>
```
v-bind örnek:
```js
<a v-bind:href="url"> ... </a>

<!-- shorthand -->
<a :href="url"> ... </a>
```
Aşşağıda verilen örnekte **v-on ile event bağlama işlemi yapılır.** Örneğin butona tıklama özelliği verilir. 2 farklı yazım şekli vardır.
```js
<a v-on:click="doSomething"> ... </a>

<!-- shorthand -->
<a @click="doSomething"> ... </a>
```
Genel Kullanım şekli aşığıdaki gibidir. Event olarak örneğin focus,click vb gibi...
```js
<a v-on:[eventName]="doSomething"> ... </a>

<!-- shorthand -->
<a @[eventName]="doSomething"> ... </a>
```
## Modifiers(Düzenleyiciler) 

**Düzenleyiciler, bir yönergenin özel bir şekilde bağlanması gerektiğini belirtir**.

Örneğin, @submit.prevent v-on yönergesine tetiklenen olayda event.preventDefault() işlevini çağırmasını söyler:
```js
<form @submit.prevent="onSubmit">...</form>
```
Yukardaki kod aslında şuna karşılık gelmektedir:
```js
<form v-on:submit.prevent="onSubmit">...</form>
```
v-on:Name

submit:Argument

prevent:Modifiers

onSubmit:Value

