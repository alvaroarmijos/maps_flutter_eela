import 'package:bloc/bloc.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  GpsBloc() : super(GpsState()) {
    on<GpsInitialStatusEvent>((event, emit) {
      // Usar libreria ver el estado del GPS
    });
  }
}
