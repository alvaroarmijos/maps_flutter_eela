part of 'gps_bloc.dart';

class GpsState {
  GpsState({
    this.isGpsEnable = false,
    this.isGpsPermissionsGranted = false,
  });

  final bool isGpsEnable;
  final bool isGpsPermissionsGranted;
}
