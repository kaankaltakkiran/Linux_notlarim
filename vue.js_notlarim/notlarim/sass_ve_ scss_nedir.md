# Sass Ve Scss Notlarım

## Sass ve scss nedir?

Sass (Syntactically Awesome Style Sheets) ve SCSS (Sassy CSS), CSS (Cascading Style Sheets) kodlarını daha etkili ve düzenli bir şekilde yazmanıza yardımcı olan CSS ön işlemcileridir.

Sass ve SCSS, CSS kodunu daha düzenli ve okunaklı hale getirmek, tekrarlayan kodları azaltmak ve CSS geliştirmeyi daha kolay hale getirmek için kullanılan bir dildir. Bu dillerin temel amacı CSS kodunun daha modüler ve sürdürülebilir hale getirilmesidir.

## Sass ve scss avantajları :

_Daha İyi Sözdizimi:_ Sass ve SCSS, daha iyi bir sözdizim sunar. Normal CSS ile karşılaştırıldığında, daha az sembol kullanımı ve daha okunaklı bir yapıya sahiptir. Bu, kodun anlaşılmasını kolaylaştırır ve hata yapma olasılığını azaltır.

_Değişkenler:_ Sass ve SCSS, değişken kullanımına olanak tanır. Değişkenler, renkler, yazı tipleri ve diğer stil özelliklerini tek bir yerden yönetmenizi sağlar. Bu, tasarımın tutarlılığını sağlamak ve değişiklikleri daha hızlı yapmak için önemlidir.

_İç İçe Geçmiş Kurallar:_ Sass ve SCSS, CSS kurallarını iç içe geçirebilmenizi sağlar. Bu, daha karmaşık tasarımlar oluştururken daha organize bir yapı sunar. CSS’de bu tür iç içe geçmiş kurallar daha karmaşıktır.

_Mixin’ler:_ Mixin’ler, tekrarlayan kod parçacıklarını yeniden kullanmanızı sağlar. Özellikle çapraz tarayıcı uyumluluğu için gereken özelliklerin eklenmesi veya belirli tasarım özelliklerinin hızlı bir şekilde uygulanması için kullanışlıdır.

_Mantıksal İşlemler:_ Sass ve SCSS, aritmetik işlemleri ve mantıksal işlemleri destekler. Bu, stil özelliklerini hesaplarken veya karşılaştırırken kullanışlıdır.

_Kolay Bakım ve Geliştirme:_ Sass ve SCSS, projeleri daha kolay bakım ve geliştirme yapmanızı sağlar. Daha iyi organizasyon, kodun anlaşılmasını ve üzerinde çalışılmasını kolaylaştırır.

## Sass ve Scss Farkları

Sass (Syntactically Awesome Style Sheets) ve Scss(Sassy CSS), temelde aynı amaca hizmet eden CSS ön işlemcileridir. Ancak, bu iki dil arasında bazı sözdizimi farkları bulunmaktadır.


_Sözdizimi:_

Sass: Sass, daha sade ve sembollerle dolu bir sözdizimine sahiptir. Özellikle çıkarım işareti ({}) veya noktalı virgül (;) gibi standart CSS sembollerini kullanmak yerine, boşlukları kullanır.

Scss: Scss, daha fazla benzerliğe sahip olan ve CSS’e daha yakın bir sözdizimi sunar. Bu nedenle, SCSS kodunun daha kolay geçiş yapılabilir ve CSS’e dönüştürülebilir olması açısından avantajlıdır.

 _Yorumlar:_

Sass: Sass, yorumları // ile işaretler. Bu yorumlar yalnızca Sass dosyaları içinde kalır ve çıktıda görünmez.

Scss: Scss, standart CSS yorumlarını /\* \*/ kullanır ve bu yorumlar çıktıya dahil edilmez.

 _Çıktı:_

Sass: Sass dosyaları, daha kompakt bir çıktı üretir ve daha az okunaklıdır.

Scss: Scss dosyaları, daha fazla benzerlik taşıdığı için üretilen CSS çıktısı daha okunaklıdır ve doğrudan kullanılabilir.

Kısaca Sass ve Scss, CSS kodunu daha etkili bir şekilde yazmayı ve yönetmeyi sağlayan güçlü araçlardır.

İhtiyaca bağlı olarak tercih edilen sözdizimi ile her iki seçenek de geliştiricilere daha düzenli ve verimli CSS kodları oluşturmak için olanak tanır.

Bu özellikler, web geliştirme projelerini daha verimli hale getirir ve kodun bakımını kolaylaştırır.

## Örnek SAAS Kodu

  ```css
$general-font: "Helvetica, sans-herif";
$my-color: #a5a5a5;
p {
font-family: $general-font;
color: $my-color;

div {
.aciklama{
  color:blue;
  &:hover{
   color:red
  }
 }
 .resim{
  width: 100%;
 }   
}
 ```

[Sass ve SCSS örnek kod](  https://devhints.io/sass)
