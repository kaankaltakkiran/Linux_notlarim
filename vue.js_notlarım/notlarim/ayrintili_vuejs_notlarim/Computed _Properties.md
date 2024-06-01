# Computed Properties(Hesaplan Özellikler) 
## Computed
**computed özelliği, bir veya daha fazla bağımlılığı olan bir hesaplama fonksiyonunu içerir**. 

**Bir bağımlılık değiştiğinde, computed özelliğinin içindeki hesaplama fonksiyonu otomatik olarak yeniden çalışır ve sonuç güncellenir**.

Aşığıdaki örnekte computed fnksiyonu, hesaplanmış bir değer oluşturur. publishedBooksMessage adında bir hesaplanmış değer oluşturulmuştur. 

Bu hesaplanmış değer, yazarın kitaplarını kontrol eder ve en az bir kitabı varsa 'Yes', yoksa 'No' metnini döndürür. author.books.length ifadesiyle yazarın kitap sayısı hesaplanır ve bu değer kontrol edilir.
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
## Computed ile Metot Arasındaki Fark Nedir?
**Computed özellikleri, bir değeri hesaplamak ve bağımlılıklarının değiştiğinde otomatik olarak güncellemek için kullanılırken**,

**metotlar genellikle olay tetiklendiğinde bir işlem gerçekleştirmek veya belirli bir davranışı kontrol etmek için** kullanılır.
