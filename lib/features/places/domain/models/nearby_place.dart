import 'package:flutter/material.dart';

enum PlaceType {
  cultural,
  historical,
  natural,
  restaurant,
  cafe,
}

class NearbyPlace {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double latitude;
  final double longitude;
  final double rating;
  double distance;
  final String type;

  NearbyPlace({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    required this.rating,
    required this.type,
    this.distance = 0,
  });
}
