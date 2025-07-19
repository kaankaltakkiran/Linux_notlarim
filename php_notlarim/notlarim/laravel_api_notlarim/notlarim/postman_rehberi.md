Her bir dosyayı oluşturmak için, her bir kod bloğundaki içeriği kopyalayıp belirtilen dosya adına yapıştırın ve `.sh` uzantısıyla kaydedin. Örneğin, "Not_Oluşturma.sh" için ilk kod bloğunu kullanın.

**Kullanım Talimatları:**

1.  Her bir kod bloğunu ayrı bir `.sh` dosyası olarak kaydedin (örneğin: `Not_Oluşturma.sh`).
2.  Dosyaları çalıştırılabilir yapın: `chmod +x Not_Oluşturma.sh`
3.  Komut dosyasını çalıştırın: `./Not_Oluşturma.sh`

---

### Not Oluşturma (Not_Oluşturma.sh)

```bash
#!/bin/bash
echo "Not Oluşturma isteği gönderiliyor..."
curl --location 'http://127.0.0.1:8000/api/notes' \
--header 'Accept: application/json' \
--header 'Content-Type: application/json' \
--data '{
    "title":"Note 1 başlık",
    "content":"Note 1 içerik"
}'
echo -e "\nİstek tamamlandı."
```

---

### Bir Adet Not Listeleme (Bir_Adet_Not_Listeleme.sh)

```bash
#!/bin/bash
echo "Bir Adet Not Listeleme isteği gönderiliyor..."
curl --location 'http://127.0.0.1:8000/api/notes/1' \
--header 'Accept: application/json'
echo -e "\nİstek tamamlandı."
```

---

### Tüm Notları Listeleme (Tum_Notlari_Listeleme.sh)

```bash
#!/bin/bash
curl --location 'http://127.0.0.1:8000/api/notes' \
--header 'Accept: application/json'
echo -e "\nİstek tamamlandı."
```

---

### Not Güncelleme (Not_Guncelleme.sh)

```bash
#!/bin/bash
echo "Not Güncelleme isteği gönderiliyor..."
curl --location --request PUT 'http://127.0.0.1:8000/api/notes/1' \
--header 'Accept: application/json' \
--header 'Content-Type: application/json' \
--data '{
    "title":"Note 1 başlık güncellendi",
    "content":"Note 1 içerik güncellendi"
}'
echo -e "\nİstek tamamlandı."
```

---

### Not Silme (Not_Silme.sh)

```bash
#!/bin/bash
curl --location --request DELETE 'http://127.0.0.1:8000/api/notes/2' \
--header 'Accept: application/json' \
--data ''
echo -e "\nİstek tamamlandı."
```

> **Note**: 2. yöntem olarak `Note Api.postman_collection.json` dosyasını Postman uygulamasına import ederek de işlemleri gerçekleştirebilirsiniz. Bu dosya, yukarıdaki komutları Postman ortamında çalıştırmak için hazır bir koleksiyon içerir.
