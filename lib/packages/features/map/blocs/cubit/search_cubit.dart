import 'package:bloc/bloc.dart';
import 'package:flutter_maps_eela/packages/data/routes/domain/routes.dart';
import 'package:flutter_maps_eela/packages/data/routes/infrastructure/routes_repository_impl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  final routeRepository = RoutesRepositoryImpl();

  void updateShowManualMarker(bool newValue) {
    emit(state.copyWith(showManualMarker: newValue));
  }

  void getRoute(LatLng start, LatLng end) async {
    emit(state.copyWith(isLoading: true));
    final route = await routeRepository.getRouteStartToEnd(start, end);

    if (route == null) return;

    emit(state.copyWith(route: route, isLoading: false));
  }

  void searchPlaces(LatLng proximity, String query) async {
    final response = await routeRepository.searchPlaces(proximity, query);
  }
}
