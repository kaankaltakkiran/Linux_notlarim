# Event Handling (OLay İşleme)

## Inline Handlers (Satır İşleme)
Aşığıdaki örnek **ile click eventi** gerçekleştirilmektedir.
```js
const count = ref(0)
<button @click="count++">Add 1</button>
<p>Count is: {{ count }}</p>
```
## Method Handlers (Methot ile işleme)
Aşığıdaki **örnek ile, event.target aracılığıyla olayı gönderen öğeye** erişebiliyoruz.
```js
const name = ref('Vue.js')

function greet(event) {
  alert(`Hello ${name.value}!`)
  // `event` is the native DOM event
  if (event) {
    alert(event.target.tagName)
  }
}
<!-- `greet` is the name of the method defined above -->
<button @click="greet">Greet</button>
```
Aşığıdaki kod örnek hem ınline ile hem de methot ile event tetikleme örneği
```js
function say(message) {
  alert(message)
}
<button @click="say('hello')">Say hello</button>
<button @click="say('bye')">Say bye</button>
```
## Event Modifiers (Olay Değiştiricileri)
**Bir çok olay methotları** bulunmaktadır. Aşığıda örnek verilmiştir:

- `.stop`
- `.prevent`
- `.self`
- `.capture`
- `.once`
- `.passive`

`.stop`: **Bu modifier, olayın etkileşim alanı dışına çıkmasını önler**. Örneğin, bir butona tıkladığınızda butonun dışında bir elemente tıklamaya çalışırsanız, bu modifier kullanılarak bu tıklamanın butona etki etmesi engellenebilir.

`.prevent`: **Bu modifier, tarayıcının varsayılan olay davranışını engeller**. Örneğin, **bir form gönderme işleminden önce sayfanın yenilenmesini** önlemek için kullanılabilir.

`.self`: Bu modifier, **olayın tetiklendiği öğenin kendisi olduğunda** işlem yapar. Örneğin, bir **liste öğesine tıkladığınızda, tıklama olayının yalnızca liste öğesinin kendisi üzerinde gerçekleşmesini sağlar, içindeki alt öğelerde gerçekleşmez**.

 `.capture`: Bu modifier, **olayı yakalama evresinde** dinler. Normalde, olay ana öğeden alt öğelere doğru yayılır, ancak bu modifier kullanılarak **olayın alt öğelerden ana öğeye doğru yayılması** sağlanır.
`.once`: Bu modifier, **olay dinleyicisinin sadece bir kez tetiklenmesini sağlar**. İlk tetiklemeden sonra dinleyici otomatik olarak kaldırılır.

`.passive`: Bu modifier, **olay dinleyicisinin preventDefault() çağrısını önler. Bu özellik, kaydırma olaylarında kullanılabilir ve performansı** artırabilir.
```js
<!-- the click event's propagation will be stopped -->
<a @click.stop="doThis"></a>

<!-- the submit event will no longer reload the page -->
<form @submit.prevent="onSubmit"></form>

<!-- modifiers can be chained -->
<a @click.stop.prevent="doThat"></a>

<!-- just the modifier -->
<form @submit.prevent></form>

<!-- only trigger handler if event.target is the element itself -->
<!-- i.e. not from a child element -->
<div @click.self="doThat">...</div>

<!-- use capture mode when adding the event listener     -->
<!-- i.e. an event targeting an inner element is handled -->
<!-- here before being handled by that element           -->
<div @click.capture="doThis">...</div>

<!-- the click event will be triggered at most once -->
<a @click.once="doThis"></a>

<!-- the scroll event's default behavior (scrolling) will happen -->
<!-- immediately, instead of waiting for `onScroll` to complete  -->
<!-- in case it contains `event.preventDefault()`                -->
<div @scroll.passive="onScroll">...</div>
```
## Key Modifiers (Klavye Değiştirecileri)
**Bir çok kalvye  olay methotları** bulunmaktadır. Aşığıda örnekler klavye tuşları verilmiştir:

- `.enter`
- `.tab`
- `.delete` (captures both "Delete" and "Backspace" keys)
- `.esc`
- `.space`
- `.up`
- `.down`
- `.left`
- `.right`


**Fare veya klavye olay dinleyicilerini yalnızca ilgili değiştirici tuşa basıldığında tetiklemek için aşağıdaki değiştiricileri** kullanabilirsiniz:

- `.ctrl`
- `.alt`
- `.shift`
- `.meta`

::: tip Note
On Macintosh keyboards, meta is the command key (⌘). On Windows keyboards, meta is the Windows key (⊞). On Sun Microsystems keyboards, meta is marked as a solid diamond (◆). On certain keyboards, specifically MIT and Lisp machine keyboards and successors, such as the Knight keyboard, space-cadet keyboard, meta is labeled “META”. On Symbolics keyboards, meta is labeled “META” or “Meta”.
:::

Aşığıdaki kod **klavyeden enter tuşuna** basınca tetiklenir.
```js
<!-- only call `submit` when the `key` is `Enter` -->
<input @keyup.enter="submit" />
```

Aşığıdaki kod **klavyeden page down tuşuna** basınca tetiklenir.
```js
<!-- only call `submit` when the `key` is `Enter` -->
<input @keyup.enter="submit" />
```
## `.exact` Modifier {Exact Değiştiricisi}
**exact: Bu modifier, sadece belirtilen tuşun basıldığında olayın tetiklenmesini sağlar.**

**Başka bir deyişle, bu modifier olmadan, Ctrl tuşu basılı olduğunda ve ek bir tuşa basıldığında olay da tetiklenebilir. Ancak exact modifier kullanıldığında, sadece belirtilen tuşun basıldığı durumda** olay tetiklenir.
Örnek Kullanım:
```js
<!-- this will fire even if Alt or Shift is also pressed -->
<button @click.ctrl="onClick">A</button>

<!-- this will only fire when Ctrl and no other keys are pressed -->
<button @click.ctrl.exact="onCtrlClick">A</button>

<!-- this will only fire when no system modifiers are pressed -->
<button @click.exact="onClick">A</button>
```

## Mouse Button Modifiers (Mouse İle Kullanılan Değiştirciler)

- `.left`
- `.right`
- `.middle`