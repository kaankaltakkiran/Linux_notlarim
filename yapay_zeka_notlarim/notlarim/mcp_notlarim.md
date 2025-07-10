# 🤖 MCP(Model Context Protocol) Notlarım

## 🧠 Mcp Nedir ?

MCP, uygulamaların LLM'lere bağlam sağlama biçimini standartlaştıran açık bir protokoldür.

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

> Cascade kısmında çekiç iconuna tıklayıp oluşturduğunuz mcpnin durumunu kontrol edebilirsiniz.

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

### Kaynaklar

- [Tüm Mcplerin Olduğu Web sitesi](https://smithery.ai/)
- [Windsurf MCP Ayarları](https://docs.windsurf.com/windsurf/cascade/mcp)
- [İlgili Yotube Videosu](https://www.youtube.com/watch?v=bOxc812TqSA&t=378s)
