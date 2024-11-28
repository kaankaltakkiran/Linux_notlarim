# Quasarda Uygulama Geliştirirken Yaşadığım Sorunlar Ve Çözümü

## Cors Hatası Nasıl Çözülür ?

[Cors hakkında detaylı bilgi](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/php_notlarim/notlarim/cors_nedir.md)

Aşığıdaki kodları api dosyasına ekleyerek sorun çözülür.

```php
// CORS başlıkları
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
header('Content-Type: application/json');

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'OPTIONS') {
  http_response_code(200);
  exit;
}

```

## Router Türü Nasıl Değiştirilir ?

`quasar.config.js` dosyasında default olarak hash olarak tanımlı gelen `vueRouterMode` değerini hash yerine history yazarak değiştirilir.

```js
 vueRouterMode: 'history', // available values: 'hash', 'history'
```

## Türkçe Krakter Sorunu Nasıl Çözülür ?

`quasar.config.js` dosyasında extras kısmında default olarak roboto-font olarak tanımlı gelen değeri yerine roboto-font-latin-ext yazarak değiştirilir.

```js
 'roboto-font-latin-ext', // optional, you are not bound to it
```

## Notify, Dialog, Loading Gibi Quasar Compentleri Çalışmıyorsa

`quasar.config.js` dosyasında plugins kısmına kullanmak istediğiniz componenti eklemelisiniz.

```js
  plugins: [
        'Notify',
        'Dialog',
        'Loading',
      ],
```

## Quasar Dil Paketi Nasıl Türkçe Yapılır ?

`quasar.config.js` dosyasında framework kısmında default olarak en-US olarak tanımlı gelen lang değerini tr olarak değiştirin.

[Desteklenen Diller](https://github.com/quasarframework/quasar/tree/dev/ui/lang)

```js
lang: 'tr', // Quasar language pack
```

## [ Property '$q' does not exist on type '{ $: ComponentInternalInstance; Hatası Nasıl Çözülür ?](https://chatgpt.com/share/67483eea-89a0-8008-b22a-b054a63847a5)

Quasar CLI ile TypeScript seçeneği kullanarak oluşturulan projelerde, $q gibi Quasar nesnesine ait özellikler varsayılan olarak Vue'nun globalProperties özelliği üzerinden kullanılır.

Ancak, TypeScript ile çalışırken bu tür özelliklerin tanımlanmaması, tip denetleyicisinin hata vermesine neden olabilir.

`src/quasar.d.ts`

```js
/// <reference types="@quasar/app-vite" />

import { QVueGlobals } from 'quasar';

declare module '@vue/runtime-core' {
  interface ComponentCustomProperties {
    $q: QVueGlobals;
  }
}
```
