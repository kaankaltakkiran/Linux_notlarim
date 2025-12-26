# Zapret DPI Notlarım

Açık kaynaklı bir DPI engelini aşma aracıdır (Deep Packet Inspection bypass).
GitHub

Temel amacı, internet servis sağlayıcınızın (ISP) veya devlet DPI sistemlerinin içerik filtrelemesini atlatmak için paketleri değiştirip “okunamaz / yanlış anlaşılır” hale getirerek DPI engellerini zorlaştırmaktır.

---

description: Install Zapret to bypass DPI barriers.
icon: lock-keyhole-open

---

## 1. Install required tools

Required tools for installation.

```shell
# Debian, Ubuntu, Kali, Linux Mint (APT)
sudo apt install -y curl dnsutils unzip nftables

# Red Hat, CentOS, Fedora, AlmaLinux, Rocky (DNF / YUM)
sudo dnf install -y curl bind-utils unzip nftables
sudo yum install -y curl bind-utils unzip nftables

# OpenSUSE (Zypper)
sudo zypper -n install curl bind-utils unzip nftables

# Arch, Manjaro (Pacman)
sudo pacman -S --noconfirm curl bind-tools unzip nftables
```

## 2. Change DNS rules

### Dns Settings

---

description: Encrypt your DNS queries with Systemd-Resolved.
icon: notebook

---

## ALTERNATIVE: Cloudflare DNS (Recommended)

We are using Cloudflare DNS here.

```shell
# Enable and start Systemd-Resolved
sudo systemctl enable systemd-resolved
sudo systemctl start systemd-resolved

# Rewrite the /etc/systemd/resolved.conf file and specify that we will use Cloudflare DNS in it
sudo tee /etc/systemd/resolved.conf > /dev/null << EOF
[Resolve]
DNS=1.1.1.1 1.0.0.1 2606:4700:4700::1111 2606:4700:4700::1001
DNSOverTLS=yes
EOF

# Make /etc/resolv.conf a symlink to Systemd-Resolved file
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# Restart Systemd-Resolved for the changes to take effect
sudo systemctl restart systemd-resolved
```

## ALTERNATIVE: Google DNS

We are using Google DNS here.

```shell
# Enable and start Systemd-Resolved
sudo systemctl enable systemd-resolved
sudo systemctl start systemd-resolved

# Rewrite the /etc/systemd/resolved.conf file and specify that we will use Google DNS in it
sudo tee /etc/systemd/resolved.conf > /dev/null << EOF
[Resolve]
DNS=8.8.8.8 8.8.4.4 2001:4860:4860::8888 2001:4860:4860::8844
DNSOverTLS=yes
EOF

# Make /etc/resolv.conf a symlink to Systemd-Resolved file
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# Restart Systemd-Resolved for the changes to take effect
sudo systemctl restart systemd-resolved
```

## ALTERNATIVE: Yandex DNS

We are using Yandex DNS here.

```shell
# Enable and start Systemd-Resolved
sudo systemctl enable systemd-resolved
sudo systemctl start systemd-resolved

# Rewrite the /etc/systemd/resolved.conf file and specify that we will use Yandex DNS in it
sudo tee /etc/systemd/resolved.conf > /dev/null << EOF
[Resolve]
DNS=77.88.8.8 77.88.8.1 2a02:6b8::feed:0ff 2a02:6b8:0:1::feed:0ff
DNSOverTLS=yes
EOF

# Make /etc/resolv.conf a symlink to Systemd-Resolved file
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# Restart Systemd-Resolved for the changes to take effect
sudo systemctl restart systemd-resolved
```

## ALTERNATIVE: Quad9

We are using Quad9 here.

```shell
# Enable and start Systemd-Resolved
sudo systemctl enable systemd-resolved
sudo systemctl start systemd-resolved

# Rewrite the /etc/systemd/resolved.conf file and specify that we will use Quad9 in it
sudo tee /etc/systemd/resolved.conf > /dev/null << EOF
[Resolve]
DNS=9.9.9.9 149.112.112.112 2620:fe::fe 2620:fe::9
DNSOverTLS=yes
EOF

# Make /etc/resolv.conf a symlink to Systemd-Resolved file
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# Restart Systemd-Resolved for the changes to take effect
sudo systemctl restart systemd-resolved
```

## TIP: Remove DNS settings

If you want to remove the DNS settings, you can do the following.

```shell
# Enable and start Systemd-Resolved
sudo systemctl enable systemd-resolved
sudo systemctl start systemd-resolved

# Leave the Systemd-Resolved configuration blank
sudo tee /etc/systemd/resolved.conf > /dev/null <<< ""

# Make /etc/resolv.conf a symlink to Systemd-Resolved file
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# Restart Systemd-Resolved for the changes to take effect
sudo systemctl restart systemd-resolved
```

Zapret only bypasses DPI restrictions. But it does not set up a DNS for us. We need to do that ourselves.

We've used Yandex DNS here with Russian users in mind. However, other provider alternatives are also available if you prefer.

- [Cloudflare DNS](https://keift.gitbook.io/blog/linux/dot-with-systemd-resolved#alternative-cloudflare-dns-recommended)
- [Google DNS](https://keift.gitbook.io/blog/linux/dot-with-systemd-resolved#alternative-google-dns)
- [Yandex DNS](https://keift.gitbook.io/blog/linux/dot-with-systemd-resolved#alternative-yandex-dns)
- [Quad9](https://keift.gitbook.io/blog/linux/dot-with-systemd-resolved#alternative-quad9)

If your distribution does not include Systemd, you will need to do this using [Stubby](https://keift.gitbook.io/blog/linux/install-stubby).

```shell
# Enable and start Systemd-Resolved
sudo systemctl enable systemd-resolved
sudo systemctl start systemd-resolved

# Rewrite the /etc/systemd/resolved.conf file and specify that we will use Yandex DNS in it
sudo tee /etc/systemd/resolved.conf > /dev/null << EOF
[Resolve]
DNS=77.88.8.8 77.88.8.1 2a02:6b8::feed:0ff 2a02:6b8:0:1::feed:0ff
DNSOverTLS=yes
EOF

# Make /etc/resolv.conf a symlink to Systemd-Resolved file
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# Restart Systemd-Resolved for the changes to take effect
sudo systemctl restart systemd-resolved
```

## 3. Download Zapret

Download the compiled zip file as release on GitHub.

```shell
# Delete if present
sudo rm -rf ~/zapret-v72.2.zip
sudo rm -rf ~/zapret-v72.2

# Go to the home directory
cd ~/

# Download the compiled zip file from GitHub
sudo wget https://github.com/bol-van/zapret/releases/download/v72.2/zapret-v72.2.zip
```

## 4. Unzip the zip file

Extract the zip file and then delete it.

```shell
# Unzip the zip file
sudo unzip ~/zapret-v72.2.zip

# Delete the zip file that we no longer need
sudo rm -rf ~/zapret-v72.2.zip
```

## 5. Prepare for installation

Install the requirements and prepare to perform a clean install.

```shell
# For a clean installation, remove any installation files that may be present in case an installation has been made before
sudo ~/zapret-v72.2/uninstall_easy.sh
sudo /opt/zapret/uninstall_easy.sh
sudo rm -rf /opt/zapret

# Install requirements
sudo ~/zapret-v72.2/install_prereq.sh
sudo ~/zapret-v72.2/install_bin.sh
```

Here are the answers you need to give to the questions you may encounter during this time.

```
select firewall type :
1 : iptables
2 : nftables
your choice (default : nftables) : 🟩 [LEAVE THIS QUESTION BLANK] 🟩
```

## 6. Do Blockcheck

Find the DPI methods implemented by the ISP.

```shell
# Run the test
sudo ~/zapret-v72.2/blockcheck.sh
```

Here are the answers you need to give to the questions you may encounter during this time.

```
specify domain(s) to test. multiple domains are space separated.
domain(s) (default: rutracker.org) : 🟥 [ENTER A WEBSITE DOMAIN NAME BLOCKED IN YOUR COUNTRY HERE - EXAMPLE: discord.com] 🟥
```

```
ip protocol version(s) - 4, 6 or 46 for both (default: 4) : 🟩 [LEAVE THIS QUESTION BLANK] 🟩
```

```
check http (default : Y) (Y/N) ? 🟩 [LEAVE THIS QUESTION BLANK] 🟩
```

```
check https tls 1.2 (default : Y) (Y/N) ? 🟩 [LEAVE THIS QUESTION BLANK] 🟩
```

```
check https tls 1.3 (default : N) (Y/N) ? 🟩 [LEAVE THIS QUESTION BLANK] 🟩
```

```
how many times to repeat each test (default: 1) : 🟩 [LEAVE THIS QUESTION BLANK] 🟩
```

```
quick - scan as fast as possible to reveal any working strategy
standard - do investigation what works on your DPI
force - scan maximum despite of result
1 : quick
2 : standard
3 : force
your choice (default : standard) : 🟩 [LEAVE THIS QUESTION BLANK] 🟩
```

Wait for the test to finish. This may take a few minutes.

After the process is finished, the test results will appear.

Copy the latest setting from these results. Example:

```
curl_test_https_tls12 ipv4 discord.com : nfqws --dpi-desync=fakeddisorder --dpi-desync-ttl=1 --dpi-desync-autottl=-5 --dpi-desync-split-pos=1
                                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                                                                                     MAKE A NOTE FOR IT
```

This is an example settings for **NFQWS**. It may be different for each person. Make a note of it.

```shell
--dpi-desync=fakeddisorder --dpi-desync-ttl=1 --dpi-desync-autottl=-5 --dpi-desync-split-pos=1
```

## 7. Install Zapret

We can start installing Zapret.

```shell
# Start the installation
sudo ~/zapret-v72.2/install_easy.sh
```

Here are the answers you need to give to the questions you may encounter during this time.

```
do you want the installer to copy it for you (default : N) (Y/N) ? 🟥 [TYPE "Y"] 🟥
```

```
select firewall type :
1 : iptables
2 : nftables
your choice (default : nftables) : 🟩 [LEAVE THIS QUESTION BLANK] 🟩
```

```
enable ipv6 support (default : N) (Y/N) ? 🟩 [LEAVE THIS QUESTION BLANK] 🟩
```

```
select flow offloading :
1 : none
2 : software
3 : hardware
your choice (default : none) : 🟩 [LEAVE THIS QUESTION BLANK] 🟩
```

```
select filtering :
1 : none
2 : ipset
3 : hostlist
4 : autohostlist
your choice (default : none) : 🟩 [LEAVE THIS QUESTION BLANK] 🟩
```

```
enable tpws socks mode on port 987 ? (default : N) (Y/N) ? 🟩 [LEAVE THIS QUESTION BLANK] 🟩
```

```
enable tpws transparent mode ? (default : N) (Y/N) ? 🟩 [LEAVE THIS QUESTION BLANK] 🟩
```

```
enable nfqws ? (default : N) (Y/N) ? 🟥 [TYPE "Y"] 🟥
```

```
do you want to edit the options (default : N) (Y/N) ? 🟥 [TYPE "Y"] 🟥
```

Then we write the **NFQWS** settings that we just copied to `NFQWS_OPT`. Example:

```ini
NFQWS_PORTS_TCP=80,443
NFQWS_PORTS_UDP=443
NFQWS_TCP_PKT_OUT=9
NFQWS_TCP_PKT_IN=3
NFQWS_UDP_PKT_OUT=9
NFQWS_UDP_PKT_IN=0
NFQWS_PORTS_TCP_KEEPALIVE=
NFQWS_PORTS_UDP_KEEPALIVE=
NFQWS_OPT="--dpi-desync=fakeddisorder --dpi-desync-ttl=1 --dpi-desync-autottl=-5 --dpi-desync-split-pos=1"
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                                                YOUR SETTINGS HERE
```

Then save with **CTRL + S** and close with **CTRL + X**.

Let's continue with the questions.

```
do you want to edit the options (default : N) (Y/N) ? 🟩 [LEAVE THIS QUESTION BLANK] 🟩
```

```
LAN interface :
1 : NONE
2 : lo
3 : wlp0s20f3
your choice (default : NONE) : 🟩 [LEAVE THIS QUESTION BLANK] 🟩
```

```
WAN interface :
1 : ANY
2 : lo
3 : wlp0s20f3
your choice (default : ANY) : 🟩 [LEAVE THIS QUESTION BLANK] 🟩
```

## 8. Finish the installation

All done! 🎉 We are done with this folder of Zapret anymore. We can delete it.

```shell
# Delete the folder
sudo rm -rf ~/zapret-v72.2
```

## TIP: Uninstall Zapret

If you ever regain your freedom, you can undo all of these actions in the following way.

```shell
# Uninstall Zapret
sudo /opt/zapret/uninstall_easy.sh

# Remove unused files
sudo rm -rf ~/zapret-v72.2
sudo rm -rf /opt/zapret
```

## TIP: Remove DNS settings

If you want to remove the DNS settings, you can do the following.

```shell
# Enable and start Systemd-Resolved
sudo systemctl enable systemd-resolved
sudo systemctl start systemd-resolved

# Leave the Systemd-Resolved configuration blank
sudo tee /etc/systemd/resolved.conf > /dev/null <<< ""

# Make /etc/resolv.conf a symlink to Systemd-Resolved file
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# Restart Systemd-Resolved for the changes to take effect
sudo systemctl restart systemd-resolved
```

## Zapret Komutaları

Tamam, şimdi **zapret’i gerçek hayatta nasıl “otomatik çalışır” hale getirirsin**,
**nasıl durdurursun**, **çalışıp çalışmadığını nasıl anlarsın** hepsini net, adım adım anlatıyorum.
(Anlatım Linux içindir – Ubuntu / Debian / Arch / CachyOS fark etmez.)

---

## 🔹 1. Zapret’i Servis Olarak Otomatik Başlatmak

Zapret, systemd servisi olarak çalıştırılabilir.
Kurulumdan sonra genelde `/opt/zapret` altında olur.

### 📌 Servisi aktif et (boot’ta otomatik başlasın)

```bash
sudo systemctl enable zapret
```

### 📌 Hemen başlatmak için

```bash
sudo systemctl start zapret
```

Bu noktadan sonra:

- Bilgisayar her açıldığında **zapret otomatik çalışır**
- Manuel başlatmana gerek kalmaz

---

## 🔹 2. Zapret Çalışıyor mu? (Kontrol Etme)

### ✅ Servis durumu

```bash
systemctl status zapret
```

Başarılıysa şuna benzer görürsün:

```
● zapret.service - DPI bypass service
   Active: active (running)
```

Eğer `inactive`, `failed` veya `dead` yazıyorsa çalışmıyordur.

---

### 🔍 Canlı logları izlemek

```bash
journalctl -u zapret -f
```

Burada şunlara benzer satırlar görürsün:

```
Starting zapret DPI bypass...
nfqws started
```

Bu çıktılar **zapret aktif** demektir.

---

## 🔹 3. Zapret’i Durdurmak

Geçici olarak kapatmak için:

```bash
sudo systemctl stop zapret
```

Tamamen devre dışı bırakmak için (boot’ta çalışmasın):

```bash
sudo systemctl disable zapret
```

---

## 🔹 4. Zapret Gerçekten Çalışıyor mu? (Pratik Test)

### ✔ Yöntem 1 — Log kontrolü

```bash
journalctl -u zapret --since "5 minutes ago"
```

### ✔ Yöntem 2 — Trafik kontrolü

Zapret aktifken:

```bash
curl https://discord.com
curl https://youtube.com
```

Eğer daha önce girmiyorsa ama şimdi giriyorsa → **zapret çalışıyor**.

---

## 🔹 5. Zapret Hangi Siteler İçin Çalışır?

Önemli nokta 👇

Zapret:

- ❌ Tüm siteleri otomatik açmaz
- ✔ DPI ile engellenen sitelerde işe yarar
- ❌ IP bazlı engelleri aşamaz

Yani:

- YouTube / Discord / Reddit gibi DPI ile engellenmiş sitelerde genelde işe yarar
- Tamamen IP bloklu sitelerde yetersiz kalır

---

## 🔹 6. Gelişmiş (İsteğe Bağlı): Hangi Modu Kullanıyor?

Zapret farklı DPI bypass modlarıyla çalışır (`nfqws`, `tpws`, `nfqueue`).

Aktif ayarı görmek için:

```bash
cat /opt/zapret/config
```

veya:

```bash
ls /opt/zapret/
```

---

## 🔹 7. Kısa Özet (TL;DR)

| İşlem           | Komut                          |
| --------------- | ------------------------------ |
| Servisi başlat  | `sudo systemctl start zapret`  |
| Otomatik başlat | `sudo systemctl enable zapret` |
| Durdur          | `sudo systemctl stop zapret`   |
| Durum kontrol   | `systemctl status zapret`      |
| Logları gör     | `journalctl -u zapret -f`      |

---

## 🧠 Son Tavsiye

Zapret **VPN değildir**.
Ama “DPI yüzünden giremiyorum” dediğin birçok sitede çok etkilidir.

İstersen bir sonraki adımda:

- 🧩 **zapret + iptables ayarları**
- 🔍 **hangi sitelerin DPI ile engellendiğini test etme**
- 🚀 **en stabil zapret konfigürasyonu (Türkiye ISP’leri için)**

bunları da adım adım anlatabilirim.

## References

- [Zapret GitHub](https://github.com/bol-van/zapret/)

- [Zapret Documentation](https://keift.gitbook.io/blog/linux/install-zapret)
