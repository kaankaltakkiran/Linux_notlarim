# Dns Notlarım

## Dns Nedir ?

Alan adlarını gerçek web sunucularına bağlayarak İnternet üzerindeki trafiğin yönlendirilmesine yardımcı olan `DNS,` web tarayıcısına girilen URL’yi o web sitesinin verilerinin depolandığı sunucunun `IP adresine` bağlamaya çalışır.

## DNS Kayıt Tipleri ve Anlamları

### 1. **A Kaydı (Address Record)**

- Alan adını bir IP adresine yönlendirir.
- Örnek: `example.com` alan adını `192.168.1.1` IP adresine bağlar.
- Kullanım: Web sitesine erişim için.

---

### 2. **MX Kaydı (Mail Exchange Record)**

- Alan adının e-posta sunucusunu belirtir.
- Örnek: `mail.example.com` adresini gösterir.
- Kullanım: E-postaların doğru sunucuya yönlendirilmesi için.

---

### 3. **CNAME Kaydı (Canonical Name Record)**

- Bir alan adını başka bir alan adına yönlendirir.
- Örnek: `www.example.com`, `example.com` adresine yönlenir.
- Kullanım: Alt alan adlarını yönetmek için.

---

### 4. **TXT Kaydı (Text Record)**

- Alan adıyla ilgili açıklayıcı metin bilgilerini tutar.
- Örnek: SPF, DKIM gibi e-posta doğrulama kayıtları.
- Kullanım: Doğrulama ve güvenlik ayarları için.

---

### 5. **NS Kaydı (Name Server Record)**

- Alan adının hangi DNS sunucularına yönlendirileceğini belirtir.
- Örnek: `ns1.example.com`, `ns2.example.com`.
- Kullanım: DNS yönetimi için.

---

### 6. **PTR Kaydı (Pointer Record)**

- Bir IP adresini alan adına yönlendirir.
- Örnek: Ters DNS sorgularında kullanılır.
- Kullanım: E-posta sunucularının kimlik doğrulamasında.

---

### 7. **SOA Kaydı (Start of Authority)**

- DNS bölgesinin temel bilgilerini içerir.
- Örnek: Seri numarası, TTL, ve DNS yöneticisi e-postası.
- Kullanım: DNS bölgesinin başlangıç noktası bilgisi için.

---

### 8. **SRV Kaydı (Service Record)**

- Belirli bir servisin yerini ve portunu belirtir.
- Örnek: VoIP veya mesajlaşma servisleri.
- Kullanım: Hizmetlerin adres ve portlarını belirtmek için.

---

### 9. **AAAA Kaydı (IPv6 Address Record)**

- Alan adını bir IPv6 adresine yönlendirir.
- Örnek: `example.com` alan adını `2001:db8::1` IPv6 adresine bağlar.
- Kullanım: IPv6 adresleme için.

### DNS Kayıt Tipleri Tablosu

| **Kayıt Tipi** | **Açıklama**                                 | **Kullanım Alanı**             |
| -------------- | -------------------------------------------- | ------------------------------ |
| **A**          | Alan adını bir IPv4 adresine yönlendirir.    | Web sitesi erişimi.            |
| **MX**         | E-posta sunucusunu belirtir.                 | E-posta yönlendirme.           |
| **CNAME**      | Alan adını başka bir alan adına yönlendirir. | Alt alan adı yönetimi.         |
| **TXT**        | Metin tabanlı bilgiler içerir.               | Doğrulama ve güvenlik.         |
| **NS**         | DNS sunucularını belirtir.                   | DNS yönetimi.                  |
| **PTR**        | IP adresini alan adına yönlendirir.          | Ters DNS ve kimlik doğrulama.  |
| **SOA**        | DNS bölgesi temel bilgilerini içerir.        | DNS başlangıç noktası bilgisi. |
| **SRV**        | Servis adresi ve port bilgilerini içerir.    | Hizmet konfigürasyonu.         |
| **AAAA**       | Alan adını bir IPv6 adresine yönlendirir.    | IPv6 adresleme.                |
