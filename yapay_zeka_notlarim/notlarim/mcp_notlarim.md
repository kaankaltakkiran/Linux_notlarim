# 🤖 MCP(Model Context Protocol) Notlarım

## 🧠 Mcp Nedir ?

MCP, uygulamaların LLM'lere bağlam sağlama biçimini standartlaştıran bir protokoldür.

MCP'yi yapay zeka uygulamaları için bir USB-C portu gibi düşünün. USB-C, cihazlarınızı çeşitli çevre birimlerine ve aksesuarlara bağlamak için standart bir yol sağladığı gibi, MCP de yapay zeka modellerini farklı veri kaynaklarına ve araçlara bağlamak için standart bir yol sağlar.

Neden MCP? MCP, LLM'ler üzerine aracılar ve karmaşık iş akışları oluşturmanıza yardımcı olur.
Bu protokol sayesinde, sohbet botları ya da dil modelleri gibi yapay zeka modellerinin bağlamı rahatlıkla yönetilebilmektedir.

İster yapay zeka destekli bir IDE oluşturuyor, ister bir sohbet arayüzünü geliştiriyor veya özel yapay zeka iş akışları oluşturabilirsiniz.

## Github MCP Windsurf Kurulum

Öncelikle MCP'yi kullanabilmek için Githubda `personal-access-token` oluşturmanız gerekmektedir. Bu token ile MCP'yi kullanabilirsiniz.

`settings > developer settings > personal access tokens` > fine-grained tokens > kısmnından yeni bir token oluşturun.

Önerien Ayarlar:

1. `Token Name`: MCP Windsurf
2. `expiration(Token geçerlilik süresi)`: 90 days
3. `Repository access`: All repositories
4. `Repository permissions`: Actions,Administration,Contents,Commits Statuses,Pull requests,Deployments,Discussions,Environments,Issues
5. `Generate token`: Tokeni oluşturun.

Son adım olarak aşağıdaki komutu `~/.codeium/windsurf/mcp_config.json` dosyasına ekleyin.

> **Note:** Github personal access kısmına tokeninizi eklemeyi unutmayın.

> Cascade kısmında çekiç iconuna tıklayıp oluşturduğunuz mcpnin durumunu görmek için `refresh` butonuna tıklayın. mcpnin durumunu kontrol edebilirsiniz.

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "<YOUR_PERSONAL_ACCESS_TOKEN>"
      }
    }
  }
}
```

Github MCP komutlarını nasıl kullanırım rehberine [buradan ulaşabilirsiniz.](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/github)

## Context7 MCP Kurulum

`Context7`, aşağıdaki sorunlara çözüm sunan bir MCP uygulamasıdır:

- Kod örnekleri güncelliğini yitirmiştir ve bir yıllık eğitim verilerine dayanmaktadır.
- Ai halüsinasyonları ve yanlış bilgi üretimi yaygındır.
- Eski paket sürümleri için genel yanıtlar.

`Context7`, bu sorunları çözmek için gerçek zamanlı olarak güncellenen ve sürekli olarak genişleyen bir veri kümesi kullanır. Bu sayede, kullanıcılar en güncel ve doğru bilgilere erişebilirler.

Kurulum için aşağıdaki adımları takip edebilirsiniz:
Zorunlu Gereksinimler:

- `Node.js`: En az 18.0.0 sürümü
- `MCP Client`: Örneğin Windsurf,Cursor ..vb

Son adım olarak aşağıdaki komutu `~/.codeium/windsurf/mcp_config.json` dosyasına ekleyin.

```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp"]
    }
  }
}
```

> **Note:** Cascade kısmında çekiç iconuna tıklayıp oluşturduğunuz mcpnin durumunu görmek için `refresh` butonuna tıklayın. mcpnin durumunu kontrol edebilirsiniz.

Örnek Kullanım:

```bash
Create a portfolio website with Vue 3 use context7
```

### Kaynaklar

- [Tüm Mcplerin Olduğu Web sitesi](https://smithery.ai/)
- [Windsurf MCP Ayarları](https://docs.windsurf.com/windsurf/cascade/mcp)
- [MCP Github Video](https://www.youtube.com/watch?v=bOxc812TqSA&t=378s)
- [Context7 MCP Github](https://github.com/upstash/context7)
