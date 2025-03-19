class Treatment {
  final String id;
  final String name;
  final String description;
  final String? imageUrl;

  const Treatment({
    required this.id,
    required this.name,
    required this.description,
    this.imageUrl,
  });
}
