# Node Version Manager (NVM) Notlarım

Kaynak: [NVM](https://github.com/nvm-sh/nvm)

Node Version Manager (NVM), Node.js'in farklı sürümlerini yönetmek için kullanılan bir araçtır. Node.js, JavaScript tabanlı uygulamaları çalıştırmak için kullanılan bir çalışma zamanı ortamıdır ve sürekli olarak geliştirilmektedir. Her Node.js sürümü, yeni özellikler, performans iyileştirmeleri ve hata düzeltmeleri içerebilir.

NVM, bilgisayarınızdaki farklı Node.js sürümlerini yüklemenizi, yönetmenizi ve geçiş yapmanızı sağlar. Bu, farklı projelerin farklı Node.js sürümlerine ihtiyaç duyması durumunda çok kullanışlı olabilir. Örneğin, bir proje eski bir Node.js sürümüyle uyumlu olabilirken, başka bir proje daha yeni bir sürüm gerektirebilir.

NVM ayrıca birden çok projenin aynı makinede farklı Node.js sürümlerini kullanmasına izin vererek geliştirme sürecini daha esnek hale getirir. Bu, uygulamaları geliştirirken veya test ederken farklı sürümleri denemek için çok faydalı olabilir.. 

## NVM nasıl yüklenir ?
Aşığıdaki komutlarından herhangi biriyle yükleyebilirsiniz.
```BASH
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```
yada:
```BASH
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```
Kurduktan sonra aşşığıdaki komut ile kontrol edebilirsiniz.

Örnek çıktı: 0.39.7
```BASH
nvm -v
```
## NVM ile node.js nasıl kurulur ?
Aşığıdaki komut ile node.js verison 20.12.2 kurabilirsiniz.
```BASH
# download and install Node.js 
nvm install 20

# verifies the right Node.js version is in the environment
node -v # should print `v20.12.2`

# verifies the right NPM version is in the environment
npm -v # should print `10.5.0`
```

## NVM ile istediğiniz node.js versiyonunu nasıl kurabilirsiniz ?

Örneğin aşığıdaki komut ile node.js 16. versiyonunu kullanabilirsiniz.

```BASH
nvm use 16
Now using node v16.9.1 (npm v7.21.1)
```

