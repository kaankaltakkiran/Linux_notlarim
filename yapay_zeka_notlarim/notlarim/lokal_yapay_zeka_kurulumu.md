# Bilgisayarınıza Lokal Olarak Çalışan Yapay Zeka Nasıl Kurulur?

## Lokalde Çalışan Yapay Zekanın Faydaları Nelerdir ?

En önemli faydalarından biri `Veri Gizliliği ve Güvenliğidir.` lokal AI kullanımı, verilerin lokal olarak depolanması ve işlenmesini sağlar. Bu sayede verilerinizin dışarı aktarılması riskini azaltır ve veri gizliliğini korur.

## Ollama Nedir Ve Nasıl Kurulur ?

`Ollama AI`, terminalde yapay zekayı kullanan bir araçtır. [Ollama](https://ollama.com/) ile lokalimizde çalışan yapay zeka oluşturcağız.

Ollama yüklemek için aşağıdaki komutu terminalde çalıştırın:

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

Kurduktan sonra aşağıdaki komut ile Ollamayı arka planda sürekli çalışsın:

```bash
sudo systemctl enable --now ollama
```

## Open WebUI Nedir Ve Nasıl Kurulur ?

`Open WebUI`, ollama ile iletişime geçmemiz için arayüz sağlar yapay zekayı kullanan bir araçtır.

[Open WebUI](https://openwebui.com/) sunduğu arayüz ile Ollamayı daha efektif kullanabiliriz.

Örneğin, aynı anda birden fazla model seçerek farklı modellerden gelen cevapları aynı anda görebiliriz.

> **Note**:Open WebUI kullanabilmek için bilgisayarınızda `docker` yüklü olmalı.

Ubuntu için aşağıdaki komut ile docker yükleyebilirsiniz:

```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

Son olarak docker paketlerini yüklemek için aşağıdaki komut çalıştırılır.

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
```

Doğru bir şekilde yüklendiyse Aşağıdaki komut ile docker versiyonunu görebilirsiniz.

Örnek çıktı: Docker version 26.1.4, build 5650f9b

```bash

docker --version
```

Aşağıdaki komut ile dockerın aktif veya pasif mi olduğunu görebilirsiniz:

```bash
 sudo systemctl status docker
```

Docker yükledikten sonra aşşığıdaki komut ile Open WebUI yüklenir:

```bash
docker run -d --network=host -v ollama-webui:/app/backend/data -e OLLAMA_API_BASE_URL=http://127.0.0.1:11434/api --name ollama-webui --restart always ghcr.io/ollama-webui/ollama-webui:main
```

Aşşığıdaki komut ile yukardaki docker containerını görebilirsiniz:

```bash
 sudo docker ps
```

Yükleme başarılı olduktan sonra open webuı 8080 portunu kullanır.

[Bu adrese tıklayarak](http://localhost:8080/) open webuı açabilirsiniz. Üye olduktan sonra Open WebUI kullanmaya başlayabilirsiniz.

## Model Nasıl Yüklenir Ve Nasıl Kullanır ?

Model, Open WebUI'deki AI algoritmalarının temel birimi olarak kabul edilir.

Modelinizin çalışma hızı ekran kartınızın ramine bağlıdır. Ekran kartı rami ne kadar fazla ise o kadar hızlı çalışır.

İsterseniz open webuı arayüzden, ayarlar|models kısmından model yükleyebilirsiniz.

Başka bir seçenek ise komut satırı ile modelleri yükleyebilirsiniz.

[Ollama modellerini burdan](https://ollama.com/library) incleyip yükleyebilirsiniz.

### Llama 3 Modeli Nasıl Yüklenir ?

`Llama 3,` Meta tarafından geliştirilen ve GPT-4 gibi büyük dil modellerine benzer şekilde çalışan açık kaynak bir yapay zeka modelidir.

Aşşığıdaki komut ile Llama 3 kurulur:

```bash
ollama run llama3
```

### phi3 Modeli Nasıl Yüklenir ?

`Phi-3,` Microsoft'un hafif 3B (Mini) ve 14B (Medium) daha düşük donanımlarda(telefon,tablet gibi) çalışan bir yapay zeka modelidir.

Aşşığıdaki komut ile phi3 kurulur:

```bash
ollama run phi3
```

### dolphin-llama3 Modeli Nasıl Yüklenir ?

`Dolphin-llama3,` Llama 3'ü temel alan, sansürsüz yapay zeka modelidir.

> **Note**:Sansürsüz model:Bilgi ve içerik üzerinde herhangi bir sınırlama veya filtreleme uygulamaz. Kullanıcının sorduğu her türlü soruya yanıt vermeye çalışır. Cevaplar sansürlü modele göre daha yanlış olabilir. Kullanırken dikkat edilmelidir.

Aşşığıdaki komut ile Dolphin-llama3 kurulur:

```bash
ollama run dolphin-llama3
```

### LLaVA Modeli Nasıl Yüklenir ?

` LLaVA`, görsel üreten ve yorumlayan bir yapay zeka modelidir.
Aşşığıdaki komut ile phi3 kurulur:

```bash
ollama run llava
```

### Yüklü Modelleri Nasıl Görebilirim ?

Aşşığıdaki komut ile yüklü olan modelleri listeleyebilirsiniz:

```bash
ollama list
```

## Yaranlandığım Kaynaklar

- [Ubuntuda Ollama İle Lokal Yapay Zeka Kurulumu](https://itsfoss.com/ollama-setup-linux/)
- [Türkçe Detaylı Kurulum Yotube Video](https://www.youtube.com/watch?v=9pWNZUFtQSM)
- [Open WebUI](https://openwebui.com/)
- [Open WebUI Detaylı Kurulum](https://docs.openwebui.com/getting-started/)
- [Ollama Model Kaynak](https://ollama.com/library)
- [Docker Kurulum](https://docs.docker.com/engine/install/ubuntu/)
- [Hata Çözümü](https://github.com/open-webui/open-webui/issues/377)
