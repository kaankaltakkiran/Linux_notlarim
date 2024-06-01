# Class and Style Bindings

## Binding HTML Classes (Html Class Veri Bağlama)
**Html elementlerin class özelliğine binding işlemi** aşığıdaki gibi yapılır.

Burada **isActive değeri true olarak atanmış hasError değeri false** olarak atanmışdır.

**isActive değeri true olduğu olduğu sadace o özelliği** alacaktır.
```js
const isActive = ref(true)
const hasError = ref(false)
<div
  class="static"
  :class="{ active: isActive, 'text-danger': hasError }"
></div>
```
Render olduğunda div elementi aşığıdaki gibi gözükecektir:
```js
<div class="static active"></div>
```

Aşığıdaki bind özelliğinin kısa halde yazım şeklindedir.
```js
const activeClass = ref('active')
const errorClass = ref('text-danger')

<div :class="[activeClass, errorClass]"></div>
```
yada bu şekildede kullanabilir:
```js
<div :class="[isActive ? activeClass : '', errorClass]"></div>
```
Render olduğunda div elementi aşığıdaki gibi gözükecektir:
```js
<div class="active text-danger"></div>
```