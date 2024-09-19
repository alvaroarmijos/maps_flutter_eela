import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_eela/packages/core/ui/colors.dart';
import 'package:flutter_maps_eela/packages/features/map/blocs/cubit/search_cubit.dart';
import 'package:flutter_maps_eela/packages/features/map/blocs/location/location_bloc.dart';
import 'package:flutter_maps_eela/packages/features/map/blocs/map/map_cubit.dart';

import 'route_dialog.dart';

class ManualMarker extends StatelessWidget {
  const ManualMarker({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();
    return BlocConsumer<SearchCubit, SearchState>(
      listenWhen: (previous, current) =>
          previous.isLoading != current.isLoading,
      listener: _listenerState,
      builder: (context, state) {
        if (!state.showManualMarker) return const SizedBox();
        return Stack(
          children: [
            SafeArea(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {
                    searchCubit.updateShowManualMarker(false);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            Center(
              child: Transform.translate(
                offset: const Offset(0, -22),
                child: Icon(
                  Icons.location_on_rounded,
                  size: 48,
                  color: AppColors.primary,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 32,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    final start =
                        context.read<LocationBloc>().state.lastKnownLocation;
                    if (start == null) return;

                    final end = context.read<MapCubit>().mapCenter;
                    if (end == null) return;
                    searchCubit.getRoute(start, end);
                    searchCubit.updateShowManualMarker(false);
                  },
                  child: const Text('Confirmar'),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void _listenerState(BuildContext context, SearchState state) {
    if (state.route != null && state.route!.points != null) {
      context.read<MapCubit>().addRoutePolyline(state.route!.points!);
    }

    if (state.isLoading) {
      showLoadingMessage(context);
    } else {
      Navigator.maybePop(context);
    }
  }
}
