# Gcp Notlarım

## ☁️ GCP (Google Cloud Platform) Nedir?

**GCP**, yani **Google Cloud Platform**, Google'ın sunduğu bir **bulut bilişim hizmetidir**. 2008’den beri aktif olarak geliştirilir ve dünya çapında birçok şirket tarafından kullanılır.

GCP sayesinde, fiziksel donanım almadan:

- Sunucular oluşturabilir,
- Veritabanları barındırabilir,
- Uygulama yayınlayabilir,
- Makine öğrenimi modelleri eğitebilirsin.

---

## 🔑 Temel GCP Hizmetleri

| Hizmet Adı                           | Açıklama                                                               |
| ------------------------------------ | ---------------------------------------------------------------------- |
| **Compute Engine**                   | Sanal makineler (VM) oluşturmak için kullanılır (AWS EC2 gibi).        |
| **App Engine**                       | Kodunu yükle, GCP senin için çalıştırsın (AWS Elastic Beanstalk gibi). |
| **Cloud Functions**                  | Sunucusuz (serverless) fonksiyonlar. Otomasyon ve küçük işler için.    |
| **Cloud Run**                        | Container (Docker) tabanlı uygulamaları çalıştırır.                    |
| **Cloud Storage**                    | Dosya ve veri depolama (AWS S3 benzeri).                               |
| **Cloud SQL / Firestore / BigQuery** | Veritabanı hizmetleri. (MySQL/PostgreSQL, NoSQL, veri analizi vs.)     |
| **IAM & Admin**                      | Kimlik ve erişim yönetimi. Kimin neye erişebileceğini kontrol eder.    |
| **VPC (Virtual Private Cloud)**      | Sanal ağlar kurma, güvenlik duvarı ayarları yapma.                     |

---

## 🧠 GCP'nin Avantajları

- Google altyapısında çalışır (YouTube, Gmail gibi yüksek ölçekli sistemlerle aynı platform).
- Gelişmiş yapay zeka ve büyük veri araçları.
- Kolay arayüz ve detaylı dökümantasyon.
- Terraform ile tamamen **otomatikleştirilebilir**.

---

## 📌 GCP Kullanımı için Gerekenler

1. Google hesabın olmalı.
2. [GCP Console](https://console.cloud.google.com/) üzerinden bir **proje (project)** oluşturmalısın.
3. Bu projeye ait bir **service account** (hizmet hesabı) oluşturup **JSON formatında anahtar** indirerek Terraform’a bağlayabilirsin.
4. Her işlem için **faturalama (billing)** açık olmalı (bazı hizmetler ücretsiz seviyede sunulur).

---

## 💬 GCP & Terraform Neden Birlikte Kullanılır?

Manuel olarak GCP konsolundan VM veya bucket oluşturmak zaman alır ve hataya açıktır.
Terraform ile:

- Tüm altyapını kodla tanımlarsın.
- Versiyon kontrolüne alırsın (ör. Git).
- Tek komutla tüm sistemi kurarsın.
- Hangi kaynakların değiştiğini kolayca takip edersin.

---
