part of 'gps_bloc.dart';

sealed class GpsEvent {}

class GpsInitialStatusEvent extends GpsEvent {}

class ChangeGpsStatusEvent extends GpsEvent {}

class AskLocationPermissionsEvent extends GpsEvent {}
