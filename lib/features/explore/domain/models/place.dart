import 'center.dart';

enum PlaceType { historical, natural }

class Place {
  final String name;
  final String description;
  final String imageUrl;
  final PlaceType type;
  final double distance;

  const Place({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.distance,
  });

  static List<Place> getPlacesForCenter(HealthCenter center) {
    switch (center.city) {
      case 'İstanbul':
        return [
          Place(
            name: 'Topkapı Sarayı',
            description: 'Osmanlı İmparatorluğu\'nun yönetim merkezi olan tarihi saray.',
            imageUrl: 'assets/images/topkapi.jpg',
            type: PlaceType.historical,
            distance: 2.5,
          ),
          Place(
            name: 'Gülhane Parkı',
            description: 'İstanbul\'un en eski ve büyük parklarından biri.',
            imageUrl: 'assets/images/hane.jpg',
            type: PlaceType.natural,
            distance: 1.8,
          ),
        ];
      case 'Ankara':
        return [
          Place(
            name: 'Anıtkabir',
            description: 'Türkiye Cumhuriyeti\'nin kurucusu Mustafa Kemal Atatürk\'ün anıt mezarı.',
            imageUrl: 'assets/images/anitkabir.jpg',
            type: PlaceType.historical,
            distance: 3.0,
          ),
        ];
      case 'Bursa':
        return [
          Place(
            name: 'Ulu Cami',
            description: 'Bursa\'nın en büyük tarihi camisi.',
            imageUrl: 'assets/images/ulucami.jpg',
            type: PlaceType.historical,
            distance: 2.1,
          ),
          Place(
            name: 'Uludağ',
            description: 'Türkiye\'nin en önemli kış turizm merkezlerinden biri.',
            imageUrl: 'assets/images/uludag.jpg',
            type: PlaceType.natural,
            distance: 5.5,
          ),
        ];
      default:
        return [];
    }
  }
}
