# Quasar Framework Env İle Api Url Ayarı

1. `.env.development` dosyası oluşturulur ve localde kullandığımız api url yapıştırılır:

```bash
VITE_API_URL=http://localhost/Therapify
```

2. `.env.production` dosyası oluşturulur ve canlı ortamda kullandığımız api url yapıştırılır:

```bash
VITE_API_URL=https://.myapi.com
```

3. `quasar.config.ts` env ayarı yapılır ve local veya canlı ortama göre api ayarı yapılır.

```js
  //env değerini al devolopment ve production için
       env: {
        API_URL: ctx.dev
          ? process.env.VITE_API_URL
          : process.env.VITE_API_URL
       },
```

4. Son olarak `axios.ts` dosyasında api url ayarı yapılır.

```js
// Get API URL from environment variables
const apiUrl = import.meta.env.VITE_API_URL;

if (!apiUrl) {
  console.error("API URL is not defined in environment variables");
}

// console.log('API URL:', apiUrl)

const api = axios.create({ baseURL: apiUrl });
```
