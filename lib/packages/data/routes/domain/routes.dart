import 'package:google_maps_flutter/google_maps_flutter.dart';

class Route {
  final double? duration;
  final double? distance;
  final List<LatLng>? points;

  Route({
    this.duration,
    this.distance,
    this.points,
  });
}
