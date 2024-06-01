# Slots 

**bileşenler arasında içerik geçişi sağlamak** için kullanılır. **Propsta olduğu gibi ana componentten alt componente veri** aktarılır.

**Böylece bir bileşen içinde tanımlanan içerik, bu bileşeni kullanan yerde belirli bir yerde gösterilebilir.** Slotlar, özellikle **genişletilebilir veya yeniden kullanılabilir bileşenler oluştururken çok güçlü**bir araçtır.

Aşığıdaki **component ana** componenttir.
```js
<BaseLayout>
  <template v-slot:header>
    <!-- content for the header slot -->
  </template>
</BaseLayout>
```
Aşığıdaki **component alt** componenttir.
```js
<BaseLayout>
  <template #header>
    <h1>Here might be a page title</h1>
  </template>

  <template #default>
    <p>A paragraph for the main content.</p>
    <p>And another one.</p>
  </template>

  <template #footer>
    <p>Here's some contact info</p>
  </template>
</BaseLayout>
```
## Conditional Slots(Şartlı Slot) 
**v-if ile slotlarla şart** yapabilirsiniz.
```js
<template>
  <div class="card">
    <div v-if="$slots.header" class="card-header">
      <slot name="header" />
    </div>
    
    <div class="card-content">
      <slot />
    </div>
    
    <div v-if="$slots.footer" class="card-footer">
      <slot name="footer" />
    </div>
  </div>
</template>
```
## Dynamic Slot Names(Dinamik Slot)
**v-bin(:) ile dinamik slot** oluşturalabilir.
```js
<base-layout>
  <template v-slot:[dynamicSlotName]>
    ...
  </template>

  <!-- with shorthand -->
  <template #[dynamicSlotName]>
    ...
  </template>
</base-layout>
```
## Scoped Slots(Slot Kapsamı)
**Propstaki gibi birden fazla slotu aynı anda** alabiliriz. 

Slot tanımlama:
```js
<!-- <MyComponent> template -->
<div>
  <slot :text="greetingMessage" :count="1"></slot>
</div>
```
Slot kullanma
```js
<MyComponent v-slot="slotProps">
  {{ slotProps.text }} {{ slotProps.count }}
</MyComponent>
```
## Fancy List Example 

**uzak verileri yükleme mantığını, bir listeyi görüntülemek için verileri kullanmayı ve hatta sayfalama veya sonsuz kaydırma gibi gelişmiş özellikleri kapsülleyebilir.**

  **Bununla birlikte, her bir öğenin nasıl görüneceği konusunda esnek olmasını ve her bir öğenin stilini onu tüketen ana bileşene bırakmasını** istiyoruz.
  
  Örnek kullanım:
```js
<FancyList :api-url="url" :per-page="10">
  <template #item="{ body, username, likes }">
    <div class="item">
      <p>{{ body }}</p>
      <p>by {{ username }} | {{ likes }} likes</p>
    </div>
  </template>
</FancyList>
  ```
Tanımlanan slotu alma:
  ```js
<ul>
  <li v-for="item in items">
    <slot name="item" v-bind="item"></slot>
  </li>
</ul>
  ```