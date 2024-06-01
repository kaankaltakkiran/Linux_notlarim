# Props
Bir bileşenin dış dünyadan veri almasına olanak tanır. Bu, genellikle üst düzey bileşenin içinde tanımlandığı ve alt bileşenlere aktarıldığı bir mekanizmadır.

Props, veri akışını tek yönlü hale getirir. Yani, bir üst düzey bileşen tarafından bir alt bileşene iletilen veri, alt bileşen tarafından doğrudan değiştirilemez. 

Bunun yerine, alt bileşen, props olarak aldığı veriyi kullanabilir ve görüntüleyebilir, ancak doğrudan değiştiremez.

Aşığıdaki örnekte örnek props tanımlanmıştır(Parent Component):
```js
<script setup>
const msg = ref('Hello from parent')

</script>
```
Aşığıdaki örnekte propsları bu şekilde alırız:
```js
<script setup>
const props = defineProps({
  msg: String
})
</script>

<template>
  <h2>{{ msg}}</h2>
</template>
```
Props tanımlarken kebab-case tanımlayabilirsiniz:
```js
<MyComponent greeting-message="hello" />
```
## Static vs. Dynamic Props 
v-bind ile dinamik props tanımlayabiliriz.

Aşşağıdaki örnek number tipi için
```js
<!-- Even though `42` is static, we need v-bind to tell Vue that -->
<!-- this is a JavaScript expression rather than a string.       -->
<BlogPost :likes="42" />

<!-- Dynamically assign to the value of a variable. -->
<BlogPost :likes="post.likes" />
```
Aşşağıdaki örnek Boolean tipi için
```js
<!-- Including the prop with no value will imply `true`. -->
<BlogPost is-published />

<!-- Even though `false` is static, we need v-bind to tell Vue that -->
<!-- this is a JavaScript expression rather than a string.          -->
<BlogPost :is-published="false" />

<!-- Dynamically assign to the value of a variable. -->
<BlogPost :is-published="post.isPublished" />
```
Aşşağıdaki örnek Array tipi için
```js
<!-- Even though the array is static, we need v-bind to tell Vue that -->
<!-- this is a JavaScript expression rather than a string.            -->
<BlogPost :comment-ids="[234, 266, 273]" />

<!-- Dynamically assign to the value of a variable. -->
<BlogPost :comment-ids="post.commentIds" />
```
Aşşağıdaki örnek Object tipi için
```js
<!-- Even though the object is static, we need v-bind to tell Vue that -->
<!-- this is a JavaScript expression rather than a string.             -->
<BlogPost
  :author="{
    name: 'Veronica',
    company: 'Veridian Dynamics'
  }"
 />

<!-- Dynamically assign to the value of a variable. -->
<BlogPost :author="post.author" />
```
## Binding Multiple Properties Using an Object (Çoklu Props Objesi)
Çoklu props mümkün
```js
const post = {
  id: 1,
  title: 'My Journey with Vue'
}

<BlogPost :id="post.id" :title="post.title" />
```

> Note: Propslar sadece readonlydir. Yani sadece değerini okunur değiştirilemez.

## Prop Validation (Prop Doğrulama)
`defineProps()` ile props tanımlanabilir.
Aşığıdaki örnek props doğrulama ile ilgilidir.
```js
defineProps({
  // Basic type check
  //  (`null` and `undefined` values will allow any type)
  propA: Number,
  // Multiple possible types
  propB: [String, Number],
  // Required string
  propC: {
    type: String,
    required: true
  },
  // Required but nullable string
  propD: {
    type: [String, null],
    required: true
  },
  // Number with a default value
  propE: {
    type: Number,
    default: 100
  },
  // Object with a default value
  propF: {
    type: Object,
    // Object or array defaults must be returned from
    // a factory function. The function receives the raw
    // props received by the component as the argument.
    default(rawProps) {
      return { message: 'hello' }
    }
  },
  // Custom validator function
  // full props passed as 2nd argument in 3.4+
  propG: {
    validator(value, props) {
      // The value must match one of these strings
      return ['success', 'warning', 'danger'].includes(value)
    }
  },
  // Function with a default value
  propH: {
    type: Function,
    // Unlike object or array default, this is not a factory
    // function - this is a function to serve as a default value
    default() {
      return 'Default function'
    }
  }
})
```
> Note: required: true belirtilmediği sürece tüm proplar varsayılan olarak isteğe bağlıdır.

>  Boolean dışında isteğe bağlı olmayan bir prop tanımsız değere sahip olacaktır.
## Boolean Casting 
Boolean için özel durum vardır.

> Note: Boolean casting kuralı yalnızca Boolean String'den önce göründüğünde uygulanır:
```js
// disabled will be casted to true
defineProps({
  disabled: [Boolean, Number]
})

// disabled will be casted to true
defineProps({
  disabled: [Boolean, String]
})

// disabled will be casted to true
defineProps({
  disabled: [Number, Boolean]
})

// disabled will be parsed as an empty string (disabled="")
defineProps({
  disabled: [String, Boolean]
})
```