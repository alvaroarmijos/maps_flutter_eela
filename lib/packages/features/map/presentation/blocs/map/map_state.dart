part of 'map_cubit.dart';

class MapState {
  const MapState({
    this.isMapInitialized = false,
    this.polylines = const {},
    this.isPolylineShown = true,
  });

  final bool isMapInitialized;
  final Map<String, Polyline> polylines;
  final bool isPolylineShown;

  MapState copyWith({
    bool? isMapInitialized,
    Map<String, Polyline>? polylines,
    bool? isPolylineShown,
  }) {
    return MapState(
      isMapInitialized: isMapInitialized ?? this.isMapInitialized,
      polylines: polylines ?? this.polylines,
      isPolylineShown: isPolylineShown ?? this.isPolylineShown,
    );
  }
}
