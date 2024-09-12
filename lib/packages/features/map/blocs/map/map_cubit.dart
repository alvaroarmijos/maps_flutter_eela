import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(const MapState());

  GoogleMapController? _mapController;

  void onMapInitialized(GoogleMapController controller) {
    _mapController = controller;
    emit(state.copyWith(
      isMapInitialized: true,
    ));
  }

  void moveCamera(LatLng position) {
    final cameraUpdate = CameraUpdate.newLatLng(position);
    _mapController?.moveCamera(cameraUpdate);
  }
}
