# Form Input Bindings(Form Bağlama)
v-model, Vue.js'te çift yönlü veri bağlama (two-way data binding) sağlayan bir direktiftir. Bu direktif, genellikle form elemanlarıyla (input, textarea, select) birlikte kullanılır ve form elemanlarının değerlerini Vue bileşenlerinin veri modeliyle senkronize etmek için kullanılır.
## Text 
Aşığıdaki örnek text örneğidir. V-model ile yazılan text senkorize olarak p elementi içine yazılır.
```js
<p>Message is: {{ message }}</p>
<input v-model="message" placeholder="edit me" />
```
## Multiline text
Aşığıdaki örnek textarea örneğidir. V-model ile yazılan text senkorize olarak p elementi içine yazılır.
```js
<span>Multiline message is:</span>
<p style="white-space: pre-line;">{{ message }}</p>
<textarea v-model="message" placeholder="add multiple lines"></textarea>
```
## Checkbox 
Aşığıdaki örnek Checkbox örneğidir. V-model ile checkbox seçimin durumu (ture yada false) p elemti içinde gözükür yazılır.
```js
<span>Multiline message is:</span>
<p style="white-space: pre-line;">{{ message }}</p>
<textarea v-model="message" placeholder="add multiple lines"></textarea>
```
Aşığıdaki örnek ise çoklu checkbox seçimi örneğidir
```js
const checkedNames = ref([])
<div>Checked names: {{ checkedNames }}</div>

<input type="checkbox" id="jack" value="Jack" v-model="checkedNames">
<label for="jack">Jack</label>

<input type="checkbox" id="john" value="John" v-model="checkedNames">
<label for="john">John</label>

<input type="checkbox" id="mike" value="Mike" v-model="checkedNames">
<label for="mike">Mike</label>
```
## Radio
Aşığıdaki örnek Radio örneğidir. V-model ile Radio ile seçilen veri div elemnti içinde gözükür.
```js
<div>Picked: {{ picked }}</div>

<input type="radio" id="one" value="One" v-model="picked" />
<label for="one">One</label>

<input type="radio" id="two" value="Two" v-model="picked" />
<label for="two">Two</label>
```
## Select 
Aşığıdaki örnek Select  örneğidir. V-model ile Select ile seçilen veri div elemnti içinde gözükür.
```js
<div>Selected: {{ selected }}</div>

<select v-model="selected">
  <option disabled value="">Please select one</option>
  <option>A</option>
  <option>B</option>
  <option>C</option>
</select>
```
Aşığıdaki örnek multiple ile çoklu seçim yapılabilir.
```js
<div>Selected: {{ selected }}</div>

<select v-model="selected" multiple>
  <option>A</option>
  <option>B</option>
  <option>C</option>
</select>
```
## Value Bindings 
v-bind ile bu form elamanlarına dinamik olarak veri bağlayabiliriz.

true-value ve false-value, yalnızca v-model ile çalışan Vue'ya özgü niteliklerdir.

 Burada toggle özelliğinin değeri, kutu işaretlendiğinde 'yes' olarak ayarlanacak ve işaretlenmediğinde 'no' olarak ayarlanacaktır. Bunları v-bind kullanarak dinamik değerlere de bağlayabilirsiniz:
```js
<input
  type="checkbox"
  v-model="toggle"
  true-value="yes"
  false-value="no" />
```
> Note: true-value ve false-value nitelikleri girdinin value niteliğini etkilemez, çünkü tarayıcılar form gönderimlerinde işaretlenmemiş kutuları dahil etmez. Bir formda iki değerden birinin gönderilmesini garanti etmek için (örneğin, "evet" veya "hayır"), radyo girişlerini kullanın.

Radio için örnek:
```js
<input type="radio" v-model="pick" :value="first" />
<input type="radio" v-model="pick" :value="second" />
```
Select Options  için örnek:
```js
<select v-model="selected">
  <!-- inline object literal -->
  <option :value="{ number: 123 }">123</option>
</select>
```
## Modifiers(Düzenleyiciler)
inputlarda kullanılan bazı düzenleyeciler aşşığıda verilmiştir.

- `.lazy`
- `.trim`
- `.number`

`.lazy`: giriş alanındaki değeri güncellemek için "input" etkinliği yerine "change" etkinliğini bekler. Yani, değer değişiklikleri anında değil, giriş alanından odak çıkarıldığında günceller.```js
<!-- synced after "change" instead of "input" -->
<input v-model.lazy="msg" />
```

`.trim`: v-model direktifiyle birlikte kullanıldığında, kullanıcının giriş yaptığı metin değerinin başındaki ve sonundaki boşlukları kaldırır.
```js
<input v-model.trim="msg" />
```
`.number`: giriş alanındaki değeri sayısal bir değere dönüştürür. Yani, kullanıcı bir metin girişi yaparken, bu giriş otomatik olarak bir sayıya dönüştürülür. Bu, genellikle sayılarla çalışırken kullanışlıdır.

```js
<input v-model.number="age" />
```


