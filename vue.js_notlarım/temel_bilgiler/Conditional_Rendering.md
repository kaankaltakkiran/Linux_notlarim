# Conditional Rendering(Koşullu Render) 

## v-if
**v-if ile tanımlanan koşulun değeri true** ise  element görünür olur.

Aşığıdaki örnekte **awesome değeri ture ise ekranda Vue is awesome!**yazar.
```js
<h1 v-if="awesome">Vue is awesome!</h1>
```
Aşığıdaki örnekte **v-else awesome değeri false ise ekranda Oh no 😢**yazar.
```js
<button @click="awesome = !awesome">Toggle</button>

<h1 v-if="awesome">Vue is awesome!</h1>
<h1 v-else>Oh no 😢</h1>
```
Aşığıdaki örnekteki gibi if-else bloğu oluşturabilir:
```js
<div v-if="type === 'A'">
  A
</div>
<div v-else-if="type === 'B'">
  B
</div>
<div v-else-if="type === 'C'">
  C
</div>
<div v-else>
  Not A/B/C
</div>
```
Aşığıdaki örnekteki gibi if-else bloğunu templatlerde de kullanabiliriz:
```js
<template v-if="ok">
  <h1>Title</h1>
  <p>Paragraph 1</p>
  <p>Paragraph 2</p>
</template>
```
## v-show
**v-showile tanımlanan koşulun değeri true** ise  element görünür olur.

Aşığıdaki örnekte **awesome değeri ture ise ekranda Vue is awesome!**yazar.
```js
<h1 v-show="ok">Hello!</h1>
```
> **Note**: **v-if ile v-show farkı şudur: v-if değeri false ise dom da bu element yer almaz ama v-show değeri false ise bu element domda gizli bir şekilde** bulunur.
