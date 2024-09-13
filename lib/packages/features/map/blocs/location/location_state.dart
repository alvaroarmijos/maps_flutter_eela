part of 'location_bloc.dart';

class LocationState {
  const LocationState({
    this.lastKnownLocation,
    this.myLocationHistory = const [],
  });

  final LatLng? lastKnownLocation;
  final List<LatLng> myLocationHistory;

  LocationState copyWith({
    LatLng? lastKnownLocation,
    List<LatLng>? myLocationHistory,
  }) {
    return LocationState(
      lastKnownLocation: lastKnownLocation ?? this.lastKnownLocation,
      myLocationHistory: myLocationHistory ?? this.myLocationHistory,
    );
  }
}
