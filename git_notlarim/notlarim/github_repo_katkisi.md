# 🚀 GitHub Açık Kaynak Projeye Katkı Rehberi

Bu rehber, GitHub üzerinde yer alan açık kaynak (public) projelere nasıl katkı sunabileceğinizi adım adım açıklamaktadır. İki temel yöntemle katkı yapılır:

- 🎯 **Issue Açmak:** Hata, öneri ya da soru bildiriminde bulunmak.
- 🛠️ **Pull Request (PR) Göndermek:** Kod değişikliği önerisi sunmak.

---

## 🐞 1. Issue Açma (Hata veya Öneri Bildirimi)

### ✏️ Adımlar:

1. Proje sayfasına girin. Örn: `https://github.com/owner/proje-adi`
2. Menüde **Issues** sekmesine tıklayın.
3. Sağ üstte **"New issue"** butonuna basın.
4. Aşağıdaki alanları doldurun:
   - **Title (Başlık):** Kısa ve net bir özet.
   - **Description (Açıklama):**
     - Sorunun detayları
     - Beklenen davranış
     - (Varsa) ekran görüntüsü, log çıktısı, sistem bilgisi vb.
5. Etiket eklemek istersen (`bug`, `enhancement`, `question`), seçebilirsin.
6. **Submit new issue** ile yayınla.

---

## 🔀 2. Pull Request Gönderme (Kodla Katkı Sunma)

Kod düzeltmesi veya yeni özellik eklemek istiyorsan aşağıdaki adımları takip et.

### 🧾 Gereklilikler:

- GitHub hesabı
- Git kurulu bilgisayar

---

### 2.1. Reponun Fork’unu Oluştur

```bash
# GitHub'da projenin sayfasına git
# Sağ üstteki "Fork" butonuna tıkla
```

---

### 2.2. Forkladığın Reponun Kopyasını Bilgisayara Klonla

```bash
git clone https://github.com/kendi-kullanici-adi/proje-adi.git
cd proje-adi
```

---

### 2.3. Yeni Bir Branch Oluştur

```bash
git checkout -b fix/duzeltme-adim
```

> ⚠️ Branch ismini açıklayıcı tut: `fix/`, `feature/`, `docs/` gibi.

---

### 2.4. Gerekli Kod Düzenlemesini Yap

Kod editörünle proje dosyasında düzenleme yap.

---

### 2.5. Değişiklikleri Commit Et

```bash
git add .
git commit -m "Typo düzeltildi: 'Welcomme' yerine 'Welcome'"
```

---

### 2.6. Değişiklikleri Kendi Fork’una Push Et

```bash
git push origin fix/duzeltme-adim
```

---

### 2.7. Pull Request Aç

1. GitHub’da kendi fork’ladığın repo sayfasına git.
2. **"Compare & pull request"** butonuna tıkla.
3. Açıklayıcı bir başlık ve açıklama gir:

   - Neyi düzelttin/geliştirdin?
   - Neden gerekliydi?
   - İlgili issue varsa `Fixes #issue-no` şeklinde belirt.

4. **"Create pull request"** butonuna tıkla.

---
