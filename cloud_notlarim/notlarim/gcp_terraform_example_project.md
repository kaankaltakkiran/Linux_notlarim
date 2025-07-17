# 🌐 Proje: GCP'de Terraform ile Sanal Makine (VM) Oluşturmak

Bu Terraform uygulaması, Google Cloud Platform (GCP) üzerinde otomatik olarak bir sanal makine (VM) oluşturmanı sağlar.

---

## 🔧 Gereksinimler

1. **Google Cloud hesabı**
2. **Terraform** kurulu
3. **Bir GCP Projesi oluşturulmuş ve faturalandırma etkinleştirilmiş**

---

## 🪜 Adım Adım Yapılacaklar

---

### 1️⃣ Google Cloud’da bir proje oluştur

Google Cloud Console’a gidip yeni bir proje oluştur. (örn. `terraform-demo-project`)

---

### 2️⃣ Service Account ve yetkiler

Terminalde aşağıdaki komutla yetkili bir **Service Account** oluştur:

```bash
gcloud iam service-accounts create terraform-sa \
  --display-name "Terraform Service Account"
```

Yetkiler ver:

```bash
gcloud projects add-iam-policy-binding YOUR_PROJECT_ID \
  --member="serviceAccount:terraform-sa@YOUR_PROJECT_ID.iam.gserviceaccount.com" \
  --role="roles/editor"
```

Anahtar dosyasını indir:

```bash
gcloud iam service-accounts keys create key.json \
  --iam-account=terraform-sa@YOUR_PROJECT_ID.iam.gserviceaccount.com
```

> Bu `key.json`, Terraform’un GCP’ye erişmesini sağlayacak.

---

### 3️⃣ Terraform dizin yapısını oluştur

```bash
mkdir terraform-gcp-vm
cd terraform-gcp-vm
touch main.tf variables.tf outputs.tf
```

---

### 4️⃣ `main.tf` içeriği

```hcl
# main.tf

provider "google" {
  credentials = file("key.json")       # GCP erişimi için servis hesabı
  project     = var.project_id         # GCP proje ID’si
  region      = var.region             # Varsayılan bölge
  zone        = var.zone               # Varsayılan zone
}

resource "google_compute_instance" "default" {
  name         = "demo-vm"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"   # Debian OS yüklü disk
    }
  }

  network_interface {
    network = "default"
    access_config {}                    # Harici IP almasını sağlar
  }

  tags = ["web"]
}
```

📌 **main.tf ne yapar ?**

- `provider`: GCP bilgilerini ve bölgeyi ayarlıyor.
- `google_compute_instance`: Sanal makineyi oluşturur.
- `boot_disk`: İşletim sistemi (Debian) ile birlikte diski hazırlar.
- `network_interface`: Ağa bağlanması için gerekli yapılandırma.
- `access_config`: Harici IP verilmesini sağlar.

---

### 5️⃣ `variables.tf` içeriği

```hcl
# variables.tf

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  default     = "us-central1"
}

variable "zone" {
  description = "GCP Zone"
  default     = "us-central1-a"
}
```

> **Note**:`GCP Project ID` indirilen credentials dosyasındaki proje ID ile aynı olmalı.

📌 **varable.tf ne yapar?**

- Bu dosya, `main.tf`'de kullandığımız değişkenleri tanımlar.
- Böylece kod daha dinamik ve esnek olur.

---

### 6️⃣ `outputs.tf` içeriği

```hcl
# outputs.tf

output "instance_ip" {
  description = "VM Public IP"
  value       = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}
```

📌 **outputs.tf ne iş yapar?**

- Sanal makinenin dış IP adresini çıktı olarak verir.

---

### 7️⃣ `terraform.tfvars` dosyası (İsteğe bağlı)

```hcl
project_id = "senin-gcp-proje-id"
```

> Bu dosya yoksa Terraform seni `project_id` için interaktif olarak sorar.

---

### Olası Hata Çözümleri

- `GCP Compute Engine servisini` [etkinleştirmeyi](https://console.cloud.google.com/apis/api/compute.googleapis.com/overview?project=premium-apex-446023-j0&inv=1&invt=Ab2_qw) unutma.

### 8️⃣ Terraform Komutları

#### ✅ Başlat

```bash
terraform init
```

> Gerekli sağlayıcıları (provider) indirir ve hazırlar.

#### 🔍 Planla

```bash
terraform plan
```

> Hangi kaynakların ne şekilde oluşturulacağını gösterir. Henüz uygulamaz.

#### 🚀 Uygula

```bash
terraform apply
```

> Onay verirsen (yes yaz), tüm altyapıyı GCP üzerinde oluşturur.

#### 🧽 Temizle

```bash
terraform destroy
```

> Tüm oluşturulan kaynakları siler.

---

#### Son Adım

Her şey sorunsuzsa, aşağıdaki gibi bir çıktı alacaksın:

```bash
Outputs:
instance_ip = "35.123.456.789"
```

1.Test yöntemi: İp yi test etmek için ping atabilirsin fakat çalışmayabilir çünkü firewall kuralları henüz ayarlanmadı:

```bash
ping 35.123.456.789
```

2.Test yöntemi: GCP Console üzerinden VM'ye SSH ile bağlanabilirsin.

`GCP Console → Compute Engine → VM Instances → Open in browser window`

## 🧠 Özet

| Dosya              | Ne işe yarar?                             |
| ------------------ | ----------------------------------------- |
| `main.tf`          | Kaynakları tanımlar                       |
| `variables.tf`     | Değişkenleri tanımlar                     |
| `outputs.tf`       | Oluşturulan kaynakların çıktılarını verir |
| `terraform.tfvars` | Değişkenlere değer atar (opsiyonel)       |
| `key.json`         | GCP’ye bağlanmak için servis hesabı       |

---
