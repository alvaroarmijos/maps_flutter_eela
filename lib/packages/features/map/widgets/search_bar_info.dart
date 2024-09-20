import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_eela/packages/core/ui/colors.dart';
import 'package:flutter_maps_eela/packages/features/map/blocs/cubit/search_cubit.dart';
import 'package:flutter_maps_eela/packages/features/map/blocs/location/location_bloc.dart';
import 'package:flutter_maps_eela/packages/features/map/models/search_result.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'widgets.dart';

class SearchBarInfo extends StatelessWidget {
  const SearchBarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state.showManualMarker) return const SizedBox();
        return const SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  child: Row(
                    children: [
                      RunningInfo(),
                      SearchIcon(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          onPressed: () async {
            final result = await showSearch(
              context: context,
              delegate: SearchDestionationDelegate(),
            );
            if (result == null) return;
            onSearhResult(context, result);
          },
          icon: Icon(
            Icons.search,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }

  void onSearhResult(BuildContext context, SearchResult result) {
    if (result.cancel == true) return;

    if (result.manual == true) {
      context.read<SearchCubit>().updateShowManualMarker(true);
    }

    if (result.place != null) {
      final start = context.read<LocationBloc>().state.lastKnownLocation;
      if (start == null) return;
      final place = result.place;
      if (place?.center == null) return;
      final end = LatLng(place?.center![1] ?? 0.0, place?.center![0] ?? 0.0);
      context.read<SearchCubit>().getRoute(start, end);
      context.read<SearchCubit>().updateShowManualMarker(false);
    }
  }
}
