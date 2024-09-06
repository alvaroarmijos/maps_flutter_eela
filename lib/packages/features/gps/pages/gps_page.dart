import 'package:flutter/material.dart';
import 'package:flutter_maps_eela/packages/features/gps/widgets/message_gps.dart';
import 'package:flutter_maps_eela/packages/features/gps/widgets/permissions_gps.dart';

class GpsPage extends StatelessWidget {
  const GpsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const showPermission = false;
    return const Scaffold(
      body: showPermission ? PermissionsGps() : MessageGps(),
    );
  }
}
