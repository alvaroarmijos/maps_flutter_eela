import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_eela/packages/core/ui/theme.dart';
import 'package:flutter_maps_eela/packages/features/gps/bloc/gps_bloc.dart';
import 'package:flutter_maps_eela/packages/features/gps/pages/gps_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: AppTheme.light,
      home: BlocProvider(
        lazy: false,
        create: (context) => GpsBloc()..add(GpsInitialStatusEvent()),
        child: const GpsPage(),
      ),
    );
  }
}
