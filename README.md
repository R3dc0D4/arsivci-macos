# Arşivci for macOS

Windows'taki WinRAR'ın pratik arşiv işlevlerini macOS'un doğal arayüzüyle birleştirmeyi amaçlayan açık kaynak bir arşiv yöneticisi.

> **Durum: erken geliştirme.** Bu depo, ilk teknik temel olarak [MacRAR](https://github.com/mstcvk/MacRAR) kaynak kodundan başlamaktadır. Kaynak dosyalarda hâlâ MacRAR adı ve arayüzü bulunabilir. Arşivci markalı uygulama henüz yayınlanmamıştır.

## Hedefler

- Finder'da dosya ve klasörlere sağ tıklayarak ZIP/7z arşivi oluşturma
- Arşivlerde **Buraya çıkart**, **Aynı adla klasöre çıkart**, **Klasör gibi aç** seçenekleri
- Arşivleri tamamen çıkarmadan içerik listesi, arama, önizleme ve seçili dosyaları çıkarma
- Şifreli ve çok parçalı arşivler, bütünlük testi, ilerleme göstergesi
- Türkçe ve İngilizce arayüz, Apple Silicon ve Intel desteği

## İlk teknik durum

MacBook Air M4 üzerinde başlangıç alınan MacRAR kodu Swift 6.4 ile derlendi; 46 test geçti. arm64 ve x86_64 ikili dosyaları oluşturuldu. Bu, Arşivci'nin tamamlandığı veya yayınlanmaya hazır olduğu anlamına gelmez.

## Kaynaktan derleme (mevcut başlangıç kodu)

macOS 13+ ve Apple Command Line Tools gereklidir.

    SEVENZIP_VERSION=2606 ./fetch-tools.sh
    ./build.sh

Şu aşamada çıktı **build/MacRAR.app** olarak adlandırılır. Doğrudan **./build.sh install** çalıştırılması önerilmez; mevcut MacRAR kurulumunun üzerine yazabilir. Arşivci'nin ayrı uygulama kimliği sonraki geliştirme aşamasıdır.

## Yol haritası

- [x] Başlangıç kodunu derleme ve temel testler
- [ ] Ayrı uygulama adı, kimliği ve ikon
- [ ] Finder sağ tık menülerinin Arşivci adıyla düzenlenmesi
- [ ] Sıkıştırma ve çıkarma akışlarının gerçek dosyalarla doğrulanması
- [ ] Arşivi klasör benzeri pencerede açma deneyiminin iyileştirilmesi
- [ ] İlk imzalı test paketi ve GitHub Releases

## Lisans ve atıf

Bu çalışma [MacRAR](https://github.com/mstcvk/MacRAR) (© 2026 Mesut Çevik, MIT lisansı) kaynak koduna dayalıdır. Özgün LICENSE dosyası ve telif bildirimi korunur. MacRAR projesiyle resmî bir bağlantımız yoktur.

7-Zip (7zz) ayrı bir bileşendir; kendi lisansına tabidir ve kaynak depoda ikili dosya olarak tutulmaz. RAR oluşturma için gereken RARLAB aracı da dağıtılmaz. WinRAR ve RAR, hak sahiplerinin ticari markalarıdır.
