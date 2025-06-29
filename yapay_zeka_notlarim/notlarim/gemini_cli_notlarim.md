# Gemini CLI Kullanım Rehberi

## Giriş: Gemini CLI Nedir?

- **Gemini CLI**: Google'ın Gemini modelleriyle komut satırı arayüzü (CLI) aracılığıyla etkileşim kurmanızı sağlayan açık kaynaklı bir araçtır.
- **Gemini CLI**: Terminalinizi yapay zeka destekli, güçlü bir çalışma alanına dönüştürmektir.
- **Gemini CLI**: Günde `60` model isteği ve ayda `1.000` model isteği hakkı sunar.

## Genel Bakış ve Mimari

- **Etkileşimli REPL Ortamı**: Gemini CLI, Gemini modellerinin yeteneklerini doğrudan terminalinize, etkileşimli bir Okuma-Değerlendirme-Yazdırma Döngüsü (REPL) ortamında getirir.
- **İstemci-Sunucu Mimarisi**:
  - İstemci Tarafı Uygulama (`packages/cli`): Yerel bir sunucu (`packages/core`) ile iletişim kurar:
  - Yerel Sunucu (`packages/core`): Gemini API'sine ve yapay zeka modellerine gelen istekleri yönetir.
- **Entegre Araçlar**: Gemini CLI, dosya sistemi işlemleri gerçekleştirme, kabukları çalıştırma ve web'den veri çekme gibi görevler için çeşitli araçlar içerir.

## Kurulum ve Başlangıç

### Ön Koşullar:

- [Node.js](https://nodejs.org/en/download) sürüm 18 veya üzeri yüklü olmalıdır:

### Kurulum Yöntemleri:

- **Doğrudan Çalıştırma (Önerilen)**:
  ```bash
  npx https://github.com/google-gemini/gemini-cli
  ```
  - Bu komut, CLI'yı indirir ve doğrudan çalıştırır.
- **Global Kurulum**:
  ```bash
  npm install -g @google/gemini-cli
  ```
  - Bu komut, CLI'yı sisteminize global olarak kurar.

### Kimlik Doğrulama:

- İlk çalıştırmada, kişisel Google hesabınızla oturum açmanız istenir (bir tarayıcı penceresi açılır)
- Alternatif olarak, bir API anahtarı kullanabilirsiniz.
  - Google AI Studio'dan bir anahtar oluşturun..
  - Terminalinizde ortam değişkeni olarak ayarlayın.

## CLI Kullanımı: Komutlara Genel Bakış

Gemini CLI, oturumunuzu yönetmenize, arayüzü özelleştirmenize ve davranışını kontrol etmenize yardımcı olmak için çeşitli yerleşik komutları destekler. Bu komutlar, özel karakterlerle başlar.

- **Eğik Çizgi Komutları (`/`)**: CLI üzerinde meta düzeyde kontrol sağlar.
- **At Komutları (`@`)**: İsteminize dosya veya dizinlerin içeriğini dahil etmek için kullanılır.
- **Kabuk Modu ve Geçiş Komutları (`!`)**: Doğrudan sisteminizin kabuğuyla etkileşim kurmanızı sağlar.

### Eğik Çizgi Komutları

Bu komutlar, CLI'nın kendi işlevselliğini kontrol eder:

- `/bug`: Gemini CLI hakkında bir sorun bildirin.
- `/chat`: Konuşma geçmişini yönetin.
  - `save <etiket>`: Mevcut konuşma geçmişini kaydeder.
  - `resume <etiket>`: Önceki kayıttan bir konuşmayı sürdürür.
  - `list`: Sohbet durumu için kullanılabilir etiketleri listeler.
- `/clear`: Terminal ekranını temizleyin (Klavye kısayolu: Ctrl+L).
- `/compress`: Tüm sohbet bağlamını bir özetle değiştirin (token tasarrufu sağlar).
- `/editor`: Desteklenen düzenleyicileri seçmek için bir iletişim kutusu açın.
- `/help` (veya `/?`): Kullanılabilir komutlar ve kullanımları dahil olmak üzere yardım bilgilerini görüntüler.
- `/mcp`: Yapılandırılmış Model Bağlam Protokolü (MCP) sunucularını ve araçlarını listeleyin.
- `/memory`: Yapay zekanın öğretim bağlamını (GEMINI.md dosyalarından yüklenen hiyerarşik bellek) yönetin.
  - `add <metin>`: Belirtilen metni yapay zekanın hafızasına ekler.
  - `show`: Geçerli hiyerarşik belleğin birleştirilmiş içeriğini görüntüler.
  - `refresh`: Hiyerarşik öğretim belleğini yeniden yükler.
- `/restore`: Proje dosyalarını bir araç yürütülmeden hemen önceki durumlarına geri yükler.
- `/stats`: Geçerli Gemini CLI oturumu için ayrıntılı istatistikleri (token kullanımı, oturum süresi) görüntüler.
- `/theme`: Gemini CLI'nin görsel temasını değiştirmenize olanak tanıyan bir iletişim kutusu açın.
- `/auth`: Kimlik doğrulama yöntemini değiştirmenize olanak tanıyan bir iletişim kutusu açın.
- `/about`: Sürüm bilgisini gösterir.
- `/tools`: Gemini CLI'da şu anda kullanılabilen araçların listesini görüntüler.
  - `desc` veya `descriptions`: Her aracın ayrıntılı açıklamalarını gösterir.
  - `nodesc` veya `nodescriptions`: Araç açıklamalarını gizler.
- `/quit` (veya `/exit`): Gemini CLI'dan çıkın.

### At Komutları

At komutları, Gemini'ye olan isteminizin bir parçası olarak dosyaların veya dizinlerin içeriğini dahil etmek için kullanılır.

- `@<dosya_yolu_veya_dizin_yolu>`: Belirtilen dosyanın veya dizindeki dosyaların içeriğini mevcut isteminize enjekte eder.
  - **Örnekler**:
    - `@path/to/your/file.txt Bu metni açıkla.`
    - `@src/my_project/ Bu dizindeki kodu özetle.`
    - `Bu dosya ne hakkında? _start@README.md`
- **Detaylar**:
  - Tek bir dosya yolu sağlanırsa, o dosyanın içeriği okunur.
  - Bir dizin yolu sağlanırsa, o dizindeki ve alt dizinlerdeki dosyaların içeriği okunmaya çalışılır.
  - Yollardaki boşluklar ters eğik çizgiyle kaçırılmalıdır (örn: `@My\ Documents/file.txt`).
  - Git-farkında filtreleme: Varsayılan olarak, git tarafından yoksayılan dosyalar (örn: `node_modules/`, `dist/`, `.env`, `.git/`) hariç tutulur.
- `@` (Yalnız sembol): Eğer bir yol olmadan yalnız bir `@` sembolü yazarsanız, sorgu Gemini modeline olduğu gibi geçirilir.

### Kabuk Modu ve Geçiş Komutları

Önüne `!` eklenen komutlar, Gemini CLI içinden doğrudan sisteminizin kabuğuyla etkileşime girmenizi sağlar.

- `!<kabuk_komutu>`: Sisteminizin varsayılan kabuğunda belirtilen komutu yürütür:
  - **Örnekler**:
    - `!ls -la` (çalıştırır `ls -la` ve Gemini CLI'ye geri döner)
    - `!git status` (çalıştırır `git status` ve Gemini CLI'ye geri döner)
  - Komuttan gelen herhangi bir çıktı veya hata terminalde görüntülenir.
- `!` (Kabuk modunu değiştir): Yalnız başına `!` yazmak kabuk modunu açar/kapatır.
  - **Kabuk Moduna Giriş**: Aktif olduğunda, kabuk modu farklı bir renklendirme ve bir "Kabuk Modu Göstergesi" kullanır: 48. Kabuk modundayken yazdığınız metin doğrudan bir kabuk komutu olarak yorumlanır.
  - **Kabuk Modundan Çıkış**: Çıkıldığında, kullanıcı arayüzü standart görünümüne geri döner ve normal Gemini CLI davranışı devam eder.
  - **Dikkat**: Kabuk modunda çalıştırdığınız komutlar, doğrudan terminalinizde çalıştırdığınız komutlarla aynı izinlere ve etkiye sahiptir.

## Temel Ayrıntılar: Araçlar API'si ve Araçlar

- **Çekirdek Bileşen (`packages/core`)**: Gemini CLI'nin temelini oluşturan bu bileşen, araçları yönetir ve kullanıma sunar.
- **Araçlar API'si**: Çekirdeğin araçları nasıl yönettiği ve kullanıma sunduğu hakkında bilgi sağlar.
- **Mevcut Araçlar (Örnekler)**:
  - **Dosya Sistemi Araçları**: `read_file` ve `write_file` gibi dosya okuma ve yazma işlemleri için.
  - **Çoklu Dosya Okuma Aracı**: `read_many_files` aracı ile birden fazla dosyanın içeriğini okuma.
  - **Shell Aracı**: `run_shell_command` ile kabuk komutlarını yürütme.
  - **Web Getirme Aracı**: `web_fetch` ile web sayfalarından veri çekme.
  - **Web Arama Aracı**: `google_web_search` ile Google web araması yapma.
  - **Bellek Aracı**: `save_memory` ile yapay zekanın belleğine bilgi kaydetme.

### Kaynakça

- [Gemini CLI GitHub](https://github.com/google-gemini/gemini-cli)
