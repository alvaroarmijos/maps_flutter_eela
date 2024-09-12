part of 'map_cubit.dart';

class MapState {
  const MapState({
    this.isMapInitialized = false,
  });

  final bool isMapInitialized;

  MapState copyWith({
    bool? isMapInitialized,
  }) {
    return MapState(
      isMapInitialized: isMapInitialized ?? this.isMapInitialized,
    );
  }
}
