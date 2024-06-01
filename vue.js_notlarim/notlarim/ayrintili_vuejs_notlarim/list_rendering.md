# List Rendering (Liste Render) 

## v-for
v-for ile for döngüsü oluşturulur. Örneğin bir dizideki elemanları tek tek listelemek için kullanılır.

Aşığıdaki örnekte items dizisindeki elemanları listeleryazar.
```js
const parentMessage = ref('Parent')
const items = ref([{ message: 'Foo' }, { message: 'Bar' }])

<li v-for="(item, index) in items">
  {{ parentMessage }} - {{ index }} - {{ item.message }}
</li>
```
örnek çıktı:
Parent - 0 - Foo

Parent - 1 - Bar

## v-for Range

Aşığıdaki örnekte belirlediğimiz sayı kadar listelemeyapar.
```js
<span v-for="n in 10">{{ n }}</span>
```
## v-for Template
Aşığıdaki örnekte Template listeleme işlemiyapar.
```js
<ul>
  <template v-for="item in items">
    <li>{{ item.msg }}</li>
    <li class="divider" role="presentation"></li>
  </template>
</ul>
```
## v-for key
v-for ile bir liste oluştururken key özelliği, Vue'ye her bir liste öğesinin benzersiz bir kimliğe sahip olduğunu belirtir.

 Bu, Vue'nun listeyi daha etkili bir şekilde yönetmesine ve performansını artırmasına yardımcı olur.
 Örnek kullanım:
```js
<ul>
  <li v-for="item in items" :key="item.id">{{ item.name }}</li>
</ul>

```
## v-for with a Component 
v-for component ile kullanımı.
 Örnek kullanım:
```js
<MyComponent
  v-for="(item, index) in items"
  :item="item"
  :index="index"
  :key="item.id"
/>
```
## Array Change Detection 
v-for ile genelde dizi şeklindeki elemanları listelemek için kullanıldığında aşığıdaki javasciprt dizi metotları sıkça kullanılır.
- `push()`
- `pop()`
- `shift()`
- `unshift()`
- `splice()`
- `sort()`
- `reverse()`

 Örnek filter işlemi:
```js
const numbers = ref([1, 2, 3, 4, 5])

const evenNumbers = computed(() => {
  return numbers.value.filter((n) => n % 2 === 0)
})
```
> Note: Eğer bu metotları kullanacaksanız aşşığıdaki gibi kullanılmalı. Çünkü bu işlemlerle siz verinizi manipüle etmiş olursuz. Aşığıdaki gibi kullanım dizinin bir kopyasını alarak işlem yapar

```js
- return numbers.reverse()
+ return [...numbers].reverse()
```
