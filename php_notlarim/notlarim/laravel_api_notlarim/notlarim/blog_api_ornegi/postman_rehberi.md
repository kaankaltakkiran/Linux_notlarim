## 📡 API Endpoint'leri

Tüm isteklerde `Accept: application/json` header'ı kullanılmalıdır.

### ➕ Blog Oluştur

```bash
#!/bin/bash
curl --location 'http://127.0.0.1:8000/api/blogs' \
--header 'Accept: application/json' \
--header 'Content-Type: application/json' \
--data '{
    "title":"Blog Başlık 1",
    "description":"Blog Açıklama 1",
    "is_published":0
}'
```

---

#### Örnek Çıktı:

```json
{
  "title": "Blog Başlık 1",
  "description": "Blog Açıklama 1",
  "is_published": 0,
  "updated_at": "2025-07-20T14:04:41.000000Z",
  "created_at": "2025-07-20T14:04:41.000000Z",
  "id": 1
}
```

---

### 📄 Tüm Blogları Listele

```bash
#!/bin/bash
curl --location 'http://127.0.0.1:8000/api/blogs' \
--header 'Accept: application/json'
```

#### Örnek Çıktı:

```json
[
  {
    "id": 1,
    "title": "Blog Başlık 1",
    "description": "Blog Açıklama 1",
    "is_published": 0,
    "published_at": null,
    "deleted_at": null,
    "created_at": "2025-07-20T14:04:41.000000Z",
    "updated_at": "2025-07-20T14:04:41.000000Z"
  },
  {
    "id": 2,
    "title": "Blog Başlık 2",
    "description": "Blog Açıklama 2",
    "is_published": 1,
    "published_at": null,
    "deleted_at": null,
    "created_at": "2025-07-20T14:05:59.000000Z",
    "updated_at": "2025-07-20T14:05:59.000000Z"
  }
]
```

---

### 🔍 Tek Blog Getir

```bash
#!/bin/bash
curl --location 'http://127.0.0.1:8000/api/blogs/2' \
--header 'Accept: application/json'
```

#### Örnek Çıktı:

```json
{
  "id": 2,
  "title": "Blog Başlık 2",
  "description": "Blog Açıklama 2",
  "is_published": 1,
  "published_at": null,
  "deleted_at": null,
  "created_at": "2025-07-20T14:05:59.000000Z",
  "updated_at": "2025-07-20T14:05:59.000000Z"
}
```

---

### ✏️ Blog Güncelle

```bash
#!/bin/bash
curl --location --request PUT 'http://127.0.0.1:8000/api/blogs/1' \
--header 'Accept: application/json' \
--header 'Content-Type: application/json' \
--data '{
    "title":"Blog Başlık 1 Güncellendi",
    "description":"Blog Açıklama 1 Güncellendi",
    "is_published":0
}'
```

#### Örnek Yanıt:

```json
{
  "id": 1,
  "title": "Blog Başlık 1 Güncellendi",
  "description": "Blog Açıklama 1 Güncellendi",
  "is_published": 0,
  "published_at": null,
  "deleted_at": null,
  "created_at": "2025-07-20T14:04:41.000000Z",
  "updated_at": "2025-07-20T14:17:29.000000Z"
}
```

---

### ❌ Blog Sil (Soft Delete)

```bash
#!/bin/bash
curl --location --request DELETE 'http://127.0.0.1:8000/api/blogs/2' \
--header 'Accept: application/json' \
--data ''
```

#### Örnek Yanıt:

```json
{
  "message": "Blog silindi"
}
```

### Üye Ol

```bash
#!/bin/bash
curl --request POST \
  --url http://127.0.0.1:8000/api/register \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{
    "name":"Kaan",
    "email":"kaan@gmail.com",
    "password":"123"
}'
```

#### Örnek Yanıt:

```json
{
  "message": "Kullanıcı başarıyla kaydedildi",
  "user": {
    "name": "Kaan",
    "email": "kaan@gmail.com",
    "updated_at": "2025-07-21T18:18:25.000000Z",
    "created_at": "2025-07-21T18:18:25.000000Z",
    "id": 1
  }
}
```

### Giriş Yap

```bash
#!/bin/bash
curl --request POST \
  --url http://127.0.0.1:8000/api/login \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{
    "email":"kaan@gmail.com",
    "password":"123"
}'
```

#### Örnek Yanıt

```json
{
  "message": "Giriş başarılı",
  "user": {
    "id": 1,
    "name": "Kaan",
    "email": "kaan@gmail.com",
    "email_verified_at": null,
    "created_at": "2025-07-21T18:18:25.000000Z",
    "updated_at": "2025-07-21T18:18:25.000000Z"
  },
  "authorisation": {
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzUzMTIxOTg3LCJleHAiOjE3NTMxMjU1ODcsIm5iZiI6MTc1MzEyMTk4NywianRpIjoiYXE0ZlhNMFRDUnhEODhsaSIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.rJwtHdnjeAcSzxCjPLyVn2Hj9ZBLvvcT08Ha2o0YzjQ",
    "type": "bearer"
  }
}
```

### Profil Bilgilerini Getir

```bash
#!/bin/bash
curl --request GET \
  --url http://127.0.0.1:8000/api/profile \
  --header 'Accept: application/json' \
  --header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzUzMTIxNTQyLCJleHAiOjE3NTMxMjUxNDIsIm5iZiI6MTc1MzEyMTU0MiwianRpIjoiR2pSMGhabUFTWG5VVlFIbyIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.6OpLAeSI8dXdNl3Won1Up3qfoS4YQ4XPZIG7q0FcDgw'
```

### Örnek Yanıt

```json
{
  "id": 1,
  "name": "Kaan",
  "email": "kaan@gmail.com",
  "email_verified_at": null,
  "created_at": "2025-07-21T18:22:37.000000Z",
  "updated_at": "2025-07-21T18:22:37.000000Z"
}
```

### Çıkış Yap

```bash
#!/bin/bash
curl --request POST \
  --url http://127.0.0.1:8000/api/logout \
  --header 'Accept: application/json' \
  --header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzUzMTIyMTYzLCJleHAiOjE3NTMxMjU3NjMsIm5iZiI6MTc1MzEyMjE2MywianRpIjoibEJmME84aGhhcFBpZnc4aSIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.KqZq0z3dbR-cHmszhZKwJP5M4jkSE_whItdcSpxD1LQ'
```

#### Örnek Yanıt

```json
{
  "message": "Çıkış başarılı."
}
```

### Refresh Token

```bash
#!/bin/bash
curl --request POST \
  --url http://127.0.0.1:8000/api/refresh \
  --header 'Accept: application/json' \
  --header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzUzMTIyNDIzLCJleHAiOjE3NTMxMjYwMjMsIm5iZiI6MTc1MzEyMjQyMywianRpIjoiaWQ2OUlGOXRCN1hjSHJScSIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.tRsjnEFjOJM23yDDW7_Tqxoh81pItVzY_2zBCbS5FvY'
```

#### Örnek Yanıt

```json
{
  "message": "Yenileme başarılı",
  "user": {
    "id": 1,
    "name": "Kaan",
    "email": "kaan@gmail.com",
    "email_verified_at": null,
    "created_at": "2025-07-21T18:27:00.000000Z",
    "updated_at": "2025-07-21T18:27:00.000000Z"
  },
  "authorisation": {
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3JlZnJlc2giLCJpYXQiOjE3NTMxMjI0NDUsImV4cCI6MTc1MzEyNjA0NSwibmJmIjoxNzUzMTIyNDQ1LCJqdGkiOiJRU25YeWFlUnVHYlF0N1NlIiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.AqVXjXZENge9iT5-YooqS04zo4wlKLzbYVPCfrY490A",
    "type": "bearer"
  }
}
```

> **Note**: 2. yöntem olarak [Api Dosyasını](https://github.com/kaankaltakkiran/Linux_notlarim/blob/main/php_notlarim/notlarim/laravel_api_notlarim/notlarim/blog_api_ornegi/Blog_jwt_api.postman_collection.json) dosyasını Postman uygulamasına import ederek de işlemleri gerçekleştirebilirsiniz. Bu dosya, yukarıdaki komutları Postman ortamında çalıştırmak için hazır bir koleksiyon içerir.
