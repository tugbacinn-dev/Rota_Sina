# RotaSina (Şifanın Rotası)

**RotaSina**, Türkiye'nin köklü Geleneksel ve Tamamlayıcı Tıp (GETAT) mirasını modern sağlık turizmi ve kültürel keşifle birleştiren; yerli ve yabancı turistlerin akredite tedavi merkezlerine, güvenilir tamamlayıcı ürünlere ve kişiselleştirilmiş gezi rotalarına erişmesini sağlayan **"İyileş ve Gez" Odaklı Dijital Sağlık Turizmi Mobil Platformu'dur**.

---

## 🏆 Yarışma ve Proje Bilgisi

* **Organizasyon:** TEKNOFEST 
* **Yarışma:** Turizm Teknolojileri Yarışması
* **Alt Kategori:** Sürdürülebilir Turizm Uygulamaları
* **Takım Adı:** İNOVA (Takım ID: 577885 / Başvuru ID: 3052213)
* **Başarı / Derece:** Finalist
* **Konsept:** Türkiye'de yasal çerçevede kabul gören 15 GETAT yöntemini dijitalleştirerek sağlık turistlerinin karşılaştığı dil engeli, merkez güvenilirliği ve yanlış bilgilendirme problemlerine sürdürülebilir, akıllı bir turizm çözümü getirmektedir.

---

## 🚀 Temel Modüller ve Özellikler

### 🌿 1. Akredite GETAT Merkez Doğrulama & Randevu Sistemi
* **Doğrulanmış Klinik Ağı:** Yalnızca T.C. Sağlık Bakanlığı standartlarına ve uluslararası akreditasyonlara sahip resmi GETAT merkezlerini listeler; merdiven altı ve yetkisiz uygulamaların önüne geçer.
* **Kapsamlı Tedavi Yelpazesi:** Akupunktur, sülük tedavisi (hirudoterapi), kupa terapisi (hacamat), fitoterapi ve ozon tedavisi gibi yasal GETAT branşlarına göre filtreleme imkânı sunar.
* **Dinamik Randevu & İnceleme:** Kullanıcı yorumları, puanlama şeffaflığı ve doğrudan randevu oluşturma altyapısı sağlar.

### 🗺️ 2. "İyileş ve Gez" (Sağlık & Kültür Entegrasyonu)
* **Hibrit Rota Oluşturucu:** Sağlık turistlerinin yalnızca klinik ziyaretiyle sınırlı kalmasını engelleyerek, tedavi merkezinin çevresindeki tarihi eserleri, müzeleri, milli parkları ve kültürel lokasyonları harita üzerinden anlık mesafelerle önerir (Örn: Topkapı Sarayı, Gülhane Parkı, Kız Kulesi).
* **Dinamik Mesafe Analizi:** Tedavi merkezi seçildiği anda çevredeki turistik yerleri `X.X km` uzaklık metriğiyle listeler ve rota rehberliği sağlar.

### 🛍️ 3. Doğal & Sertifikalı Ürün Pazar Yeri
* **Tedavi Sonrası Destek:** Tedavi süreçlerini destekleyici bitkisel yağlar, doğal kremler, vitaminler ve aromaterapi ürünleri için güvenilir bir pazar yeri alanı sunar.
* **Yerel Üretici Ağı:** Yalnızca analiz raporlu ve sertifikalı yerel üreticileri sisteme dahil ederek hem yerel üretimi destekler hem de yabancı turist için güvenli alışveriş zinciri kurar.

### 🌐 4. Çok Dilli ve Erişilebilir Seyahat Deneyimi
* **Dil Engeline Çözüm:** Sağlık turistlerinin GETAT terminolojisini, klinik açıklamalarını ve doktor tavsiyelerini kendi ana dillerinde anlamalarını sağlayan çok dilli altyapı desteği.
* **Kullanıcı Dostu Arayüz:** Sadeleştirilmiş kart tasarımları, semptom/tedavi bazlı hızlı arama ve rehber modülü.

---


## 🔄 Algoritma ve Süreç Akışı

```text
[ BAŞLA ]
    │
    ▼
[ Giriş / Üye Ol ] ──(Hatalı)──► [ Şifremi Unuttum / Yenile ]
    │ (Başarılı)
    ▼
[ Ana Sayfa Dashboard ]
    │
    ├──► [ Tedaviler & Branşlar ] ──► [ Akredite Merkezler ] ──► [ Randevu Oluştur ]

    │
    ├──► [ Pazar Yeri ] ──────────► [ Sertifikalı Doğal Ürünler ] ──► [ Sepet & Ödeme ]
    │
    ├──► [ İyileş ve Gez ] ──────► [ Merkez Seçimi ] ──► [ Yakındaki Tarihi / Turistik Rota ]
    │
    └──► [ Kullanıcı Profili ] ────► [ Randevu & Sipariş Geçmişi ] ──► [ ÇIKIŞ / BİTİŞ ]
```


## 🛠️ Teknik Altyapı ve Mimarî

* **Geliştirme Çerçevesi (Framework):** Flutter (Dart SDK) — Tek bir kod tabanı üzerinden çok platformlu (Cross-Platform) arayüz yönetimi
* **Ekran ve Bileşen Yapısı:** Tekrar kullanılabilir (Reusable) Widget mimarisi, modüler sayfa yönlendirmeleri (`routes` yapısı) ve kullanıcı dostu arayüz hiyerarşisi.
* **Veri ve İçerik Yönetimi:** Yerel varlık kütüphaneleri (`assets/images`), çevrimdışı görsel önbellekleme ve harita/lokasyon listeleme mantığı
* **Bağımlılık Yönetimi:** `pubspec.yaml` üzerinden yönetilen harici paket mimarisi ve sürüm kontrolü
* **Kod Kalitesi ve Standartlar:** `analysis_options.yaml` konfigürasyonuyla uygulanan resmi Flutter/Dart linting kuralları

  ---


  ## 👥 İNOVA Proje Ekibi

* **Beyza Kurt** 
* **Zeynep Kapsız** 
* **Şahika Elif Yıldıran**
* **Tuğba Cin** 

---

> *RotaSina, Türkiye'nin geleneksel şifa mirasını modern teknolojilerle dünyaya açmak ve turizmde sürdürülebilir bir katma değer üretmek amacıyla geliştirilmektedir.

