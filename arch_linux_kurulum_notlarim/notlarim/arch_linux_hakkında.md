# Arch Linux(Garuda Linux) Hakkında Bilgiler

### **Garuda Linux ve Arch Linux Hakkında**

#### **Garuda Linux:**

- **Arch Linux** tabanlı bir dağıtım.
- **Kullanıcı dostu**, modern bir görünüm ve performans optimizasyonları sunar.
- **BTRFS** dosya sistemi ve **zstd sıkıştırma** varsayılan olarak gelir.
- **KDE Dragonized**, GNOME, XFCE gibi birçok masaüstü ortamı seçenekleri mevcut.
- **Garuda Assistant** gibi kullanıcı dostu araçlar içerir.

#### **Arch Linux:**

- **Minimal ve sade** bir Linux dağıtımı.
- Kendi sisteminizi sıfırdan inşa etmek isteyen kullanıcılar için ideal.
- **Pacman** adlı bir paket yöneticisi kullanır.
- Güncel ve **Rolling Release** modeline sahiptir, yani sürekli güncellenir.

---

### **Paket Yöneticisi: Pacman**

Arch Linux ve türevlerinde paket yönetimi için **Pacman** kullanılır.

#### **Pacman Komutları**

| Komut                            | Açıklama                                                               |
| -------------------------------- | ---------------------------------------------------------------------- |
| `sudo pacman -S <paket_adı>`     | Belirtilen paketi yükler.                                              |
| `sudo pacman -R <paket_adı>`     | Belirtilen paketi kaldırır.                                            |
| `sudo pacman -Rs <paket_adı>`    | Paketi ve onun artık kullanılmayan bağımlılıklarını kaldırır.          |
| `sudo pacman -Syu`               | Sistemi ve tüm paketleri günceller.                                    |
| `sudo pacman -Ss <arama>`        | Depolarda belirtilen terimi arar.                                      |
| `sudo pacman -Qi <paket_adı>`    | Yüklü bir paketin bilgilerini gösterir.                                |
| `sudo pacman -U <paket_dosyası>` | Yerel bir dosya olarak indirilen bir paketi yükler.                    |
| `sudo pacman -Rns <paket_adı>`   | Paketi, bağımlılıklarını ve yapılandırma dosyalarını tamamen kaldırır. |

---

### **Arch User Repository (AUR)**

#### **AUR Nedir?**

- Arch topluluğu tarafından sağlanan bir yazılım deposudur.
- **Pacman**'in resmi depolarında bulunmayan yazılımları içerir.
- **Yay** gibi yardımcı araçlarla kolayca kullanılabilir.

#### **AUR Yardımcıları (Örnek: yay)**

**Yay** popüler bir AUR yardımcısıdır. AUR'dan paketleri indirip kurmayı kolaylaştırır.

##### **Yay Kurulumu:**

```bash
sudo pacman -S git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

##### **Yay Komutları:**

| Komut                | Açıklama                                       |
| -------------------- | ---------------------------------------------- |
| `yay -S <paket_adı>` | Belirtilen paketi AUR'dan yükler.              |
| `yay -R <paket_adı>` | Belirtilen paketi kaldırır.                    |
| `yay -Ss <arama>`    | AUR'da bir terim arar.                         |
| `yay -Syu`           | Sistemi (hem resmi depolar hem AUR) günceller. |

---

### **Örnekler**

1. **VLC Kurulumu:**

   ```bash
   sudo pacman -S vlc --noconfirm
   ```

   **Note**: `--noconfirm` ile onay sormadan kurar.

2. **Google Chrome (AUR üzerinden) Kurulumu:**

   ```bash
   yay -S google-chrome --noconfirm
   ```

3. **Bir Paketi ve Bağımlılıklarını Kaldırma:**

   ```bash
   sudo pacman -Rns vlc
   ```

4. **Paket Bilgisi Görüntüleme:**
   ```bash
   sudo pacman -Qi vlc
   ```

---

### **Ek İpuçları**

- **Sistem temizliği:**
  Kullanılmayan önbellek dosyalarını temizlemek için:

  ```bash
  sudo pacman -Sc
  ```

- **Depoları güncelleme:**
  Depo bilgilerinin güncellenmesi için:
  ```bash
  sudo pacman -Sy
  ```

Bu bilgilerle hem Arch Linux hem de Garuda Linux üzerinde paket yönetimini kolayca gerçekleştirebilirsin. Daha fazla bilgi için Arch Wiki'yi ziyaret edebilirsin: [Arch Wiki](https://wiki.archlinux.org).
