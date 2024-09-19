part of 'search_cubit.dart';

class SearchState {
  const SearchState({
    this.showManualMarker = false,
    this.isLoading = false,
    this.route,
  });

  final bool showManualMarker;
  final Route? route;
  final bool isLoading;

  SearchState copyWith({
    bool? showManualMarker,
    Route? route,
    bool? isLoading,
  }) {
    return SearchState(
      showManualMarker: showManualMarker ?? this.showManualMarker,
      route: route ?? this.route,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
