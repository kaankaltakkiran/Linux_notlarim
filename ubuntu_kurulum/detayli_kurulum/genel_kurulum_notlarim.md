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
