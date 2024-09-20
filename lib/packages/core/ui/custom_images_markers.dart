import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<BitmapDescriptor> getAssetImageMarker() {
  return BitmapDescriptor.asset(
    const ImageConfiguration(
      size: Size(50, 50),
    ),
    'assets/icons/custom_location_pin.png',
  );
}

Future<BitmapDescriptor> getNetworkImageMarker() async {
  final res = await Dio().get(
    'https://www.iconsdb.com/icons/preview/purple/marker-xxl.png',
    options: Options(
      responseType: ResponseType.bytes,
    ),
  );

  // Resize image
  final imageCodec = await instantiateImageCodec(res.data, targetHeight: 50);
  final frame = await imageCodec.getNextFrame();
  final data = await frame.image.toByteData(
    format: ImageByteFormat.png,
  );

  if (data == null) {
    getAssetImageMarker();
  }

  return BitmapDescriptor.bytes(
    data!.buffer.asUint8List(),
  );
}
