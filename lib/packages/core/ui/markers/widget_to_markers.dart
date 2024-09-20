import 'dart:ui';

import 'package:flutter_maps_eela/packages/core/ui/markers/start_uber_marker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<BitmapDescriptor> getStartUberMarker(String time) async {
  final recorder = PictureRecorder();
  final canvas = Canvas(recorder);
  const size = Size(350, 150);

  final startUberMarker = StartUberMarker(time: time);

  startUberMarker.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(350, 150);
  final byteData = await image.toByteData(
    format: ImageByteFormat.png,
  );

  // Resize image
  final imageCodec = await instantiateImageCodec(byteData!.buffer.asUint8List(),
      targetHeight: 80);
  final frame = await imageCodec.getNextFrame();
  final data = await frame.image.toByteData(
    format: ImageByteFormat.png,
  );

  return BitmapDescriptor.bytes(data!.buffer.asUint8List());
}
