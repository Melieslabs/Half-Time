import 'package:flutter/material.dart';
import 'package:scoore/utils/league_tile_icon.dart';


class LeagueTiles extends StatelessWidget {
  const LeagueTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const LeagueTileIcon(
          leagueLogo: 'assets/icons/Vectorchamps.png',
          textColor: Colors.white,
          leagueName: 'Champions',
        ),

        const LeagueTileIcon(
          leagueLogo: 'assets/icons/mlsvector.png',
          leagueName: 'MLS',
        ),
        const LeagueTileIcon(
          leagueLogo: 'assets/icons/laligavector.png',
          leagueName: 'La Liga',
        ),
        const LeagueTileIcon(
          leagueLogo: 'assets/icons/serieavector.png',
          leagueName: 'Serie A',
        ),
      ],
    );
  }
}