# Arşivci v0.1.0 — İlk test sürümü / First preview

Arşivci, macOS için yerel arayüzlü, WinRAR'daki günlük arşiv işlemlerinden ilham alan açık kaynak bir uygulamadır.

## Bu sürümde / Highlights

- macOS 13 ve sonrası için Apple Silicon (arm64) + Intel (x86_64) evrensel uygulama.
- ZIP ve 7z oluşturma; ZIP, 7z ve RAR başta olmak üzere desteklenen arşivleri listeleme ve çıkarma.
- Arşiv içindeki yalnızca seçili dosyaları dışarı çıkarma.
- Finder'da sağ tık üzerinden açma, buraya/klasöre çıkarma, sıkıştırma ve arşivi test etme.
- İngilizce ve Türkçe arayüz; 46 otomatik test M4 üzerinde geçti.

## Kurulum / Installation

1. `Arsivci-0.1.0.dmg` dosyasını açın.
2. `Arşivci.app` simgesini `Applications` klasörüne sürükleyin.
3. Uygulamayı `/Applications` konumundan bir kez çalıştırın. Finder sağ tık eylemleri bu aşamada kurulur.
4. Bu test paketi Apple Developer ID ile imzalanmadı ve Apple tarafından noter onayından geçmedi. macOS engellerse indirdiğiniz kaynağın güvenilir olduğundan emin olun; Apple'ın [uygulama güvenliği açıklamasını](https://support.apple.com/en-us/102445) okuyun.

## Sınırlamalar / Known limitations

- Bu bir **erken test sürümüdür (pre-release)**; Apple notarizasyonu yoktur.
- RAR arşivleri açılabilir; **RAR oluşturma için RARLAB'ın ayrı aracı** gerekir ve pakete dahil değildir.
- Finder'da görünen eylemler macOS sürümüne ve menü düzenine göre Servisler/Hızlı Eylemler altında bulunabilir.
- Güncelleme, ileri düzey arşiv yönetimi ve görsel iyileştirmeler yol haritasındadır.

## Lisans

MacRAR projesinden MIT lisansı altında türetilmiştir. Kaynak depodaki LICENSE ve telif bildirimleri korunur. 7-Zip aracı kendi lisansıyla dağıtılır. WinRAR ile resmî ilişki yoktur.
