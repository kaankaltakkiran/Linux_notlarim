# Netlify İle Ücretsiz Web Site Nasıl Yayınlanır ?

## Netlify nedir ?

[Netlify](https://www.netlify.com/), web projelerinizi koyabildiğiniz bir platformdur. ‘all-in-one’ olarak isimlendirilen, tek bir yerden bir çok farklı hizmet sunan bir teknolojidir.

Örneğin; sunucu alt yapısını, sürekli entegrasyon şeklinizi ve deployment şeklinizi değiştirebilmenizi sağlar.

Ayrıca projenizin büyümesiyle ortaya çıkan; kullanıcı kimlik doğrulaması, form işleme gibi temel hizmetleri hızlı bir şekilde projenize koyabilmenize de olanak sağlar.

## Quasar ile geliştirdiğim projemi nasıl yayınlarım ?

- Öncelikle [Netlify](https://www.netlify.com/) sitesine üye olunur.
- Giriş yaptıktan sonra `Add new site` butonuna tıklanır. Seçenekler arasında projenizi isterseniz github reposundan(tavsiye ederim), isterseniz manual olarak yükleyebilirsiniz.
- `import an existing project` seçeneği seçilir.
- Daha sonra karşımıza deploy seçenekleri olarak github, gitlab, bitbucket gibi seçenekler çıkıyor. Buradan `github` seçip, github hesabımızı bağlıyoruz.
- Github hesabımızı bağladıktan sonra githubda ki repolarımız karşımıza çıkıyor. Deploy etmek istediğimiz projenin reposunu seçiyoruz.
- İsterseniz `Site name` kısmında site adını çıkan istediğiniz şekilde değiştirebilirsiniz.
- `Base directory` kısmına proje klasörünün adını yazıyoruz.
- `Build command` quasar build yazıyoruz.
- `Publish directory` kısmına dist/spa ekliyoruz.
- Son olarak deploy butonuna tıklayarak deploy işlemini başlatıyoruz.
- Daha sora işlemlerin başladığı log ekranı bizi karşılıyor. Deploy sürecini buradan takip edebiliriz.
- İşlemler başarılı olduktan sonra site adına tıklayarak web sitenizi açabilirsiniz.
