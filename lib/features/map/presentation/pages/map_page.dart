import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rota_sina/l10n/app_localizations.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController _controller;

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(39.9334, 32.8597), // Ankara coordinates
    zoom: 11.0,
  );

  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('getat1'),
      position: LatLng(39.9334, 32.8597),
      infoWindow: InfoWindow(title: 'GETAT Merkezi 1'),
    ),
    const Marker(
      markerId: MarkerId('getat2'),
      position: LatLng(39.9234, 32.8497),
      infoWindow: InfoWindow(title: 'GETAT Merkezi 2'),
    ),
    const Marker(
      markerId: MarkerId('getat3'),
      position: LatLng(39.9434, 32.8697),
      infoWindow: InfoWindow(title: 'GETAT Merkezi 3'),
    ),
  };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.map),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        markers: _markers,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        mapToolbarEnabled: true,
        zoomControlsEnabled: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
} 