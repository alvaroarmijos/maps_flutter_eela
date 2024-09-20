import 'package:dio/dio.dart';
import 'package:flutter_maps_eela/packages/data/routes/domain/places.dart';
import 'package:flutter_maps_eela/packages/data/routes/domain/routes_repository.dart';
import 'package:flutter_maps_eela/packages/data/routes/infrastructure/directions_dto.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';

import '../domain/routes.dart';

const accessToken =
    'pk.eyJ1IjoibGFsbzE1OTUiLCJhIjoiY2s4OHlqajE1MDFldDNlbzd5ZGtodnQycSJ9.vMDYnNVuC5gG4g1l9nD75w';

class RoutesRepositoryImpl extends RoutesRepository {
  final Dio _dioDirections = Dio();
  final _baseDirectionsUrl = 'https://api.mapbox.com/directions/v5/mapbox';
  final _baseGeocodingUrl = 'https://api.mapbox.com/geocoding/v5/mapbox.places';

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
        'access_token': accessToken,
      },
    );

    final data = DirectionsDto.fromJson(response.data);

    final numberPoints =
        decodePolyline(data.routes?.first.geometry ?? '', accuracyExponent: 6);

    final points = numberPoints
        .map((coors) => LatLng(coors[0].toDouble(), coors[1].toDouble()))
        .toList();

    final route = Route(
      duration: data.routes?.first.duration,
      distance: data.routes?.first.distance,
      points: points,
    );

    return route;
  }

  @override
  Future<List<Place>?> searchPlaces(LatLng proximity, String query) async {
    final url = '$_baseGeocodingUrl/$query.json';

    final response = await _dioDirections.get(url, queryParameters: {
      'limit': 5,
      'proximity': '${proximity.longitude},${proximity.latitude}',
      'access_token': accessToken,
    });

    final data = Places.fromJson(response.data);
    return data.features;
  }
}
