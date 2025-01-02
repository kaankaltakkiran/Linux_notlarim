### Cursor

**Cursor**, modern kod yazımına odaklanan bir kod editörüdür. Yapay zeka entegrasyonu ile kod tamamlama, hata ayıklama ve refaktörleme gibi görevlerde geliştiricilere yardımcı olmayı amaçlar.

#### Özellikler:

- **Yapay Zeka Destekli Kod Tamamlama**: OpenAI veya benzeri modellerle hızlı ve akıllı öneriler sunar.
- **Çoklu Dil Desteği**: Birden fazla programlama dilini destekler.
- **Platformlar**: Windows, macOS ve Linux için kullanılabilir.
- **Eklenti Desteği**: Editörü, ihtiyaca uygun eklentilerle genişletebilirsiniz.

#### İndirme Bağlantıları

Cursor'ı resmi web sitesinden veya GitHub deposundan indirilebilir:

- [Cursor Resmi Sitesi](https://www.cursor.com/)

#### Klavye Kısayolları

| **İşlem**                | **Windows/Linux**        | **macOS**                |
| ------------------------ | ------------------------ | ------------------------ |
| Yeni Dosya Aç            | `Ctrl + O`               | `Cmd + O`                |
| Dosyayı Kaydet           | `Ctrl + S`               | `Cmd + S`                |
| Tüm Dosyaları Kaydet     | `Ctrl + Shift + S`       | `Cmd + Option + S`       |
| Bul                      | `Ctrl + F`               | `Cmd + F`                |
| Tümünü Bul ve Değiştir   | `Ctrl + Shift + H`       | `Cmd + Shift + H`        |
| Git Değişikliklerini Gör | `Ctrl + Shift + G`       | `Cmd + Shift + G`        |
| Komut Paletini Aç        | `Ctrl + Shift + P`       | `Cmd + Shift + P`        |
| Terminali Aç/Kapat       | `Ctrl + Shift + ~`       | `Cmd + Option + ~`       |
| Kod Bölümünü Katla/Aç    | `Ctrl + Shift + [` / `]` | `Cmd + Option + [` / `]` |
| Satırı Yorumla           | `Ctrl + /`               | `Cmd + /`                |
| Satırı Kopyala           | `Ctrl + D`               | `Cmd + D`                |

> **Not**: Kısayollar varsayılan ayarlardır. Editör içinden kişiselleştirilebilir.

### Cursor Activ Barı Sol Dikey Yerleştirme

[İlgili Video](https://www.youtube.com/watch?v=x3JB6LuWXeE&list=FLRi8LZ2PetKpAdDVN17oDxg&index=6)

Vs code `settings.json` ekle:

```bash
"workbench.activityBar.orientation":"vertical",
```

### Cursor Kullanımı ve Özellikler

Cursor, yazılımcılara verimlilik kazandırmayı hedefleyen modern bir kod editörüdür. Yapay zeka destekli özellikleri ile kod yazma, analiz etme ve düzenleme süreçlerini kolaylaştırır. Bu doküman, Cursor'un önemli araçlarını ve kullanım alanlarını açıklamaktadır.

---

### **Önemli Kavramlar: Chat, Composer ve Agent**

#### 1. **Chat**

- **Tanım**: Kod editörünüz içinde bir yapay zeka destekli sohbet alanıdır.
- **Kullanımı**:
  - Kod yazımı sırasında sorular sorabilir, öneriler alabilirsiniz.
  - Örneğin: "Bu fonksiyonun ne yaptığını açıkla." veya "Şu kodun performansını artır." gibi komutlarla interaktif geri dönüş alabilirsiniz.
- **Avantajları**: Hızlı öğrenim ve problem çözme için idealdir.

---

#### 2. **Composer**

- **Tanım**: Kodunuzu yeniden yapılandırmanıza, geliştirilmiş sürümlerini oluşturmanıza veya belirli formatlara dönüştürmenize olanak sağlar. Chatten farklı olarak kodu projenize ekler
- **Kullanımı**:

  - Kodun bir kısmını seçip, "Bu fonksiyonu daha optimize bir şekilde yaz." veya "Python kodunu TypeScript'e çevir." gibi komutlarla çıktı alabilirsiniz.
  - **Örnek**:

    ```python
    # Mevcut Kod
    def add_numbers(a, b):
        return a + b

    # Composer ile optimize edilmiş hali:
    def add_numbers(*args):
        return sum(args)
    ```

---

#### 3. **Agent**

- **Tanım**: Proje bazlı görevleri yöneten bir yapay zeka asistanıdır. Daha karmaşık işlemler ve analizlerde devreye girer.
- **Kullanımı**:
  - Projenizin tüm kod tabanını analiz edebilir ve belirli görevleri yerine getirebilir.
  - Örneğin: "Bu projedeki tüm hataları bul ve önerilerde bulun." veya "Tüm API endpoint'lerini listele."
- **Avantajları**: Büyük projelerde daha geniş kapsamlı yardımlar sağlar.

---

### **Cursor’da @ Sembolleri**

Cursor, editörde belirli görevleri ve bağlamları yönetmek için `@` sembolünü kullanır. Bu semboller sayesinde yapay zeka destekli özellikleri daha verimli bir şekilde kullanabilirsiniz.

| **Sembol**   | **Açıklama**                                                                           | **Örnek Kullanım**                             |
| ------------ | -------------------------------------------------------------------------------------- | ---------------------------------------------- |
| `@ask`       | Kod veya herhangi bir konuda soru sormanıza olanak sağlar.                             | `@ask Bu fonksiyonun amacı nedir?`             |
| `@edit`      | Kodunuzu düzenlemek veya yeniden yazmak için komut verir.                              | `@edit Bu fonksiyonu daha hızlı çalıştır.`     |
| `@fix`       | Koddaki hataları bulur ve düzeltir.                                                    | `@fix Bu kodda mantıksal hataları düzelt.`     |
| `@explain`   | Kodun belirli bir kısmını açıklar ve daha anlaşılır hale getirir.                      | `@explain Bu algoritma nasıl çalışıyor?`       |
| `@translate` | Kodunuzu başka bir programlama diline dönüştürür.                                      | `@translate Bu kodu JavaScript'e çevir.`       |
| `@optimize`  | Kodunuzu daha hızlı ve verimli hale getirir.                                           | `@optimize Bu döngüyü iyileştir.`              |
| `@summarize` | Büyük kod bloklarını özetler.                                                          | `@summarize Bu sınıfın işlevlerini açıkla.`    |
| `@doc`       | Kodunuza otomatik olarak dokümantasyon ekler.                                          | `@doc Bu fonksiyon için bir açıklama oluştur.` |
| `@files`     | Projenizdeki dosyaları listeler, düzenler ve analiz eder.                              | `@files src/*.js dosyalarını listele.`         |
| `@folder`    | Belirli bir klasör üzerinde işlem yapmanızı sağlar.                                    | `@folder src klasöründeki kod hatalarını bul.` |
| `@code`      | Kod yazmak, düzenlemek veya tamamlamak için etkileşim sağlar.                          | `@code Python'da bir REST API oluştur.`        |
| `@docs`      | Projede yer alan dokümantasyon dosyalarını düzenlemek veya oluşturmak için kullanılır. | `@docs README.md dosyasını güncelle.`          |
| `@git`       | Git ile ilgili işlemleri hızlıca yapmanızı sağlar (commit, push, pull, vb.).           | `@git Tüm değişiklikleri commit et.`           |
| `@web`       | Belirli web işlemleri veya sorguları gerçekleştirir.                                   | `@web Bu API'nin belgelerini bul.`             |
| `@codebase`  | Projenin genel kod tabanını analiz eder ve önerilerde bulunur.                         | `@codebase Tüm API endpoint'lerini listele.`   |

---

### `.cursorrules` Nedir ?

Cursor uygulamasında kullanılan bir konfigürasyon dosyasıdır. Bu dosya, Cursor’un projenize nasıl tepki vereceğini ve belirli işlemleri nasıl yöneteceğini tanımlar. Özellikle otomasyon, kod analizi, düzenleme ve proje genelindeki kuralların belirlenmesi için kullanılır.

#### [Cursorrules](https://github.com/PatrickJS/awesome-cursorrules?tab=readme-ov-file) Nasıl Kulalnılır ?

[Bu linkten](https://github.com/PatrickJS/awesome-cursorrules?tab=readme-ov-file) geliştirmek istediğiniz yazılım dilini(teknolojiyi) seçerek cursoru özelleştirebilirsiniz.

Örneğin; `vue.js` kuralını ekledinz. Siz cursora kodun front-end kısmını yaz diyince sizin tanımladığınız vue.js ile front-end kodlarını yazacaktır.

Projede `.cursorrules` adında bir dosya açarak istediğiniz kuralları ekleyebilirsiniz.

Başka bir yol ise ekran görüntüsündeki olduğu gibi ayarlardan ekleyebilirsiniz. ctrl+shift+j

Örnek rules:

```bash
// Vue 3 Composition API .cursorrules

// Vue 3 Composition API best practices
const vue3CompositionApiBestPractices = [
  "Use setup() function for component logic",
  "Utilize ref and reactive for reactive state",
  "Implement computed properties with computed()",
  "Use watch and watchEffect for side effects",
  "Implement lifecycle hooks with onMounted, onUpdated, etc.",
  "Utilize provide/inject for dependency injection",
];

// Folder structure
const folderStructure = `
src/
  components/
  composables/
  views/
  router/
  store/
  assets/
  App.vue
  main.js
`;

// Additional instructions
const additionalInstructions = `
1. Use TypeScript for type safety
2. Implement proper props and emits definitions
3. Utilize Vue 3's Teleport component when needed
4. Use Suspense for async components
5. Implement proper error handling
6. Follow Vue 3 style guide and naming conventions
7. Use Vite for fast development and building
`;
```

Benim Kurlarım(Quasar Framework(vue 3 composition API) ve Php):

> **Note**:Denenmedi.

```bash
// Quasar Framework Vue 3 Composition API (script setup lang="ts") Cursor Rules
const quasarVue3CompositionApiCursorRules = [
  "Use script setup for defining components with TypeScript",
  "Utilize Quasar components and composables effectively (e.g., QBtn, useNotify)",
  "Keep the state reactive using ref and reactive from Vue",
  "Define props and emits with proper TypeScript types",
  "Use computed for derived state and watch/watchEffect for reactive side effects",
  "Use Quasar's i18n features for localization and translation",
  "Implement Quasar's Dark and Light mode with useDark",
  "Use provide/inject for sharing state or functions across components",
  "Follow the Quasar Framework guidelines for UI consistency and responsiveness",
  "Organize components into reusable and modular structures under `src/components`",
];

// PHP Development Cursor Rules
const phpDevelopmentCursorRules = [
  "Follow PSR (PHP Standards Recommendations) coding standards",
  "Use meaningful variable and function names for readability",
  "Implement error and exception

```

#### Sistemli Proje Kodlama

1. **PRD** (Ürün Gereksinimleri Belgesi)

Bir (Product Requirements Document), bir ürünün hedeflerini, özelliklerini, işlevlerini ve kısıtlamalarını ana hatlarıyla belirtir. Geliştiriciler, tasarımcılar ve paydaşlar için ürünün neyi neden yapması gerektiğini detaylandıran bir plan görevi görür.

2. **RFC** (Request for Comments)
   RFC(Yorum Talebi), belirli bir uygulama veya özellik öneren yapılandırılmış bir belgedir. Teknik ayrıntıları, gerekçeleri ve olası etkileri içerir ve ekibin bir özelliği nasıl uygulayacağını veya bir sorunu nasıl çözeceğini değerlendirmesine ve uyum sağlamasına yardımcı olur.

3. **Cursor' a derdimi nasıl anlatabildim**;
   1- Uygulama fikrin hakkında bir PRD dokümanı oluştur

   2- Oluşturduğun PRD dokümanındaki teknolojilere göre .cursorrules dosyası oluştur

   3- PRD dokümanına göre bir features dokümanı oluştur.

   4- PRD ve features dokümanını baz alarak implementasyon sırasına göre RFC dökümanları oluştur.

   5- Oluşturulan RFC dokümanlarına göre User behavior ve User action flowlarını oluştur ve çizdir

   6- Son adım her bir RFC yi sırasıyla Cursor' a implemente etmesini iste

##### Kaynaklarım

- [Cursor Resmi Sitesi](https://www.cursor.com/)

- [Cursor Rules Hakkında Bilgi](https://cursor101.com/cursor/rules)

- [Cursor Rules Ekelemek İçin Github Sayfası](https://github.com/PatrickJS/awesome-cursorrules?tab=readme-ov-file)

- [Cursor Kısa Yolları Dökümantasyon](https://docs.cursor.com/context/@-symbols/basic)

- [Cursor Yotube Videosu](https://www.youtube.com/watch?v=sfVBh6rlWjg)

- [Temp Email](https://10minutemail.com/)
