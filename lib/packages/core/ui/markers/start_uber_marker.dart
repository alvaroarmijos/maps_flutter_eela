import 'package:flutter/material.dart';
import 'package:flutter_maps_eela/packages/core/ui/colors.dart';

class StartUberMarker extends CustomPainter {
  final String time;

  StartUberMarker({super.repaint, required this.time});

  @override
  void paint(Canvas canvas, Size size) {
    final paintPurple = Paint()..color = AppColors.primary;
    final paintWhite = Paint()..color = Colors.white;

    const radiusPurple = 20.0;
    const radiusWhite = 8.0;

    // Circulo morado
    canvas.drawCircle(
      Offset(radiusPurple, size.height - radiusPurple),
      radiusPurple,
      paintPurple,
    );

    // Circulo blanco
    canvas.drawCircle(
      Offset(radiusPurple, size.height - radiusPurple),
      radiusWhite,
      paintWhite,
    );

    // Caja blanca
    final path = Path();
    path.moveTo(radiusPurple * 2, 20);
    path.lineTo(size.width - 10, 20);
    path.lineTo(size.width - 10, 100);
    path.lineTo(radiusPurple * 2, 100);

    canvas.drawShadow(
      path,
      Colors.black,
      10,
      false,
    );

    canvas.drawPath(path, paintWhite);

    // Caja morada
    const purpleBox = Rect.fromLTWH(
      radiusPurple * 2,
      20,
      70,
      80,
    );
    canvas.drawRect(purpleBox, paintPurple);

    /// Textos --------------------------
    /// Minutos
    final textSpan = TextSpan(
      text: time,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w400,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(
        minWidth: 70,
        maxWidth: 70,
      );

    textPainter.paint(canvas, const Offset(40, 40));

    // label
    const textLabelSpan = TextSpan(
      text: 'min',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w300,
      ),
    );

    final textlabelPainter = TextPainter(
      text: textLabelSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(
        minWidth: 70,
        maxWidth: 70,
      );

    textlabelPainter.paint(canvas, const Offset(42, 70));

    // Nombre del lugar
    final textPlaceSpan = TextSpan(
      text: 'Estadio Reina del Cisne',
      style: TextStyle(
        color: AppColors.primary,
        fontSize: 18,
        fontWeight: FontWeight.w300,
      ),
    );

    final textPlacePainter = TextPainter(
      text: textPlaceSpan,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    )..layout(
        minWidth: size.width - 100,
        maxWidth: size.width - 100,
      );

    textPlacePainter.paint(canvas, const Offset(120, 50));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
