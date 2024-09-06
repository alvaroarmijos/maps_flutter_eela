import 'package:flutter/material.dart';
import 'package:flutter_maps_eela/packages/core/ui/theme.dart';
import 'package:flutter_maps_eela/packages/features/gps/pages/gps_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: AppTheme.light,
      home: const GpsPage(),
    );
  }
}
