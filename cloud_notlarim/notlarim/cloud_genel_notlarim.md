# Cloud Genel Notlarım

Elbette! İşte **IaaS**, **PaaS**, **SaaS** ve **Terraform** kavramlarını genel hatlarıyla açıklayan ve örneklerle destekleyen bir anlatım:

---

## ☁️ IaaS, PaaS ve SaaS Nedir?

Bu üç kavram, **bulut bilişim hizmet modellerini** tanımlar. Her biri farklı seviyelerde kontrol ve sorumluluk sunar:

### 1. **IaaS (Infrastructure as a Service) – Altyapı Hizmeti**

Kullanıcılara **sunucu, depolama, ağ ve işletim sistemi** gibi altyapılar sunulur. Fiziksel donanım almanıza gerek kalmaz. Sanal makineler ile çalışırsınız.

- **Kimin için uygun?** Sistem yöneticileri, DevOps ekipleri
- **Kullanıcının sorumluluğu:** Uygulama, veritabanı, yazılım güncellemeleri

**Örnekler:**

- Amazon EC2 (AWS)
- Microsoft Azure VM
- Google Compute Engine

> 🎯 Örnek senaryo: Web sitenizi barındırmak için bir sanal sunucu kiraladınız. Üzerine istediğiniz işletim sistemini kurup yapılandırabilirsiniz.

---

### 2. **PaaS (Platform as a Service) – Platform Hizmeti**

Uygulama geliştirme, test etme ve dağıtma için **hazır altyapı + geliştirme platformları** sunar. Sunucu ve işletim sistemiyle uğraşmanıza gerek kalmaz.

- **Kimin için uygun?** Yazılım geliştiriciler
- **Kullanıcının sorumluluğu:** Sadece uygulamanın kendisi

**Örnekler:**

- Google App Engine
- Heroku
- AWS Elastic Beanstalk

> 🎯 Örnek senaryo: Bir Node.js uygulamanız var. Heroku’ya kodunuzu gönderiyorsunuz, o sizin için barındırıyor ve çalıştırıyor. Sunucu kurmanıza gerek yok.

---

### 3. **SaaS (Software as a Service) – Yazılım Hizmeti**

Son kullanıcıya doğrudan **kullanıma hazır yazılım** hizmeti sunar. Kullanıcı sadece uygulamayı kullanır, altyapı veya geliştirme ile ilgilenmez.

- **Kimin için uygun?** Son kullanıcılar
- **Kullanıcının sorumluluğu:** Sadece yazılımı kullanmak

**Örnekler:**

- Gmail
- Google Docs
- Dropbox
- Zoom

> 🎯 Örnek senaryo: Google Docs kullanarak belge düzenliyorsunuz. Sunucu, yazılım kurulumu, güncelleme derdi yok.

---
