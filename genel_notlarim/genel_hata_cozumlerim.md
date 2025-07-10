# Genel Hata Çözüm Notlarım

## Zen Browser New Tab Açılış Sorunu

Zen Browser'da yeni bir sekme açıldığında "New Tab" sayfası açılıyordu. Ben klasik google arama sayfasını istiyordum. Bunu çözmek için şu adımları izledim.

zen Browser `about:config` adresine gidin ve `en.urlbar.replace-newtab` ayarını `false` olarak değiştirin.

### Kaynakça

- [Zen Browser New Tab Sorunu](https://github.com/zen-browser/desktop/issues/5109)
