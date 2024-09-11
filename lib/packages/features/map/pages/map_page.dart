import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    const cameraPosition = CameraPosition(
      target: LatLng(-4.000127, -79.203592),
      zoom: 17,
    );
    return const Scaffold(
      body: GoogleMap(
        initialCameraPosition: cameraPosition,
      ),
    );
  }
}
