# Template Refs (Referanslar)
**DOM öğelerine doğrudan erişmemiz gereken durumlar** olabilir. Bunu başarmak için **özel ref niteliğini** kullanabiliriz.

örnek kullanım
```js
<input ref="input">
```
Aşığıdaki örnekte **Ref'e yalnızca bileşen monte edildikten sonra erişebileceğinizi** unutmayın. 

Bir şablon ifadesindeki girdiye erişmeye çalışırsanız, **ilk render işleminde null olacaktır**. 

Bunun nedeni, öğenin ilk render sonrasına kadar var olmamasıdır!
```js 
<script setup>
import { ref, onMounted } from 'vue'

// declare a ref to hold the element reference
// the name must match template ref value
const input = ref(null)

onMounted(() => {
  input.value.focus()
})
</script>

<template>
  <input ref="input" />
</template>
```
Şu şekilde kullanabilirsiniz:
```js 
watchEffect(() => {
  if (input.value) {
    input.value.focus()
  } else {
    // not mounted yet, or the element was unmounted (e.g. by v-if)
  }
})
```
v-for ile örnek kullanım:
```js 
<script setup>
import { ref, onMounted } from 'vue'

const list = ref([
  /* ... */
])

const itemRefs = ref([])

onMounted(() => console.log(itemRefs.value))
</script>

<template>
  <ul>
    <li v-for="item in list" ref="itemRefs">
      {{ item }}
    </li>
  </ul>
</template>
```
## Function Refs 
**Fonksiyon olarak referans** atayabiliriz.
örnek kullanım:
```js 
<input :ref="(el) => { /* assign el to a property or ref */ }">
```

## Ref on Component
**Componentler olarak referans** kullanabiliriz.
örnek kullanım:
```js 
<script setup>
import { ref, onMounted } from 'vue'
import Child from './Child.vue'

const child = ref(null)

onMounted(() => {
  // child.value will hold an instance of <Child />
})
</script>

<template>
  <Child ref="child" />
</template>
```
