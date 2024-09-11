part of 'gps_bloc.dart';

class GpsState {
  GpsState({
    this.isGpsEnable = false,
    this.isGpsPermissionsGranted = false,
  });

  final bool isGpsEnable;
  final bool isGpsPermissionsGranted;

  bool get isAllEnable => isGpsEnable && isGpsPermissionsGranted;

  GpsState copyWith({
    bool? isGpsEnable,
    bool? isGpsPermissionsGranted,
  }) {
    return GpsState(
      isGpsEnable: isGpsEnable ?? this.isGpsEnable,
      isGpsPermissionsGranted:
          isGpsPermissionsGranted ?? this.isGpsPermissionsGranted,
    );
  }
}
