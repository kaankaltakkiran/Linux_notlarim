# Quasar Framework Notlarım

Quasar Framework, **Vue.js tabanlı** bir frontend framework’tür. Tek bir kod tabanıyla şu platformlar için uygulama geliştirmeni sağlar:

✅ Web

✅ Mobil (iOS / Android – Cordova veya Capacitor ile)

✅ Masaüstü (Electron ile)

✅ PWA (Progressive Web App)

## 1. Gereksinimler

- **Node.js**: 14+ üstü
- **Npm**

## 2. Kurulum

Nodejs ve npm kurulumu için [Node.js kurulum sitesine ](https://nodejs.org/en/download) giderek işletim sisteminize uygun olacak şekilde kurulumu yapın.

Kurulumu kontrol etmek için terminalde aşağıdaki komutu çalıştırın.

```bash
node -v
npm -v
```

> örnek çıktı:
> v24.4.1
> 11.5.1

Quasarı CLI ile kurmak için terminalde aşağıdaki komutu çalıştırın:

```bash
npm i -g @quasar/cli
```

## 3. Yeni Quasar Projesi Oluşturma

Aşağıdaki komutu çalıştırarak yeni bir Quasar projesi oluşturun:

```bash
npm init quasar@latest
```

Gerekli kurulumlar tamamlantıktan sonra cd komutu ile proje dizinine gidin:

```bash
cd quasar-app
```

Son olarak aşığıdaki komut ile projenizi çalıştırın

```bash
quasar dev
```

## Quasar Projesi Yapısı

Quasar projesi oluşturulduğunda aşağıdaki dizin yapısı oluşur:

```bash
my-quasar-app/
├── public/              # Statik dosyalar (favicon, robots.txt vs.)
├── src/                 # Tüm uygulama kaynak kodları
│   ├── assets/          # Görseller, global SCSS/CSS dosyaları
│   ├── boot/            # Uygulama başında çalışan servis dosyaları (örneğin axios)
│   ├── components/      # Tekrar kullanılabilir Vue bileşenleri
│   ├── composables/     # Composition API fonksiyonları (useX gibi)
│   ├── layouts/         # Sayfa iskeletleri (navbar, sidebar, footer)
│   ├── pages/           # Route'a bağlı sayfalar (Login, Anasayfa, Profil)
│   ├── router/          # Vue Router ayarları (routes.js)
│   ├── stores/          # Pinia store dosyaları (global state)
│   ├── App.vue          # Ana uygulama bileşeni (root component)
│   └── main.js          # Vue uygulamasının giriş noktası
├── quasar.config.js     # Quasar ayarları (tema, plugin, ikon vs.)
├── package.json         # Proje bağımlılıkları ve script'ler
└── vite.config.js       # Vite yapılandırma (gelişmiş ayarlar, alias, proxy vs.)
```

## Navbar Oluşturma

```ts
<template>
      <q-toolbar class="bg-primary text-white shadow-2 rounded-borders">
        <q-btn flat label="E-ticaret" />
        <q-space />

        <q-tabs v-model="tab" shrink>
          <q-tab name="home" label="Ana Sayfa" />
          <q-tab name="products" label="Ürünler" />
          <q-tab name="register" label="Üye Ol" />
          <q-tab name="login" label="Giriş Yap" />
          <q-tab name="logout" label="Çıkış Yap" />
        </q-tabs>
      </q-toolbar>
</template>

<script setup lang="ts">
import { ref } from "vue";

const tab = ref<string>("home");
</script>
```

> **Note:** `<q-tab` ile route işlemi yapılacaksa `q-tab` yerine `q-route-tab` kullanılır.

> Örnek kullanım:
> `<q-route-tab name="register" to="/register" exact label="Üye Ol" />`

### Quasar Ayar Notlarım (quasar.config.js)

Aşağıda quasar framework ile ihtiyaç duyabileceğimiz ayarlar bulunmaktadır.

## Router Türü Nasıl Değiştirilir ?

Default olarak `hash` router kullanılır. Web url adresinde `#` ile başlar. Örnek: `http://localhost:9000/#/login`.

Bu `#` işaretini kaldırmak için `history` router kullanılır. Web url adresinde `#` işareti olmadan başlar. Örnek: `http://localhost:9000/login`.

`quasar.config.js` dosyasında default olarak hash olarak tanımlı gelen 46. satırda `vueRouterMode` değerini hash yerine `history` yazarak değiştirilir.

```js
vueRouterMode: 'hash', // bu kısımda hash yerine history yazılır.
```

## Türkçe Krakter Sorunu Nasıl Çözülür ?

`quasar.config.js` dosyasında extras kısmında 30. satırda default olarak `roboto-font` olarak tanımlı gelen değeri yerine `roboto-font-latin-ext` yazarak değiştirilir.

```js
 extras: [
      // 'ionicons-v4',
      // 'mdi-v7',
      // 'fontawesome-v6',
      // 'eva-icons',
      // 'themify',
      // 'line-awesome',
      // 'roboto-font-latin-ext', // this or either 'roboto-font', NEVER both!

      'roboto-font', // bu kısıma roboto-font-latin-ext yazılır.
      'material-icons', // optional, you are not bound to it
    ],
```

## Notify, Dialog, Loading Gibi Quasar Plugin'leri Çalışmıyorsa

`quasar.config.js` dosyasında plugins kısmına 101. satırda kullanmak istediğiniz plugin'i eklemelisiniz.

```js
  plugins: [
        'Notify',
        'Dialog',
        'Loading',
      ],
```

## Quasar Dil Paketi Nasıl Türkçe Yapılır ?

`quasar.config.js` dosyasında framework kısmında 91. satırda default olarak `en-US` olarak tanımlı gelen lang değerini `tr` olarak değiştirin ve `lang` kısmının başına `//` işaretini kaldırın.

[Desteklenen Diller](https://github.com/quasarframework/quasar/tree/dev/ui/lang)

```js
lang: 'en-US', // bu kısımda en-US yerine tr yazılır.
```
