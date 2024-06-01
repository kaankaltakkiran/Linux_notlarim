# Components Basics

## Components
​Vue.js'te bileşenler (components), kullanıcı arayüzünü modüler parçalara ayırmak için kullanılan yapısal bir özelliktir. 

Vue.js uygulamalarında bileşenler, kendi içerikleri, davranışları ve stil özellikleriyle birlikte yeniden kullanılabilir ve bağımsızdır.

Bu, kodun daha organize edilmesini ve bakımını kolaylaştırır ve karmaşık arayüzleri daha yönetilebilirhale getirir.

Örneğin ButtonCounter adında şu kodu içeren componentimiz olsun:
```js
<script setup>
import { ref } from 'vue'

const count = ref(0)
</script>

<template>
  <button @click="count++">You clicked me {{ count }} times.</button>
</template>
```
Oluşturduğumuz bu compenenti aşığıdaki gibi kullanabiliriz:
```js
<script setup>
import ButtonCounter from './ButtonCounter.vue'
</script>

<template>
  <h1>Here is a child component!</h1>
  <ButtonCounter />
</template>
```
> Note: Aşığıdaki örnek gibi oluşturduğumuz compenenti birden fazla kez kullanabiliriz.
```js
<h1>Here are many child components!</h1>
<ButtonCounter />
<ButtonCounter />
<ButtonCounter />
```
## Passing Props 
Vue.js'te bir bileşenden başka bir bileşene veri aktarmanın bir yoludur. Bu, ebeveyn bileşenin çocuk bileşene veri göndermesini sağlar ve bu veri çocuk bileşen içinde kullanılabilir.

örneğin BlogPost.vue adında bir component oluşturduk
```js
<!-- BlogPost.vue -->
<script setup>
defineProps(['title'])
</script>

<template>
  <h4>{{ title }}</h4>
</template>
```
Daha sonra parent componentten chil componente title değerini oluşturduk Bu şekilde ana componentten child componete veri aktardık
```js
<BlogPost title="My journey with Vue" />
<BlogPost title="Blogging with Vue" />
<BlogPost title="Why Vue is so fun" />
const posts = ref([
  { id: 1, title: 'My journey with Vue' },
  { id: 2, title: 'Blogging with Vue' },
  { id: 3, title: 'Why Vue is so fun' }
])
<BlogPost
  v-for="post in posts"
  :key="post.id"
  :title="post.title"
 />
```