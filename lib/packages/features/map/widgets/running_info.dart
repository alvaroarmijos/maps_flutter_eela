import 'package:flutter/material.dart';

class RunningInfo extends StatelessWidget {
  const RunningInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ItemInfo(
              icon: 'assets/icons/velocity_icon.png',
              label: 'km',
              value: '10',
            ),
            VerticalDivider(
              color: Colors.grey[200],
            ),
            const ItemInfo(
              icon: 'assets/icons/fire_icon.png',
              label: 'kcal',
              value: '5',
            ),
            VerticalDivider(
              color: Colors.grey[200],
            ),
            const ItemInfo(
              icon: 'assets/icons/running_icon.png',
              label: 'km/hr',
              value: '15',
            ),
          ],
        ),
      ),
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final String icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon),
          const SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: textTheme.titleMedium,
              ),
              Text(
                label,
                style: textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
