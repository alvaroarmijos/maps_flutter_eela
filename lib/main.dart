import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_eela/packages/core/ui/theme.dart';
import 'package:flutter_maps_eela/packages/features/gps/bloc/gps_bloc.dart';
import 'package:flutter_maps_eela/packages/features/gps/pages/gps_page.dart';
import 'package:flutter_maps_eela/packages/features/map/blocs/location/location_bloc.dart';
import 'package:flutter_maps_eela/packages/features/map/blocs/map/map_cubit.dart';
import 'package:flutter_maps_eela/packages/features/map/pages/map_page.dart';

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
        create: (context) => GpsBloc()
          ..add(GpsInitialStatusEvent())
          ..add(ChangeGpsStatusEvent()),
        child: const LoadingPage(),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GpsBloc, GpsState>(
      builder: (context, state) {
        return state.isAllEnable
            ? MultiBlocProvider(
                providers: [
                  BlocProvider(
                    lazy: false,
                    create: (context) =>
                        LocationBloc()..add(InitialLocationEvent()),
                  ),
                  BlocProvider(
                    create: (context) => MapCubit(),
                  ),
                ],
                child: const MapPage(),
              )
            : const GpsPage();
      },
    );
  }
}
