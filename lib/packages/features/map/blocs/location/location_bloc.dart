import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(const LocationState()) {
    on<InitialLocationEvent>(_onInitialLocationEvent);
    on<StartTrackingUserEvent>(_onStartTrackingUserEvent);
  }

  FutureOr<void> _onInitialLocationEvent(
      InitialLocationEvent event, Emitter<LocationState> emit) async {
    final position = await Geolocator.getCurrentPosition();
    emit(
      state.copyWith(
        lastKnownLocation: LatLng(position.latitude, position.longitude),
      ),
    );
  }

  FutureOr<void> _onStartTrackingUserEvent(
      StartTrackingUserEvent event, Emitter<LocationState> emit) {
    return emit.forEach(
      Geolocator.getPositionStream(
          // Modificar de acuerdo a lo que se necesite
          // locationSettings: LocationSettings(
          //   distanceFilter: 100,
          // )
          ),
      onData: (position) {
        return state.copyWith(
          lastKnownLocation: LatLng(position.latitude, position.longitude),
        );
      },
    );
  }
}
