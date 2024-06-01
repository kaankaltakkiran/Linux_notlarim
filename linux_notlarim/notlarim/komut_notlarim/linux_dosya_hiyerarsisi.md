# Linux Dosya Hiyerarşisi

## Linux Dosya Hiyerarşisi Tablosu
|Komut                        |Açıklama                      
-------------------------------|-----------------------------|
|`/bin`|Kullanıcı ve sistem yöneticisine ait çalıştırılabilir dosyaları barındırır.|
|`/opt`            | Add-on yazılımların bulunduğu alandır. |
|`/boot`|Linux Kernelini barındıran (vmlinuz), sistem haritalarını ve ikinci seviye boot yükleyicilerini barındıran dizindir.|
|`/root`|  Bir sistemde en yetkili kullanıcı olan "root" kullanıcısına ait dizindir. |
|`/dev`|  Donanımlara erişebilmek için gerekli dosyaları barındırır. (/media)  |
|`/sbin`|  Sistem yöneticisine ait çalıştırılabilir dosyaları barındırır. |
|`/etc`| Sistemde çalışan servislerin konfigürasyonları için gerekli dosyaları barındırır. (Telnet, ssh, samba, apache, dhcp vb.) Servisleri başlatma betikleri de burada bulunu |
|`/home`|  Kullanıcılara ait dizindir.  |
|`/tmp`|  Geçici dosyaların yer aldığı dizindir.  |
|`/lib`| Sistem kütüphanelerini barındırır.  |
|`/usr`| Paylaşılan dosyaların barındığı dizindir. Burada çalışabilen dosyalar bulunmakla beraber, doküman ve kullanıcı programlarına ait dosyalar da yer almaktadır.  |
|`/mnt`|  Sisteme dışarıdan bağlanacak olan donanım aygıtlarının, bağlantı noktalarını belirten dizindir.|
|`/proc`| Sistem hakkında gerekli bilgilerin bulunduğu sanal dizindir. Bilgisayar boot olduğunda Ram de oluşturulur. Sistemde çalışan geçici süreçler bu dizin altında çalışırlar.|
