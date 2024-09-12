part of 'location_bloc.dart';

sealed class LocationEvent {}

class InitialLocationEvent extends LocationEvent {}

class StartTrackingUserEvent extends LocationEvent {}
