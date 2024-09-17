import 'package:bloc/bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  void updateShowManualMarker() {
    emit(const SearchState(showManualMarker: true));
  }
}
