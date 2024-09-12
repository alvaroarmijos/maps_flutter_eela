import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_eela/packages/features/map/blocs/location/location_bloc.dart';
import 'package:flutter_maps_eela/packages/features/map/blocs/map/map_cubit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mapCubit = context.read<MapCubit>();
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          final lastKnownLocation = state.lastKnownLocation;

          if (lastKnownLocation == null) {
            return const Center(
              child: Text('Espere por favor...'),
            );
          }

          return GoogleMap(
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: lastKnownLocation,
              zoom: 18,
            ),
            onMapCreated: (controller) => mapCubit.onMapInitialized(controller),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            onPressed: () {},
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
      ),
    );
  }
}
