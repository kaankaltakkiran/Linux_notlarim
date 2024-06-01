## Creating a Vue Application(Uygulama Oluşturma) 
Vue.jste **createApp ile uygulama** oluşturulur.

Örnek:
```js
import { createApp } from 'vue'
// import the root component App from a single-file component.
import App from './App.vue'

const app = createApp(App)
```

## Mounting the App(Uygulama Kullanabilirlik)
Uygulama oluşturma **mount evrsinde gerçkeleşir.**
mount: **vue bileşeninin oluşturulduğu, Vue özelliklerinin etkinleştirildiği ve Vue bileşeninin kullanılabilir hale geldiği** noktadır.
```html
<div id="app"></div>
```
```js
app.mount('#app')
```

## App Configurations (Uygualama Yapılandırma )
`.config`,**tüm alt bileşenlerden gelen hataları yakalayan uygulama düzeyinde bir hata işleyicisi** tanımlar.

Örnek kullanım:
```js
app.config.errorHandler = (err) => {
  /* handle error */
}
```
## Multiple application instances (Çoklu uygulama Oluşturma)
Aynı sayfada tek bir uygulama örneği ile sınırlı değiliz. createApp her biri yapılandırma ve global varlıklar için kendi kapsamına sahip birden fazla Vue uygulamasının aynı sayfada birlikte var olmasına olanak tanır.

Örnek kullanım:
```js
const app1 = createApp({
  /* ... */
})
app1.mount('#container-1')

const app2 = createApp({
  /* ... */
})
app2.mount('#container-2')
```
> **Note**: büyük bir sayfanın yalnızca belirli bölümlerini kontrol etmek için Vue'ya ihtiyacınız varsa, tüm sayfaya tek bir Vue uygulama örneği yüklemekten kaçının. Bunun yerine, birden fazla küçük uygulama örneği oluşturun. 
