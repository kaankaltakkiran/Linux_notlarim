# 📬 Laravel API Postman Rehberi

Bu rehber, Laravel ile oluşturulmuş bir basit blog API'sini Postman ile test etmek isteyenler için HTTP isteklerini adım adım anlatır. API, kullanıcı kayıt, giriş, çıkış ve post CRUD (Create, Read, Update, Delete) işlemlerini içerir.

> **Base URL:** `http://127.0.0.1:8000/api`

---

## 🧑‍💻 1. Kullanıcı Kayıt (Register)

- **Yöntem:** `POST`
- **URL:** `/register`

### 🧾 Body

```json
{
  "name": "Kaan",
  "email": "kaan@gmail.com",
  "password": "123",
  "password_confirmation": "123"
}
```

### ✅ Örnek Yanıt

```json
{
  "user": {
    "name": "Kaan",
    "email": "kaan@gmail.com",
    "updated_at": "2025-07-18T08:00:00.000000Z",
    "created_at": "2025-07-18T08:00:00.000000Z",
    "id": 1
  },
  "token": "2|SwJzsHBdbWcf..."
}
```

---

## 🔐 2. Giriş Yap (Login)

- **Yöntem:** `POST`
- **URL:** `/login`

### 🧾 Body

```json
{
  "email": "kaan@gmail.com",
  "password": "123"
}
```

### ✅ Örnek Yanıt

```json
{
  "user": {
    "id": 1,
    "name": "Kaan",
    "email": "kaan@gmail.com",
    "email_verified_at": null,
    "created_at": "2025-07-18T09:25:50.000000Z",
    "updated_at": "2025-07-18T09:25:50.000000Z"
  },
  "token": "3|hxa0uUb7XUO0b2gh0Aems6D9SkuzbjcUSickVYDpf6a67fc0"
}
```

---

## 🔓 3. Çıkış Yap (Logout)

- **Yöntem:** `POST`
- **URL:** `/logout`
- **Header:** `Authorization: Bearer {TOKEN}`

### ✅ Örnek Yanıt

```json
{
  "message": "Successfully logged out"
}
```

---

## 👤 4. Kullanıcı Bilgisi Getir

- **Yöntem:** `GET`
- **URL:** `/user`
- **Header:** `Authorization: Bearer {TOKEN}`

### ✅ Örnek Yanıt

```json
{
  "id": 1,
  "name": "Kaan",
  "email": "kaan@gmail.com",
  "email_verified_at": null,
  "created_at": "2025-07-18T08:00:00.000000Z",
  "updated_at": "2025-07-18T08:00:00.000000Z"
}
```

---

## 📝 5. Post Oluştur (Create Post)

- **Yöntem:** `POST`
- **URL:** `/posts`
- **Header:** `Authorization: Bearer {TOKEN}`

### 🧾 Body

```json
{
  "title": "Post 1",
  "body": "This is post 1 body."
}
```

### ✅ Örnek Yanıt

```json
{
  "post": {
    "title": "Post 1",
    "body": "This is post 1 body.",
    "user_id": 1,
    "updated_at": "2025-07-18T09:41:18.000000Z",
    "created_at": "2025-07-18T09:41:18.000000Z",
    "id": 2,
    "user": {
      "id": 1,
      "name": "Kaan",
      "email": "kaan@gmail.com",
      "email_verified_at": null,
      "created_at": "2025-07-18T09:25:50.000000Z",
      "updated_at": "2025-07-18T09:25:50.000000Z"
    }
  },
  "user": {
    "id": 1,
    "name": "Kaan",
    "email": "kaan@gmail.com",
    "email_verified_at": null,
    "created_at": "2025-07-18T09:25:50.000000Z",
    "updated_at": "2025-07-18T09:25:50.000000Z"
  }
}
```

---

## 📄 6. Post Detayı Getir (Show Post)

- **Yöntem:** `GET`
- **URL:** `/posts/1`

### ✅ Örnek Yanıt

```json
{
  "id": 1,
  "title": "Post 1",
  "body": "This is post 1 body.",
  "user_id": 1,
  "created_at": "2025-07-18T08:10:00.000000Z",
  "updated_at": "2025-07-18T08:10:00.000000Z"
}
```

---

## ✏️ 7. Post Güncelle (Update Post)

- **Yöntem:** `PUT`
- **URL:** `/posts/1`
- **Header:** `Authorization: Bearer {TOKEN}`

### 🧾 Body

```json
{
  "title": "Post 1 updated",
  "body": "This is post 1 body."
}
```

### ✅ Örnek Yanıt

```json
{
  "id": 1,
  "user_id": 1,
  "title": "Post 1 updated",
  "body": "This is post 1 body.",
  "created_at": "2025-07-18T09:26:59.000000Z",
  "updated_at": "2025-07-18T09:29:26.000000Z"
}
```

---

## ❌ 8. Post Sil (Delete Post)

- **Yöntem:** `DELETE`
- **URL:** `/posts/1`
- **Header:** `Authorization: Bearer {TOKEN}`

### ✅ Örnek Yanıt

```json
{
  "message": "Post deleted successfully"
}
```

---

## ✅ Notlar

- Token'ı her yetkili işlem için `Authorization` başlığına `Bearer {TOKEN}` olarak eklemeyi unutmayın.
- Yerel sunucu çalışıyorsa (`php artisan serve` ile), istekleri `http://127.0.0.1:8000/api/...` adresine yapın.
-

---
