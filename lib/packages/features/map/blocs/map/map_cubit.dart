import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps_eela/packages/core/ui/markers/widget_to_markers.dart';
import 'package:flutter_maps_eela/packages/core/ui/ui.dart';
import 'package:flutter_maps_eela/packages/data/routes/domain/routes.dart'
    as route;
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(const MapState());

  GoogleMapController? _mapController;
  LatLng? mapCenter;

  void onMapInitialized(GoogleMapController controller) {
    _mapController = controller;
    // _mapController?.setMapStyle(jsonEncode(mapStyle));
    emit(state.copyWith(
      isMapInitialized: true,
    ));
  }

  void moveCamera(LatLng position) {
    final cameraUpdate = CameraUpdate.newLatLng(position);
    _mapController?.moveCamera(cameraUpdate);
  }

  void addUserPolyline(List<LatLng> points) {
    final myRoute = Polyline(
      polylineId: const PolylineId('myRoute'),
      points: points,
      color: AppColors.primary,
      width: 5,
      endCap: Cap.roundCap,
      startCap: Cap.roundCap,
      patterns: [
        PatternItem.dot,
        PatternItem.gap(8),
      ],
    );

    /// {
    ///   myRoute: Polyline1,
    ///   directions: Polyline2,
    /// }
    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['myRoute'] = myRoute;

    /// {
    ///   myRoute: NewPolyline1,
    ///   directions: Polyline2,
    /// }
    ///
    emit(
      state.copyWith(polylines: currentPolylines),
    );
  }

  void addRoutePolyline(route.Route route) async {
    if (route.points == null) return;

    final myRoute = Polyline(
      polylineId: const PolylineId('direction'),
      points: route.points!,
      color: Colors.black,
      width: 5,
      endCap: Cap.roundCap,
      startCap: Cap.roundCap,
    );

    double distanceKm = (route.distance ?? 0) / 1000;

    int time = ((route.duration ?? 0) / 60).toInt();

    final startAssetsIcon = await getAssetImageMarker();
    final endNetworkIcon = await getNetworkImageMarker();
    final startUberMarker = await getStartUberMarker(time.toString());

    // Google Map Markers
    // Default marker
    // final startMarker = Marker(
    //   markerId: const MarkerId('start'),
    //   position: route.points!.first,
    //   infoWindow: InfoWindow(
    //     title: 'Punto de inicio',
    //     snippet: 'km $distanceKm',
    //   ),
    // );

    // // Asset marker
    // final startMarker = Marker(
    //   markerId: const MarkerId('start'),
    //   position: route.points!.first,
    //   icon: startAssetsIcon,
    //   infoWindow: InfoWindow(
    //     title: 'Punto de inicio',
    //     snippet: 'km $distanceKm',
    //   ),
    // );

    // Custom marker
    final startMarker = Marker(
      markerId: const MarkerId('start'),
      position: route.points!.first,
      icon: startUberMarker,
      anchor: const Offset(0, 0.9),
      infoWindow: InfoWindow(
        title: 'Punto de inicio',
        snippet: 'km $distanceKm',
      ),
    );

    // End markers
    // Default marker
    // final endMarker = Marker(
    //   markerId: const MarkerId('end'),
    //   position: route.points!.last,
    //   infoWindow: InfoWindow(
    //     title: 'Punto de final',
    //     snippet: 'Tiempo: $time minutos',
    //   ),
    // );

    // Network marker
    final endMarker = Marker(
      markerId: const MarkerId('end'),
      position: route.points!.last,
      icon: endNetworkIcon,
      infoWindow: InfoWindow(
        title: 'Punto de final',
        snippet: 'Tiempo: $time minutos',
      ),
    );

    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['direction'] = myRoute;

    // Asignar los nuevos marcadores al estado
    final currentMarkers = Map<String, Marker>.from(state.markers);
    currentMarkers['start'] = startMarker;
    currentMarkers['end'] = endMarker;

    emit(
      state.copyWith(
        polylines: currentPolylines,
        markers: currentMarkers,
      ),
    );
  }

  void togglePolylineShown() {
    final isPolylineShown = state.isPolylineShown;
    emit(state.copyWith(isPolylineShown: !isPolylineShown));
  }
}
