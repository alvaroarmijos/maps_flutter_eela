import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(const LocationState()) {
    on<InitialLocationEvent>(_onInitialLocationEvent);
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
}
