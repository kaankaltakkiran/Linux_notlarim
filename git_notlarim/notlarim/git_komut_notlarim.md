# Yeni Öğrendiğim Git Komutları

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
