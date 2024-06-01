# Quasar Framework Notlarım

## Quasar Framework Nedir ?
 **Quasar, Vue temellidir. Css ve sccc sayesinde kolayca özelleştirilebilir ve JS ile genişletilebilir**. 
 
 **Yazdığımız tek kodu tüm platformlara dağıtarak kullanabiliriz. Websitesi, Masaüstü uygulaması ve Mobil uygulamalar quasar ile kolaylıkla** geliştirilebilir.

 > **Note**: **write code once and simultaneously deploy.**

 Yukardaki yazı bize Quasarın en güçlü özelliğinden bahsetmektedir: **kodu bir kez yazın ve aynı anda dağıtın.**
 
 Bu demek oluyor ki **örneğin bir web sitesi olarak projenizi** geliştiriyorsunuz. **Diyelim ki mobil uygulama** olarak da yayınlamak istediniz projenizi. 
 
 **Quasar ile başka bir kod yazmadan bir kaç ayarlama ile projeniz hem web sitesi olarak hem de mobil uygulama olarak yayınlama imkani** elde edebiliyoruz. Bu durum çok kullanışlı ve harika bir özellik.

 **Babel, webpack, eslint gibi yazılım kontrollerine ihtiyaç duyulmadığının** da altını çizelim. 
 
 **Buna ek olarak yazılımcının ek olarak Bootstrap, Hammerjs gibi farklı kütüphanelerine olan ihtiyaç da ortadan kalkmış** oluyor.

**Vue ile haşır neşir olanlar component** nedir bilirler. **Yeniden kullanılabilen HTML blokları diyebiliriz kısaca. Quasar da oldukça kapsamlı component’lardan** oluşuyor.

**Input, button, toolbars ya da calendar, video players, chat box** gibi bir çok özellik mevcut.

Ayrıca Quasar, **Her detayı barındıran oldukça açıklayıcı bir dokümantasyona sahiptir ve yaygın bir topluluğa** sahiptir.
## Quasar İle Mobil Uygulama Geliştirme
**Quasar mobil ugulamalar için Cordova** kullanmayı tercih ediyor. **Kısaca Cordova hibrit bir şekilde javascript kullanarak mobil uygulama geliştirmeniz**i sağlıyor.
## Quasar İle Uygulama Geliştirme
**Masaüstü uygulamalarda ise bir başka javascript framework’ü olan Electron’u** görmekteyiz. 

**Electron ile işletim sistemi fark etmeksizin yazılım geliştirebiliyorsunuz**. 

**Diyelim ki siz Quasar ile ile bir masaüstü uygulaması geliştirdiniz. Framework bunu Electron koduna dönüştürüyor. Ve elbette kod üzerinde değişiklik** yapabiliyorsunuz.
## Quasar Nasıl Kullanılır ?
Quasarı **ClI** ile kullanmak mümkün.

 > **Note**: **Quasarı kullanmak için nodejs 14.verisondan yukarısı ve npm 6.14 ten yukarı bir versiyon** kurulu olması gereklidir.

Aşığıdaki komut, **quasar cli global olarak npm ile** yükler.
```bash
npm i -g @quasar/cli
```
Daha sonra aşığıdaki **komut ile npm ile quasar cli** oluşturmaya başlayın.
```bash
npm init quasar
```
Gerekli yüklemeler tamamlantıktan sonra **cd komutu ile proje dizinine** gidin.
```bash
cd <folder_name>
```
Son olarak **aşığıdaki komut ile projenizi** çalıştırın
```bash
  quasar dev
```
## Yaralandığım Kaynaklar:

Quasar Framework Medium Yazısı:[Quasar Framework Medium Yazısı](https://yagmurmutluer.medium.com/quasar-nedir-quasar-framework-ve-vue-js-4f89b1503fde)

 Quasar Framework Dokümantasyon :[Quasar Framework Dokümantasyon](https://quasar.dev/docs)
