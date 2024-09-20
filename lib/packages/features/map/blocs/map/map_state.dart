part of 'map_cubit.dart';

class MapState {
  const MapState({
    this.isMapInitialized = false,
    this.polylines = const {},
    this.markers = const {},
    this.isPolylineShown = true,
  });

  final bool isMapInitialized;
  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;
  final bool isPolylineShown;

  MapState copyWith({
    bool? isMapInitialized,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers,
    bool? isPolylineShown,
  }) {
    return MapState(
      isMapInitialized: isMapInitialized ?? this.isMapInitialized,
      polylines: polylines ?? this.polylines,
      markers: markers ?? this.markers,
      isPolylineShown: isPolylineShown ?? this.isPolylineShown,
    );
  }
}
