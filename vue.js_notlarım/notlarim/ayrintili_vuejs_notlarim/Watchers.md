# Watchers 

**Vue.js'de "watcher"lar, veri değişikliklerini izlemek ve buna tepki vermek için** kullanılır. **Vue bileşenlerinde veri değiştiğinde otomatik olarak** yeniden render yapılır, ancak bazen bu veri değişiklikleriyle özelleştirilmiş işlemler yapmak isteyebilirsiniz. İşte bu durumda watcher'lar devreye girer.

**Bir watcher, bir veriyi izler ve bu veride bir değişiklik olduğunda belirtilen işlevi** çalıştırır. 
```js
const x = ref(0)
const y = ref(0)

// single ref
watch(x, (newX) => {
  console.log(`x is ${newX}`)
})

// getter
watch(
  () => x.value + y.value,
  (sum) => {
    console.log(`sum of x + y is: ${sum}`)
  }
)

// array of multiple sources
watch([x, () => y.value], ([newX, newY]) => {
  console.log(`x is ${newX} and y is ${newY}`)
})
```
Aşığıdaki örnekte eski ve yeni değeri gözlemleme örneğidir:
```js
const obj = reactive({ count: 0 })

watch(obj, (newValue, oldValue) => {
  // fires on nested property mutations
  // Note: `newValue` will be equal to `oldValue` here
  // because they both point to the same object!
})

obj.count++
```
Aşşığıdaki örnekte **immediate seçeneği, watcher'ın anında başlatılmasını sağlar**. Yani, **watcher, bileşenin oluşturulması sırasında hemen çalıştırılır ve source'un ilk değeriyle birlikte çalışır**. Daha sonra **source değiştiğinde, watcher normal şekilde yeniden** çağrılır.
```js
watch(
  source,
  (newValue, oldValue) => {
    // executed immediately, then again when `source` changes
  },
  { immediate: true }
)
```
Aşşağıdaki örnekte  **once seçeneği, watcher'ın sadece bir kere tetiklenmesini** sağlar. Yani, source verisi **bir kere değiştiğinde, watcher tetiklenir ve daha sonra otomatik olarak kaldırılır**. Bu nedenle, source verisi bir daha değişse bile, bu watcher çalışmayacaktır.
```js
watch(
  source,
  (newValue, oldValue) => {
    // when `source` changes, triggers only once
  },
  { once: true }
)
```
## watchEffect()
watchEffect **ile otomatik değişen verileri** izlemeye yarar.

Örnek kullanım:
```js
watchEffect(async () => {
  const response = await fetch(
    `https://jsonplaceholder.typicode.com/todos/${todoId.value}`
  )
  data.value = await response.json()
})
```
## `watchEffect` vs `watch`
İşlevsel olarak, `watchEffect` ve `watch` benzerdir, ancak bazı farklılıklar bulunmaktadır:

**İzleme Yapısı:**
- `watch`: Belirli bir veriyi izler ve bu veri değiştiğinde belirtilen işlevi çalıştırır. Bu, izlenen değerleri spesifik olarak belirtmenizi gerektirir.
- `watchEffect`: Bir işlevi izler ve bu işlevin içinde kullanılan herhangi bir reaktif değer değiştiğinde otomatik olarak yeniden çalışır. Bu, daha dinamik bir izleme yapısı sunar ve izlenen değerleri spesifik olarak belirtmenize gerek yoktur.

**Bağımlılıkların Otomatik Algılanması:**
- `watch`: İzlenen değerlerin değişikliklerini manuel olarak belirtmeniz gerekir.
- `watchEffect`: İşlev içinde kullanılan reaktif değerler otomatik olarak algılanır ve değişiklikleri izler.

**Bağlam Bilgisi:**
- `watch`: İzlenen değerlerin eski ve yeni değerleri gibi bağlam bilgilerine erişmeniz gerekebilir.
- `watchEffect`: Bağlam bilgilerine ihtiyaç duymazsınız, çünkü bu işlev içinde kullanılan reaktif değerler otomatik olarak algılanır.
