# Yunohost Notlarım

## Serverdan bir dosya nasıl indirilir ?

#### 🚀 Adım 1: Yedek dosyasının adını öğren

Web arayüzünden veya terminalden hangi yedeği indirmek istediğini öğren.

Terminalden görmek istersen:

```bash
ls /home/yunohost.backup/archives/
```

Örneğin şu şekilde bir dosya göreceksin:

```
20250801-123456.tar.gz
```

#### 💻 Adım 2: SCP ile bilgisayara indir (Tavsiye edilen yöntem)

Bilgisayarın Linux/macOS ise terminalden, Windows’ta ise PowerShell veya WSL kullanabilirsin:

```bash
scp root@VDS_IP:/home/yunohost.backup/archives/20250801-123456.tar.gz .
```

> Not:
>
> - `root@VDS_IP` yerine sunucunun IP adresini yaz (örnek: `root@123.45.67.89`)
> - Sonundaki `.` işareti, dosyanın şu anki klasöre indirileceğini belirtir.
