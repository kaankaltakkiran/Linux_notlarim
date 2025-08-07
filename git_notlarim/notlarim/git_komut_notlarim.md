# Yeni Öğrendiğim Git Komutları

## Forklanan Repository Nasıl Güncellenir?

Örneğin aşağıdaki komut ile forklanan repository güncellenir.

```bash
# 1. Orijinal repoyu remote olarak ekle (sadece 1 kez yapılır)
git remote add upstream https://github.com/orijinal/kullanici/proje.git

# 2. Upstream (orijinal) repodan güncellemeleri çek
git fetch upstream

# 3. Kendi main branch'ine orijinal repodaki main branch'i birleştir
git checkout main
git merge upstream/main

# 4. (İsteğe bağlı) Değişiklikleri kendi GitHub fork'una gönder
git push origin main
```

## 🧰 2. **Git stash — kayıtlı değişiklikleri geri getirme**

### 📝 Değişiklikleri stash'e almak

```bash
git stash
```

### 🔄 Stash'teki en son kaydı geri almak (ve silmek):

```bash
git stash pop
```

Bu komut, en son stash'i uygular ve stash listesinden kaldırır.

### 🔍 Stash listesini görüntülemek:

```bash
git stash list
```

Örnek çıktı:

```
stash@{0}: WIP on main: 2a1e4ab düzenleme yapıldı
stash@{1}: WIP on main: önceki düzenleme
```

### 🎯 Belirli bir stash’i geri getirmek (ve silmek):

```bash
git stash pop stash@{1}
```

### 📂 Belirli bir stash’i sadece uygulamak (silmeden):

```bash
git stash apply stash@{0}
```

### ❌ Tüm stash’leri temizlemek:

```bash
git stash clear
```

## `git mv` Komutu Ne İşe Yarar ?

`git mv komutu` Git deposundaki dosyaları ve klasörleri yeniden adlandırmak veya taşımak için kullanılır. Bu sayede dosya boyutunu arttırmamış oluruz.

Aşağıdaki komut `klasor1` adını `klasor2` olarak değiştirir.

```bash
git mv klasor1 klasor2
```

Aşağıdaki komut `README.md ` doyasını `notlarim` adlı klasöre taşır.

```bash
git mv README.md notlarim/
```

## `git revert` Komutu Ne İşe Yarar ?

`git revert` komutu, Git deposundaki bir commit'i geri almak için kullanılır. Bu komut, belirtilen commit'in yaptığı değişiklikleri tersine çevirir ve yeni bir commit oluşturur.

Öncelikle son comitleri listeleyelim:

```bash
git log --oneline
```

> **Note**: en üsteki commit en son yapılan commit'tir.

Geri almak istedğimiz commit'in hash kodunu kopyalayalın ve aşağıdaki komutu kullanarak geri alalım:

```bash
git revert c2e5b7a
```

Son olarak değişiklikleri push edelim:

```bash
git push
```

## Ssh İle Github Repository Nasıl Clone Edilir ?

Örneğin aşağıdaki komut ile ssh ile birlikte clone işlemi yapılır.

```bash
 git clone git@github.com:kaankaltakkiran/Contact-php.git
```

## Git Hard Reset Nedir ve Nasıl Kullanılır?

`Git hard reset`, Git deposundaki değişiklikleri geri almak için kullanılan bir komuttur.

Bu komut, belirli bir commit'e kadar tüm değişiklikleri geri alarak deponuzu o commit'teki duruma geri döndürür.

Aşağıdaki komut mevcut dalınızdaki en son commit'e geri döner

```bash
git reset --hard HEAD
```

> **Note**: `git hard reset` komutu, geri alınan değişiklikleri kalıcı olarak siler. Bu nedenle, bu komutu kullanmadan önce yaptığınız tüm değişikliklerin bir yedeğini aldığınızdan emin olun.
