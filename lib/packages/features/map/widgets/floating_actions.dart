import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_eela/packages/features/map/blocs/location/location_bloc.dart';
import 'package:flutter_maps_eela/packages/features/map/blocs/map/map_cubit.dart';

class FloatingActions extends StatelessWidget {
  const FloatingActions({super.key});

  @override
  Widget build(BuildContext context) {
    final mapCubit = context.read<MapCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton.small(
          onPressed: () {
            mapCubit.togglePolylineShown();
          },
          child: const Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        FloatingActionButton.small(
          onPressed: () {
            final position =
                context.read<LocationBloc>().state.lastKnownLocation;
            if (position == null) return;
            mapCubit.moveCamera(position);
          },
          child: const Icon(
            Icons.gps_fixed,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
