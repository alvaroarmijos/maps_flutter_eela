part of 'location_bloc.dart';

class LocationState {
  const LocationState({
    this.lastKnownLocation,
  });

  final LatLng? lastKnownLocation;

  LocationState copyWith({
    LatLng? lastKnownLocation,
  }) {
    return LocationState(
      lastKnownLocation: lastKnownLocation ?? this.lastKnownLocation,
    );
  }
}
