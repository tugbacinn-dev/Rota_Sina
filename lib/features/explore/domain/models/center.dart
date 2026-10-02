class HealthCenter {
  final String id;
  final String name;
  final String city;
  final CenterType type;
  final double latitude;
  final double longitude;

  const HealthCenter({
    required this.id,
    required this.name,
    required this.city,
    required this.type,
    required this.latitude,
    required this.longitude,
  });

  static List<HealthCenter> centers = [
    HealthCenter(
      id: '1',
      name: 'Pendik Tıp Merkezi',
      city: 'İstanbul',
      type: CenterType.healing,
      latitude: 40.8742,
      longitude: 29.2373,
    ),
    HealthCenter(
      id: '2',
      name: 'Doğal Hayat Polikliniği',
      city: 'Ankara',
      type: CenterType.health,
      latitude: 39.9334,
      longitude: 32.8597,
    ),
    HealthCenter(
      id: '3',
      name: 'Aktif Hayat Tıp Merkezi',
      city: 'Bursa',
      type: CenterType.life,
      latitude: 40.1885,
      longitude: 29.0610,
    ),
  ];
}

enum CenterType { healing, health, life }
