import '../domain/models/treatment.dart';

final List<Treatment> treatments = [
  Treatment(
    id: '1',
    name: 'Sülük Tedavisi',
    description: 'Tıbbi sülüklerin salgıladığı enzimler kan dolaşımını düzenler, iltihabı azaltır ve ağrıyı hafifletir.',
    imageUrl: 'assets/images/treatments/suluk.jpeg',
  ),
  Treatment(
    id: '2',
    name: 'Hacamat',
    description: 'Cilt üzerinde küçük kesikler açılarak vakumla kirli kan alınır, bağışıklık sistemini güçlendirir ve toksinleri atar.',
    imageUrl: 'assets/images/treatments/hacamat.jpg',
  ),
  Treatment(
    id: '3',
    name: 'Akupunktur',
    description: 'Vücudun belirli noktalarının ince iğnelerle uyarılmasıyla ağrı ve stres azaltılır. Sinir sistemini dengeleyerek genel sağlığa olumlu katkı sağlar.',
    imageUrl: 'assets/images/treatments/ak.jpg',
  ),
  Treatment(
    id: '4',
    name: 'Mezoterapi',
    description: 'Cilt altına vitamin, mineral ve çeşitli ilaç karışımları enjekte edilerek uygulanan bu yöntem, genellikle cilt yenileme, selülit ve saç dökülmesi tedavisinde tercih edilir.',
    imageUrl: 'assets/images/treatments/mezo.jpg',
  ),
];
