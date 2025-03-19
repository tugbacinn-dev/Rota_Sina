import '../domain/models/medical_center.dart';

final List<MedicalCenter> medicalCenters = [
  MedicalCenter(
    id: '1',
    name: 'Pendik Tıp Merkezi',
    address: 'Batı Mahallesi, Erol Kaya Caddesi No:77, 34890 Pendik/İstanbul',
    phone: '0216 354 12 34',
    rating: 4.8,
    services: [
      'Akupunktur',
      'Hacamat',
      'Ozon Terapi',
      'Mezoterapi',
      'Proloterapi',
      'PRP'
    ],
    latitude: 40.8774,
    longitude: 29.2319,
    imageUrl: 'assets/images/centers/pendiktip.jpg',
  ),
  MedicalCenter(
    id: '2',
    name: 'Doğal Hayat Polikliniği',
    address: 'Oğuzlar Mahallesi Ceyhun Atuf Kansu Cad, 1370. Sk. No:12, 06520 Balgat, Çankaya/Ankara',
    phone: '0216 491 56 78',
    rating: 4.7,
    services: [
      'Akupunktur',
      'Kupa Terapi',
      'Sülük Tedavisi',
      'Fitoterapi',
      'Kayropraktik',
      'Biyorezonans'
    ],
    latitude: 39.9019,
    longitude: 32.8131,
    imageUrl: 'assets/images/centers/dogalhayat.jpg',
  ),
  MedicalCenter(
    id: '3',
    name: 'Aktif Hayat Tıp Merkezi',
    address: 'Yeni Karaman Mah. Sanayi Cad. No:105 H Mudanya Yolu Üzeri Umi Plaza Giriş Katı, 16160 Osmangazi/Bursa',
    phone: '0216 783 90 12',
    rating: 4.9,
    services: [
      'Akupunktur',
      'Apiterapi',
      'Hirudoterapi',
      'Homeopati',
      'Ozon Terapi',
      'Mezoterapi'
    ],
    latitude: 40.2308,
    longitude: 29.0017,
    imageUrl: 'assets/images/centers/hayattip.png',
  ),
];
