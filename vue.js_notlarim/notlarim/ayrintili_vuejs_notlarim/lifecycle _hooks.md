# Lifecycle Hooks(Vue Yaşam DÖngüsü)

Yaşam döngüsü methodları sayfa oluşturulurken bir sıraya göre tetiklenmekte. Bu durum bir sayfanın veya Component’in geliştirilmesi adına çok kolaylık sağlamaktadır.

Kaynak: [Vue.Js Yaşam Döngüsü Özellikleri](https://medium.com/software-development-turkey/vuejs-ya%C5%9Fam-d%C3%B6ng%C3%BCs%C3%BC-lifecycle-42a564361941)
![Yaşam Döngüsü](https://miro.medium.com/v2/resize:fit:1400/1*OwslAJ5f27xZhg5JZiq5DA.png)
## beforeCreate

Vue.js instance nesnesi oluşturulmadan önce çağrılan metoddur. Bu işlem tamamlanmadan hiç bir lifecycle methodu ile etkileşime giremeyiz. 


## created
ilk Vue.js instance nesnesi oluşturulduğunda çağrılan metoddur.

> Note: Created fonksiyonu element için 1 kez tetiklenir, silinse dahi bunu tutar ve bir sonraki çağrılışında sadece içindeki objeleri değiştirir.
##  beforeMount

Bu aşamada html kod bloğu sanal DOM’a daha yerleştirilmemiştir.
## mounted

Bu aşamada html kod bloğu sanal DOM’a yerleştirilmiştir. Kısaca tüm componentler render edilmiş ve sanal DOM hazırlanmıştır.

## beforeUpdate

DOM’da güncellemeye ihtiyaç duyulduğunda, data ve DOM’da veri değişmeden önce bu metod çağrılır.

## updated

DOM’da veri değiştiğinde bu metodu çağrılır.
##  beforeDestroy
Vue instance nesnesi yok edilmeden önce çağrılan metodudur.
## destroyed

Vue instance nesnesi yok edildikten sonra çağrılan metodudur.
## Vue 3 İle Örnek Kullanım
```JS
<template>  
<div>  
<p>Counter: {{ counter }}</p>  
<button @click="increment">Increment</button>  
</div>  
</template>  
  
<script>  
import { ref, onMounted, onUpdated, onUnmounted } from 'vue';  
  
export default {  
setup() {  
const counter = ref(0);  
  
// onMounted Hook: Executes logic after component is mounted  
onMounted(() => {  
console.log('Component is mounted');  
});  
  
// onUpdated Hook: Executes logic after component is updated  
onUpdated(() => {  
console.log('Component is updated');  
});  
  
// onUnmounted Hook: Executes logic before component is unmounted  
onUnmounted(() => {  
console.log('Component is unmounted');  
});  
  
const increment = () => {  
counter.value++;  
};  
  
return { counter, increment };  
},  
};  
</script>

```


