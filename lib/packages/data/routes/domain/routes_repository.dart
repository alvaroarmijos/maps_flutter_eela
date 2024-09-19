import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class RoutesRepository {
  void getRouteStartToEnd(LatLng start, LatLng end);
  void searchPlaces(LatLng proximity, String query);
}
