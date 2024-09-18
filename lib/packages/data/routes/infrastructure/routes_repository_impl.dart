import 'package:dio/dio.dart';
import 'package:flutter_maps_eela/packages/data/routes/domain/routes_repository.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';

import '../domain/directions.dart';

class RoutesRepositoryImpl extends RoutesRepository {
  final Dio _dioDirections = Dio();
  final _baseDirectionsUrl = 'https://api.mapbox.com/directions/v5/mapbox';

  @override
  Future<Route?> getRouteStartToEnd(LatLng start, LatLng end) async {
    final coorsString =
        '${start.longitude},${start.latitude};${end.longitude},${end.latitude}';

    final url = '$_baseDirectionsUrl/walking/$coorsString';

    final response = await _dioDirections.get(
      url,
      queryParameters: {
        'alternatives': false,
        'continue_straight': true,
        'geometries': 'polyline6',
        'overview': 'simplified',
        'steps': false,
        'access_token':
            'pk.eyJ1IjoibGFsbzE1OTUiLCJhIjoiY2s4OHlqajE1MDFldDNlbzd5ZGtodnQycSJ9.vMDYnNVuC5gG4g1l9nD75w'
      },
    );

    final data = Directions.fromJson(response.data);

    return data.routes?.first;
  }
}
