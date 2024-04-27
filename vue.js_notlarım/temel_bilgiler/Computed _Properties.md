# Computed Properties(Hesaplan Özellikler) 
**computed özelliği, bir veya daha fazla bağımlılığı olan bir hesaplama fonksiyonunu içerir**. 

**Bir bağımlılık değiştiğinde, computed özelliğinin içindeki hesaplama fonksiyonu otomatik olarak yeniden çalışır ve sonuç güncellenir**.
Aşığıdaki örnekte computed fnksiyonu, hesaplanmış bir değer oluşturur. publishedBooksMessage adında bir hesaplanmış değer oluşturulmuştur. Bu hesaplanmış değer, yazarın kitaplarını kontrol eder ve en az bir kitabı varsa 'Yes', yoksa 'No' metnini döndürür. author.books.length ifadesiyle yazarın kitap sayısı hesaplanır ve bu değer kontrol edilir.
```js
<script setup>
import { reactive, computed } from 'vue'

const author = reactive({
  name: 'John Doe',
  books: [
    'Vue 2 - Advanced Guide',
    'Vue 3 - Basic Guide',
    'Vue 4 - The Mystery'
  ]
})

// a computed ref
const publishedBooksMessage = computed(() => {
  return author.books.length > 0 ? 'Yes' : 'No'
})
</script>

<template>
  <p>Has published books:</p>
  <span>{{ publishedBooksMessage }}</span>
</template>
```