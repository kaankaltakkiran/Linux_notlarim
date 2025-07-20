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

> **Note**: 2. yöntem olarak `Blog Api.postman_collection.json` dosyasını Postman uygulamasına import ederek de işlemleri gerçekleştirebilirsiniz. Bu dosya, yukarıdaki komutları Postman ortamında çalıştırmak için hazır bir koleksiyon içerir.
