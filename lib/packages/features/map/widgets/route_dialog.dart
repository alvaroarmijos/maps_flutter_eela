import 'package:flutter/material.dart';

void showLoadingMessage(BuildContext context) {
  showAdaptiveDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return const AlertDialog.adaptive(
        title: Text('Espere por favor...'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Calculando ruta'),
            SizedBox(
              height: 8,
            ),
            CircularProgressIndicator.adaptive(),
          ],
        ),
      );
    },
  );
}
