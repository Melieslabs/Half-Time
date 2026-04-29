import 'package:flutter/material.dart';
import 'package:scoore/utils/upcoming_match.dart';
import '../models/upcoming_match.dart';

class UpcomingsSection extends StatelessWidget {
  UpcomingsSection({super.key});

  final List<UpcomingMatch> matches = [
    UpcomingMatch(
      date: 'Mon, 26 May',
      time: '02:00 AM',
      homeName: 'BAR',
      homeLogo: 'assets/icons/laligavector.png',
      awayName: 'ATH',
      awayLogo: 'assets/icons/serieavector.png',
      league: 'La Liga',
      stadium: 'Estadion San Mames',
    ),
    UpcomingMatch(
      date: 'Mon, 1 Jun',
      time: '02:00 AM',
      homeName: 'PSG',
      homeLogo: 'assets/icons/mlsvector.png',
      awayName: 'ARS',
      awayLogo: 'assets/icons/Vectorchamps.png',
      league: 'Champions League',
      stadium: 'Final',
    ),
    UpcomingMatch(
      date: 'Mon, 9 Jun',
      time: '21:00 PM',
      homeName: 'MAN',
      homeLogo: 'assets/icons/serieavector.png',
      awayName: 'CHE',
      awayLogo: 'assets/icons/mlsvector.png',
      league: 'Champions League',
      stadium: 'Final',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 12),

        // Horizontal scroll of cards
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: matches.length,
            itemBuilder: (context, index) =>
                UpcomingMatchCard(match: matches[index]),
          ),
        ),
      ],
    );
  }
}