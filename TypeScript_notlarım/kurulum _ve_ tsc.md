# Kurulum ve tsc

## Kurulum 

**TypeScript i global olarak sistemimize kurmak için terminalimizde aşağıdaki komutu** çalıştırmamız yeterlidir.

 ```bash
npm install -g typescript
 ```
 ## tsc (TypeScript CLI)

 Oluşturduğunuz proje dizininde main.ts isimli dosya oluşturup TypeScript kodlarımız yazdıktan sonra terminalde 

  ```bash
tsc main.ts
 ```
 **kodunuz çalıştırdığımız takdirde ilgili TypeScript dosyamız compile edilip main.js** çıktısını vericektir. 

> **Note**: **Tarayıcılar, sadece JavaScripti derleyebilir.** Html dosyamıza
>   ```bash
>tsc main.ts
> ```
 > şeklinde **TypeScript dosyamızı eklediğimiz takdirde hata** alırız.
