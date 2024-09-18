import 'package:bloc/bloc.dart';
import 'package:flutter_maps_eela/packages/data/routes/infrastructure/routes_repository_impl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  final routeRepository = RoutesRepositoryImpl();

  void updateShowManualMarker(bool newValue) {
    emit(SearchState(showManualMarker: newValue));
  }

  void getRoute(LatLng start, LatLng end) async {
    final route = await routeRepository.getRouteStartToEnd(start, end);

    if (route == null) return;

    final numberPoints = decodePolyline(route.geometry ?? '');

    final point = numberPoints
        .map((coordenadas) =>
            LatLng(coordenadas[0].toDouble(), coordenadas[1].toDouble()))
        .toList();

    print(point.length);
  }
}
