import 'package:flutter/material.dart';
import 'package:flutter_maps_eela/packages/core/ui/colors.dart';

class ManualMarker extends StatelessWidget {
  const ManualMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        Center(
          child: Icon(
            Icons.location_on_rounded,
            size: 48,
            color: AppColors.primary,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 32,
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Confirmar'),
            ),
          ),
        )
      ],
    );
  }
}
