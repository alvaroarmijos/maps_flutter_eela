import 'package:flutter/material.dart';
import 'package:flutter_maps_eela/packages/core/ui/colors.dart';

import 'widgets.dart';

class SearchBarInfo extends StatelessWidget {
  const SearchBarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: 60,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              child: Row(
                children: [
                  RunningInfo(),
                  SearchIcon(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          onPressed: () async {
            final result = await showSearch(
              context: context,
              delegate: SearchDestionationDelegate(),
            );

            if (result?.cancel == true) return;
          },
          icon: Icon(
            Icons.search,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
