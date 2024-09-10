import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  GpsBloc() : super(GpsState()) {
    on<GpsInitialStatusEvent>((event, emit) async {
      print('GpsInitialStatusEvent');

      // Usar libreria ver el estado del GPS
      final gpsEnable = await Geolocator.isLocationServiceEnabled();
      emit(
        GpsState(isGpsEnable: gpsEnable),
      );
    });
  }
}
