# Arşivci for macOS

Windows'taki WinRAR'ın pratik arşiv işlevlerini macOS'un doğal arayüzüyle birleştirmeyi amaçlayan açık kaynak bir arşiv yöneticisi.

> **Durum: erken geliştirme (0.1.0 test).** Proje [MacRAR](https://github.com/mstcvk/MacRAR) temel alınarak geliştirilir. Arşivci adı, ayrı bundle kimliği ve Finder eylemleri kaynak koda işlendi; henüz imzalı ve noter onaylı genel sürüm yayımlanmadı.

## Hedefler

- Finder'da dosya ve klasörlere sağ tıklayarak ZIP/7z arşivi oluşturma
- Arşivlerde **Buraya çıkart**, **Aynı adla klasöre çıkart**, **Klasör gibi aç** seçenekleri
- Arşivleri tamamen çıkarmadan içerik listesi, arama, önizleme ve seçili dosyaları çıkarma
- Şifreli ve çok parçalı arşivler, bütünlük testi, ilerleme göstergesi
- Türkçe ve İngilizce arayüz, Apple Silicon ve Intel desteği

## İlk teknik durum

MacBook Air M4 üzerinde Swift 6.4 ile derlenen uygulamada 46 test geçti. RAR açma ve seçili öğeyi çıkarma ile 7z sıkıştırma elle doğrulandı. arm64 ve x86_64 desteği var. Finder eylemlerinin kurulum ve kullanım testi henüz yapılmadı.

## Kaynaktan derleme

macOS 13+ ve Apple Command Line Tools gereklidir.

    SEVENZIP_VERSION=2606 ./fetch-tools.sh
    ./build.sh

Çıktı **build/Arşivci.app** konumundadır. `./build.sh` yalnızca derler ve var olan MacRAR kurulumunu değiştirmez. Finder menülerini kurmak için uygulamanın `/Applications` altında olması gerekir. **`./build.sh install` henüz yalnızca kontrollü test için kullanılmalıdır**; aynı isimde uygulama varsa üzerine yazmadan durur.

## Yol haritası

- [x] Başlangıç kodunu derleme ve temel testler
- [x] Arşivci adı, ayrı uygulama kimliği ve sürümleme
- [x] Finder sağ tık menülerinin Arşivci adıyla düzenlenmesi (kaynak kod)
- [x] RAR açma, yalnız seçileni çıkarma ve 7z sıkıştırma M4 testi
- [ ] Finder sağ tık menülerinin M4 üzerinde kurulum ve testleri
- [ ] Özgün Arşivci simgesi
- [ ] Arşivi klasör benzeri pencerede açma deneyiminin iyileştirilmesi
- [ ] İlk imzalı test paketi ve GitHub Releases

## Lisans ve atıf

Bu çalışma [MacRAR](https://github.com/mstcvk/MacRAR) (© 2026 Mesut Çevik, MIT lisansı) kaynak koduna dayalıdır. Özgün LICENSE dosyası ve telif bildirimi korunur. MacRAR projesiyle resmî bir bağlantımız yoktur.

7-Zip (7zz) ayrı bir bileşendir; kendi lisansına tabidir ve kaynak depoda ikili dosya olarak tutulmaz. RAR oluşturma için gereken RARLAB aracı da dağıtılmaz. WinRAR ve RAR, hak sahiplerinin ticari markalarıdır.