# Terraform Notlarım

# 🧱 Terraform Nedir?

**Terraform**, HashiCorp tarafından geliştirilen açık kaynaklı bir **Infrastructure as Code (IaC)** yani **altyapıyı kodla yönetme** aracıdır.

## ✅ Ne işe yarar?

- Sunucuları, ağları, veritabanlarını, dosya depolama alanlarını **kod yazarak** oluşturmanı sağlar.
- Tüm altyapıyı **otomatikleştirir, tekrarlanabilir ve izlenebilir** hale getirir.
- Hatalı tıklamalarla elle işlem yapma derdini ortadan kaldırır.

## 📦 Desteklediği Platformlar:

Terraform birçok sağlayıcıyla çalışır:

- AWS
- Google Cloud Platform (GCP)
- Azure
- Docker
- Kubernetes
- GitHub
- DigitalOcean
- ve daha fazlası...

---

# 🛠️ Terraform Nasıl Çalışır?

Terraform’un temel çalışma adımları:

| Adım                | Açıklama                                        |
| ------------------- | ----------------------------------------------- |
| `terraform init`    | Projeyi başlatır, sağlayıcıları indirir.        |
| `terraform plan`    | Ne olacağını ön izler, değişiklikleri gösterir. |
| `terraform apply`   | Kaynakları oluşturur/günceller/siler.           |
| `terraform destroy` | Tüm tanımlı kaynakları siler.                   |

---

## 📁 Temel Dosyalar

- `main.tf` → Ana yapılandırma dosyası
- `variables.tf` → Değişken tanımları
- `terraform.tfvars` → Değişkenlerin değerleri
- `outputs.tf` → Çıktılar (örneğin oluşturulan bucket’ın URL’si)

---

# ☁️ Terraform ile GCP Üzerinde Bucket Oluşturma

Aşağıda GCP üzerinde bir **Cloud Storage Bucket** oluşturan Terraform yapısı var. Ayrıca **ACL** ayarıyla bucket’a erişim seviyesini kontrol ediyoruz.

---

## 1. GCP Hazırlıkları

1. GCP Console üzerinden bir proje oluştur.
2. Bir **hizmet hesabı (Service Account)** oluştur.
3. Bu hesaba `Storage Admin` yetkisi ver.
4. JSON formatında bir **anahtar (credentials)** indir.
5. Ortam değişkeni olarak ayarla:

```bash
export GOOGLE_APPLICATION_CREDENTIALS="/tam/yol/credentials.json"
```

---

## 2. Terraform Dosyaları

### ✅ `main.tf`

```hcl
provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region
}

resource "google_storage_bucket" "example_bucket" {
  name     = var.bucket_name
  location = "EU"

  uniform_bucket_level_access = false # ACL kullanacağız

  # ACL Ayarı
  predefined_acl = "publicRead" # veya "private", "authenticatedRead"
}
```

### ✅ `variables.tf`

```hcl
variable "credentials_file" {
  type        = string
  description = "Path to GCP credentials JSON file"
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  description = "Region"
  default     = "europe-west1"
}

variable "bucket_name" {
  type        = string
  description = "Unique name for the GCS bucket"
}
```

### ✅ `terraform.tfvars`

```hcl
credentials_file = "/tam/yol/credentials.json"
project_id       = "senin-proje-id"
bucket_name      = "kaan-bucket-terraform-deneme"
```

---

## 3. Komutlar

Proje klasöründe şu komutları çalıştır:

```bash
terraform init      # Terraform ortamını hazırla
terraform plan      # Neler yapılacak, önizle
terraform apply     # Kaynakları uygula (bucket'ı oluşturur)
```

---

## 4. ACL Açıklaması

### `predefined_acl` nedir?

Google Cloud Storage için hazır erişim seviyeleridir. İşte bazıları:

| ACL Değeri          | Açıklama                                                    |
| ------------------- | ----------------------------------------------------------- |
| `private`           | Sadece bucket sahibi erişebilir. (en güvenli)               |
| `publicRead`        | Herkes dosyaları **okuyabilir** ama **yazamaz**.            |
| `publicReadWrite`   | Herkes **okuyabilir ve yazabilir** (tehlikeli!)             |
| `authenticatedRead` | Sadece kimliği doğrulanmış Google kullanıcıları erişebilir. |

```hcl
predefined_acl = "publicRead"
```

Bu satır, oluşturulan bucket’ın herkes tarafından **salt okunabilir (read-only)** olmasını sağlar.

---
