# Genel Kurulum Notlarım

## Genel Güncelleme İşlemleri

```BASH
sudo apt update
sudo apt upgrade -y
```

## .Bashrc komutlarım

```BASH
# Disk alanını anlamlı gösterir
alias disk='du -h'
# Güncelleme işlemi
alias gunaydin='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo snap refresh'
# Komut satırında gün,tarih,saat,isim gibi bilgileri gösterme
PS1="\n\[\e[35m\]\D{%Y-%m-%d}, \t\[\e[m\] \[\e[31m\]\u\[\e[m\]@\[\e[36m\]KaanPc\[\e[m\]:\[\e[32m\]\w\[\e[m\]\n\$ "
# Sanal makine başlatma
alias startserver='VBoxManage startvm "UbuntuServer" --type headless'
# Sanal makine durdurma
alias stopserver='VBoxManage controlvm "UbuntuServer" acpipowerbutton'

```

## [Gnome Shell Extensions(Web Arayüzünden Gnome Eklenti Kurma)](https://extensions.gnome.org/)

Eklenti kurarken eğer `No such native application org.gnome.chrome_gnome_shell` gibi bir hata alıyorsanız aşağıdaki komut ile `gnome-browser-connector` yüklenmeli.

```BASH
sudo apt install gnome-browser-connector -Y
```

> **Note**: [Detaylı Kaynak)](https://ubuntushell.com/setup-gnome-shell-extensions/)
