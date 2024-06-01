# Vue Router 

[Vue Router Detaylı Kaynak ](https://v3.router.vuejs.org/guide/)

## Vue 3 Yönlendirme (Routing) Nedir?

Vue.js’in yönlendirme özelliği, web uygulamasının farklı sayfalarına geçiş yapmayı sağlar. Yani kullanıcının URL’sindeki path’i değiştirerek farklı sayfalara geçiş yapabilirsiniz. Örneğin, kullanıcının “/home” yolundan “/about” yoluna geçiş yapmasını sağlayabilirsiniz.

## Vue Router nasıl çalışır ?

Vue 3 yönlendirme özelliği, “vue-router” adlı bir kütüphane kullanılarak sağlanır. Bu kütüphane, Vue.js uygulamasında kullanılacak olan bileşenlerin hangi URL’lerle eşleşeceğini tanımlar. Bu eşleşmeleri oluşturmak için, vue-router’ın “routes” özelliğini kullanabilirsiniz.

Vue 3 yönlendirme özelliği, ayrıca bir URL’deki parametreleri yakalamak ve bir bileşen içinde kullanmak için dinamik URL’ler de kullanabilirsiniz. Bu, bir URL’deki değeri okuyup, bileşenlerin bu değeri kullanarak farklı sonuçlar üretmesine olanak tanır.

## Kurulum

Vue Router’ı kullanmak için önce yüklememiz gerekiyor. Bunun için npm veya yarn kullanabiliriz. Örneğin, npm kullanarak kurulum şöyle yapılabilir:
```
npm install vue-router
```
## Kullanım

Vue Router kullanarak yönlendirme yapmak için önce  `VueRouter`  sınıfından bir örnek oluşturmamız gerekir. Bu örneği oluştururken yönlendirme yapacağımız bileşenleri belirlememiz gerekiyor.

Örnek uygulama router.js dosyası:
```js
//Componentler import edildi
import Home from './components/Home.vue'

import About from './components/About.vue'

import { createRouter, createWebHistory } from 'vue-router' //Vue Router import edildi

// routes adında yönledirme için dizi oluşturuldu
const routes = [

{ path: '/', component: Home },

{ path: '/about', component: About },

]
// createRouter ile router nesnesi oluşturduk
const router = createRouter({
//history seçeneği, Vue Router'ın tarayıcı geçmişi kullanarak URL'leri işlemesini belirtir. 
history: createWebHistory(),

routes,

})
```
main.js dosyası:
```js
import { createApp } from 'vue'

import App from './App.vue'

import router from './router' //router import

const app = createApp(App)

app.use(router) //tüm uygulamada router kullanmak için

app.mount('#app')
```
> Note: main.js te dosyasına oluşturduğumuz routes dosyasını import ediyoruz ve tüm uygulumada kullanabilirliğini sağlıyoruz.
app.vue dosyası:
```js
<template>

<router-view></router-view>

</template>
```
> Note: router-view router içindeki componentleri gösterir.
Örnek yönledirme:
```js
<router-link to="/users">List Users</router-link>
```
> Note: rotuer-link ile hangi sayfaya gidileciğini belirtiyoruz. to ile hangi path ile o sayfaya erişilebilceğini ayarlıyoruz.