import 'package:flutter/material.dart';

class MessageGps extends StatelessWidget {
  const MessageGps({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.gps_off,
              size: 40,
              color: Colors.purple,
            ),
            SizedBox(
              height: 20,
            ),
            Text('Debes activar tu GPS'),
          ],
        ),
      ),
    );
  }
}
