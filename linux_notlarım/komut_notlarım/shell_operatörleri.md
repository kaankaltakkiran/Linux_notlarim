# Linux Shell Operatörleri

**Linux komutlarının zincirlenmesi, birkaç komutun birleştirilmesi ve aralarında kullanılan operatörün davranışına göre** yürütülmesi anlamına gelir.

## Ampersand Operatör (&)
**‘&’ işlevi, komutun arka planda çalışmasını** sağlamaktır.

## Noktalı Virgül Operatör (;)
Noktalı virgül operatörü, **tek seferde birkaç komutu çalıştırmayı ve komutların sırayla yürütülmesini** sağlar.

Aşağıdaki komut **ilk önce apt’yi günceller sonra apt paketlerini** yükseltir.
```BASH
sudo apt update ; sudo apt upgrade ; -y
```
## AND (VE) Operatörü (&&)
AND (VE) Operatörü (&&), **yalnızca ilk komutun yürütülmesi BAŞARILIysa ikinci komutu yürütür.**

Aşağıdaki komut **ilk önce apt’yi günceller işlem başarılıysa apt paketlerini yükseltir.**
```BASH
sudo apt update  && sudo apt upgrade -y
```
## OR (VEYA) Operatörü (||)
OR (VEYA) Operatörü (||), programlamadaki ‘else’ ifadesine çok benzer. **Bu operatör, yalnızca ilk komutun yürütülmesi başarısız olduğunda ikinci komutu yürütmenize** izin verir.

Aşağıdaki komut **snap klasörünü rm ile silmek istiyor ama -r parametresi kullanmadan klasör silinemeyeceği için başarısız olup echo ile ekrana mesajımızı yazdırır.**
```BASH
rm snap || echo 'Klasör silmek için -r parametresini kullanmalısın'
```
## Pipe Operatörü ( | )
PIPE operatörü, **ilk komutun çıktısının ikinci komutun girdisi olarak kullanmak** çok kullanışlıdır. 

Aşağıdaki komut **ls komutunun çıktısını (ls komutu tüm dosya ve klasörleri listeler), ardından bu çıktıyı grep komutuna (grep, bir metin içinde belirli bir deseni aramak için kullanılır) grep ".txt" ifadesi, sadece ".txt" uzantılı dosyaları filtrelemek için kullanılır.**

Bu nedenle **ls komutunun çıktısında sadece ".txt" uzantılı dosyalar listelenir.**
```BASH
ls | grep ".txt"
```

