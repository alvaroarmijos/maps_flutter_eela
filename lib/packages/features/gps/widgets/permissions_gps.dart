import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_eela/packages/features/gps/bloc/gps_bloc.dart';

class PermissionsGps extends StatelessWidget {
  const PermissionsGps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/enable_gps.png',
              width: 200,
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              'Ubicación',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              '''
              Necesitamos acceder a tu ubicacion para mostrarte tus rutas e informacion de tu rendimiento''',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<GpsBloc>().add(AskLocationPermissionsEvent());
              },
              child: const Text('Solicitar Permisos'),
            ),
          ],
        ),
      ),
    );
  }
}
