# Arşivci for macOS

Windows'taki WinRAR'ın pratik arşiv işlevlerini macOS'un doğal arayüzüyle birleştirmeyi amaçlayan açık kaynak bir arşiv yöneticisi.

> **Durum: v0.1.0 erken test sürümü.** Proje [MacRAR](https://github.com/mstcvk/MacRAR) temel alınarak geliştirilir. M4 üzerinde uygulama ve Finder eylemleri çalışıyor; DMG/ZIP dağıtım paketleri hazır. Apple Developer ID ile imzalanmış ve noter onaylı genel sürüm henüz yok.

## Hedefler

- Finder'da dosya ve klasörlere sağ tıklayarak ZIP/7z arşivi oluşturma
- Arşivlerde **Buraya çıkart**, **Aynı adla klasöre çıkart**, **Klasör gibi aç** seçenekleri
- Arşivleri tamamen çıkarmadan içerik listesi, arama, önizleme ve seçili dosyaları çıkarma
- Şifreli ve çok parçalı arşivler, bütünlük testi, ilerleme göstergesi
- Türkçe ve İngilizce arayüz, Apple Silicon ve Intel desteği

## İlk teknik durum

MacBook Air M4 üzerinde Swift 6.4 ile derlenen uygulamada 46 test geçti. RAR açma ve seçili öğeyi çıkarma ile 7z sıkıştırma elle doğrulandı. arm64 ve x86_64 desteği var. Finder sağ tık eylemleri kuruldu ve kullanıcı tarafından çalıştığı doğrulandı.

## Kaynaktan derleme

macOS 13+ ve Apple Command Line Tools gereklidir.

    SEVENZIP_VERSION=2604 ./fetch-tools.sh
    ./build.sh

Çıktı **build/Arşivci.app** konumundadır. `./build.sh` yalnızca derler ve var olan MacRAR kurulumunu değiştirmez. Finder menülerini kurmak için uygulamanın `/Applications` altında olması gerekir. **`./build.sh install` henüz yalnızca kontrollü test için kullanılmalıdır**; aynı isimde uygulama varsa üzerine yazmadan durur.

## Test paketi (DMG + ZIP)

Derlemenin ardından `./package-release.sh` çalıştırın. `dist/Arsivci-0.1.0.dmg`, `dist/Arsivci-0.1.0.zip` ve SHA-256 kontrol dosyası oluşturulur. DMG içindeki **Arşivci.app** simgesini **Applications** kısayoluna sürükleyin; sağ tık eylemleri uygulamanın ilk açılışında otomatik kurulur.

Bu paket **ad-hoc imzalı ve Apple notarizasyonu olmayan bir test sürümüdür**. macOS güvenlik uyarısını atlamak için önce kaynak kodu ve dosyanın güvenilirliğini değerlendirin; [Apple güvenlik belgesine](https://support.apple.com/en-us/102445) bakın. `.github/workflows/release.yml`, GitHub `main` dalındaki ilk yayın güncellemesinde veya sonraki sürüm etiketlerinde ön sürüm dosyalarını otomatik oluşturup Releases sayfasına yüklemek üzere hazırlanmıştır.

## Yol haritası

- [x] Başlangıç kodunu derleme ve temel testler
- [x] Arşivci adı, ayrı uygulama kimliği ve sürümleme
- [x] Finder sağ tık menülerinin Arşivci adıyla düzenlenmesi (kaynak kod)
- [x] RAR açma, yalnız seçileni çıkarma ve 7z sıkıştırma M4 testi
- [x] Finder sağ tık menülerinin M4 üzerinde kurulum ve testleri
- [x] DMG + ZIP + SHA-256 test paketleri
- [ ] Özgün Arşivci simgesi
- [ ] Arşivi klasör benzeri pencerede açma deneyiminin iyileştirilmesi
- [ ] GitHub v0.1.0 ön sürüm yayını
- [ ] Apple Developer ID imzası ve notarizasyon

## Lisans ve atıf

Bu çalışma [MacRAR](https://github.com/mstcvk/MacRAR) (© 2026 Mesut Çevik, MIT lisansı) kaynak koduna dayalıdır. Özgün LICENSE dosyası ve telif bildirimi korunur. MacRAR projesiyle resmî bir bağlantımız yoktur.

7-Zip (7zz) ayrı bir bileşendir; kendi lisansına tabidir ve kaynak depoda ikili dosya olarak tutulmaz. RAR oluşturma için gereken RARLAB aracı da dağıtılmaz. WinRAR ve RAR, hak sahiplerinin ticari markalarıdır.
