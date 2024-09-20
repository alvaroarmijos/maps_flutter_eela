import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_eela/packages/core/ui/ui.dart';
import 'package:flutter_maps_eela/packages/features/map/blocs/location/location_bloc.dart';
import 'package:flutter_maps_eela/packages/features/map/blocs/map/map_cubit.dart';
import 'package:flutter_maps_eela/packages/features/map/widgets/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mapCubit = context.read<MapCubit>();
    return Scaffold(
      body: BlocConsumer<LocationBloc, LocationState>(
        listener: (context, state) {
          if (state.lastKnownLocation != null) {
            // mapCubit.moveCamera(state.lastKnownLocation!);
          }

          if (state.myLocationHistory.isNotEmpty) {
            mapCubit.addUserPolyline(state.myLocationHistory);
          }
        },
        buildWhen: (previous, current) =>
            previous.lastKnownLocation != current.lastKnownLocation,
        builder: (context, state) {
          final lastKnownLocation = state.lastKnownLocation;

          if (lastKnownLocation == null) {
            return const Center(
              child: Text('Espere por favor...'),
            );
          }

          return BlocBuilder<MapCubit, MapState>(
            builder: (context, mapState) {
              /// {
              ///   myRoute: NewPolyline1,
              ///   directions: Polyline2,
              /// }
              ///
              ///
              ///
              ////// {
              ///   directions: Polyline2,
              /// }
              /// Obtiene todos los valores de las polylines
              // final polylines = mapState.polylines.values.toSet();

              final polylines = Map<String, Polyline>.from(mapState.polylines);

              if (!mapState.isPolylineShown) {
                polylines.removeWhere((key, polyline) => key == 'myRoute');
              }

              return Stack(
                children: [
                  GoogleMap(
                    style: jsonEncode(mapStyle),
                    myLocationButtonEnabled: false,
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: lastKnownLocation,
                      zoom: 18,
                    ),
                    polylines: polylines.values.toSet(),
                    markers: mapState.markers.values.toSet(),
                    onMapCreated: (controller) =>
                        mapCubit.onMapInitialized(controller),
                    onCameraMove: (cameraPosition) {
                      mapCubit.mapCenter = cameraPosition.target;
                    },
                  ),
                  const SearchBarInfo(),
                  const ManualMarker(),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: const FloatingActions(),
    );
  }
}
