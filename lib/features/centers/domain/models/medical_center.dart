class MedicalCenter {
  final String name;
  final String address;
  final double rating;
  final String imageUrl;
  final List<String> services;
  final String mapsUrl;

  const MedicalCenter({
    required this.name,
    required this.address,
    required this.rating,
    required this.imageUrl,
    required this.services,
    required this.mapsUrl,
  });
}
