import 'package:flutter/material.dart';
import 'package:rota_sina/features/centers/data/centers_data.dart';
import 'package:rota_sina/l10n/app_localizations.dart';
import 'dart:math';

class HealAndExplorePage extends StatefulWidget {
  final String centerName;
  final double centerLatitude;
  final double centerLongitude;

  const HealAndExplorePage({
    super.key,
    required this.centerName,
    required this.centerLatitude,
    required this.centerLongitude,
  });

  @override
  State<HealAndExplorePage> createState() => _HealAndExplorePageState();
}

class _HealAndExplorePageState extends State<HealAndExplorePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedCenterName = '';
  double _selectedLatitude = 0;
  double _selectedLongitude = 0;

  final List<NearbyPlace> _nearbyPlaces = [];
  final List<NearbyPlace> _culturalPlaces = [];
  final List<NearbyPlace> _historicalPlaces = [];
  final List<NearbyPlace> _naturalPlaces = [];
  final List<NearbyPlace> _restaurants = [];
  final List<NearbyPlace> _cafes = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _selectedCenterName = widget.centerName;
    _selectedLatitude = widget.centerLatitude;
    _selectedLongitude = widget.centerLongitude;
    _updatePlacesForCity(_getCityFromCenterName(_selectedCenterName));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showCenterSelectionDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.selectCenter),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('İstanbul Merkez'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HealAndExplorePage(
                      centerName: 'İstanbul Merkez',
                      centerLatitude: 41.0082,
                      centerLongitude: 28.9784,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Ankara Merkez'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HealAndExplorePage(
                      centerName: 'Ankara Merkez',
                      centerLatitude: 39.9334,
                      centerLongitude: 32.8597,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Bursa Merkez'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HealAndExplorePage(
                      centerName: 'Bursa Merkez',
                      centerLatitude: 40.1885,
                      centerLongitude: 29.0610,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _updatePlacesForCity(String city) {
    _nearbyPlaces.clear();
    _culturalPlaces.clear();
    _historicalPlaces.clear();
    _naturalPlaces.clear();
    _restaurants.clear();
    _cafes.clear();

    switch (city.toLowerCase()) {
      case 'istanbul':
        _nearbyPlaces.addAll([
          NearbyPlace(
            id: '1',
            name: 'Ayasofya',
            description: 'Tarihi müze ve cami',
            imageUrl: 'assets/images/places/hagia_sophia.jpg',
            rating: 4.8,
            type: 'historical',
            latitude: 41.0086,
            longitude: 28.9802,
          ),
          // ... other Istanbul places
        ]);
        break;
      case 'ankara':
        _nearbyPlaces.addAll([
          NearbyPlace(
            id: '10',
            name: 'Anıtkabir',
            description: 'Atatürk\'ün mozolesi',
            imageUrl: 'assets/images/places/anitkabir.jpg',
            rating: 4.9,
            type: 'historical',
            latitude: 39.9250,
            longitude: 32.8369,
          ),
          // ... other Ankara places
        ]);
        break;
      case 'bursa':
        _nearbyPlaces.addAll([
          NearbyPlace(
            id: '20',
            name: 'Ulu Cami',
            description: 'Tarihi cami',
            imageUrl: 'assets/images/places/ulu_cami.jpg',
            rating: 4.7,
            type: 'historical',
            latitude: 40.1836,
            longitude: 29.0639,
          ),
          // ... other Bursa places
        ]);
        break;
    }

    _updateDistances();
    _categorizePlaces();
  }

  void _updateDistances() {
    for (var place in _nearbyPlaces) {
      place.distance = _calculateDistance(
        _selectedLatitude,
        _selectedLongitude,
        place.latitude,
        place.longitude,
      );
    }
  }

  void _categorizePlaces() {
    for (var place in _nearbyPlaces) {
      switch (place.type) {
        case 'cultural':
          _culturalPlaces.add(place);
          break;
        case 'historical':
          _historicalPlaces.add(place);
          break;
        case 'natural':
          _naturalPlaces.add(place);
          break;
        case 'restaurant':
          _restaurants.add(place);
          break;
        case 'cafe':
          _cafes.add(place);
          break;
      }
    }
  }

  List<NearbyPlace> _getPlacesForCategory(String category) {
    switch (category) {
      case 'cultural':
        return _culturalPlaces;
      case 'historical':
        return _historicalPlaces;
      case 'natural':
        return _naturalPlaces;
      case 'restaurants':
        return _restaurants;
      case 'cafes':
        return _cafes;
      default:
        return _nearbyPlaces;
    }
  }

  String _getCityFromCenterName(String centerName) {
    return centerName.split(' ')[0];
  }

  double _calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double earthRadius = 6371; // Radius of the earth in km

    double dLat = _degreesToRadians(lat2 - lat1);
    double dLon = _degreesToRadians(lon2 - lon1);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double _degreesToRadians(double degree) {
    return degree * pi / 180;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(l10n.healAndExplore),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/heal_and_explore_header.jpg',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    onPressed: () => _showCenterSelectionDialog(context, l10n),
                    icon: const Icon(Icons.location_on),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      padding: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
              bottom: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: [
                  Tab(text: l10n.nearbyPlaces),
                  Tab(text: l10n.culturalPlaces),
                  Tab(text: l10n.historicalPlaces),
                  Tab(text: l10n.naturalPlaces),
                  Tab(text: l10n.restaurants),
                  Tab(text: l10n.cafes),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildPlacesGrid(l10n, theme, 'nearby'),
            _buildPlacesGrid(l10n, theme, 'cultural'),
            _buildPlacesGrid(l10n, theme, 'historical'),
            _buildPlacesGrid(l10n, theme, 'natural'),
            _buildPlacesGrid(l10n, theme, 'restaurants'),
            _buildPlacesGrid(l10n, theme, 'cafes'),
          ],
        ),
      ),
    );
  }

  Widget _buildPlacesGrid(AppLocalizations l10n, ThemeData theme, String category) {
    final places = _getPlacesForCategory(category);

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: places.length,
      itemBuilder: (context, index) {
        final place = places[index];
        return _buildPlaceCard(place, theme, l10n);
      },
    );
  }

  Widget _buildPlaceCard(NearbyPlace place, ThemeData theme, AppLocalizations l10n) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  place.imageUrl,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          place.rating.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    place.description,
                    style: theme.textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.distance(place.distance.toStringAsFixed(1)),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NearbyPlace {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double rating;
  final String type;
  final double latitude;
  final double longitude;
  double distance;

  NearbyPlace({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.type,
    required this.latitude,
    required this.longitude,
    this.distance = 0,
  });
}
