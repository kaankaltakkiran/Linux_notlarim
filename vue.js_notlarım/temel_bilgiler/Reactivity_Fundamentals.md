# Reactivity Fundamentals(Reaktivite Temelleri)
## Ref
**Ref, bir Vue bileşeninde bir DOM elementine doğrudan erişim sağlamak için** kullanılan bir özelliktir.
Örnek kullanım aşığıdaki gibidr. **REf ile oluşturduğumuz değikenin değerine değişken ismi.value** diyerek ulaşabiliriz.
```js
import { ref } from 'vue'
const count = ref(0)

console.log(count) // { value: 0 }
console.log(count.value) // 0

count.value++
console.log(count.value) // 1
```
## reactive()
reactive(),**genellikle birden fazla özellik içeren nesnelerin(diziler gibi) veya karmaşık veri yapılarının reaktivitesini sağlamak** için kullanılır.

Örnek kullanım aşığıdaki gibidr. **REf ile oluşturduğumuz değikenin değerine değişken ismi.value** diyerek ulaşabiliriz.
```js
import { reactive } from 'vue';

const person = reactive({
  name: 'John',
  age: 30
});

console.log(person.name); // John

person.age++; // Yaşı artırıyoruz

console.log(person.age); // 31
```
> **Note**: **ref ile değikenin değerine değişkenismi.value şeklinde erişilirken reactive ile değişkenismi.attributeadı** ile erişilir.

> Aşığıdaki örnek farkı açıklar:
```js
const count = ref(0)
const state = reactive({
  count
})

console.log(state.count) // 0

state.count = 1
console.log(count.value) // 1
```
## <script setup>
**bileşen içindeki değişkenleri ve fonksiyonları otomatik olarak içe aktarır ve dışa aktarır**.

Örnek kullanım:
```js
<script setup>
import { ref } from 'vue'

const count = ref(0)

function increment() {
  count.value++
}
</script>

<template>
  <button @click="increment">
    {{ count }}
  </button>
</template>
```
