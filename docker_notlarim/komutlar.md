# 🐳 Docker Nedir? (Kısa ve Öz)

**Docker**, uygulamaları ve bağımlılıklarını izole edilmiş ortamlarda (container/kapsayıcı) çalıştırmak için kullanılan açık kaynaklı bir platformdur.

- Her container, içinde çalıştırdığı uygulamanın ihtiyacı olan her şeye sahiptir: kod, kütüphaneler, sistem araçları vs.
- Bu sayede bir uygulama geliştirici makinesinde nasıl çalışıyorsa, üretimde de aynı şekilde çalışır.
- Docker, **sanal makine gibi davranır**, ancak çok daha hafiftir ve sistem kaynaklarını daha verimli kullanır.

---

## 🧠 Bilmen Gereken Temel Kavramlar

| Kavram           | Açıklama                                                                 |
| ---------------- | ------------------------------------------------------------------------ |
| **Image**        | Çalıştırılabilir container şablonudur. "Kalıp" gibi düşünebilirsin.      |
| **Container**    | Bir image’in çalışan bir instance’ıdır. İzole bir ortamda çalışır.       |
| **Dockerfile**   | Docker image oluşturmak için kullanılan yapılandırma dosyasıdır.         |
| **Docker Hub**   | Docker image'lerinin paylaşıldığı merkezi depo.                          |
| **Volume**       | Verileri container dışında tutmak için kullanılır (kalıcı veri saklama). |
| **Port Binding** | Host (sunucu) ile container arasında ağ bağlantısını yapılandırır.       |

---

## 🔧 Sık Kullanılan Docker Komutları

| Komut                                 | Açıklama                                          |
| ------------------------------------- | ------------------------------------------------- |
| `docker --version`                    | Docker sürümünü gösterir                          |
| `docker pull <image>`                 | Docker Hub'dan image indirir                      |
| `docker images`                       | İndirilen image'leri listeler                     |
| `docker ps`                           | Çalışan container'ları listeler                   |
| `docker ps -a`                        | Tüm (çalışan/duran) container'ları listeler       |
| `docker run <image>`                  | Bir container başlatır                            |
| `docker run -it <image>`              | Etkileşimli terminal ile container çalıştırır     |
| `docker run -d <image>`               | Container'ı arkaplanda çalıştırır (detached mode) |
| `docker run -p 8080:80 <image>`       | Port yönlendirmesi ile çalıştırır                 |
| `docker stop <container_id>`          | Çalışan bir container'ı durdurur                  |
| `docker start <container_id>`         | Durdurulmuş bir container'ı başlatır              |
| `docker rm <container_id>`            | Bir container'ı siler                             |
| `docker rmi <image_id>`               | Bir image'i siler                                 |
| `docker exec -it <container_id> bash` | Container içine terminal erişimi sağlar           |
| `docker build -t <tag> .`             | Mevcut dizindeki Dockerfile’dan image oluşturur   |

---

## 🛠️ Örnek Komutlar

```bash
# Nginx çalıştır ve 80 portunu 8080'e yönlendir
docker run -d -p 8080:80 nginx

# Ubuntu terminaline bağlan
docker run -it ubuntu bash

# Mevcut container'ları listele
docker ps -a

# Container içine gir
docker exec -it <container_id> bash
```

---
