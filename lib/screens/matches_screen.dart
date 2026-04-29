import 'package:flutter/material.dart';
import 'package:scoore/models/match_card.dart';
import 'package:scoore/models/match_model.dart';
import 'package:scoore/utils/league_section_header.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  Map<String, List<MatchResult>> get _matchesByLeague => {
    'Premier League': [
      MatchResult(
        homeTeam: 'MUN',
        homeLogo: 'assets/icons/serieavector.png',
        homeScore: 2,
        awayTeam: 'AVL',
        awayLogo: 'assets/icons/mlsvector.png',
        awayScore: 0,
        status: 'FT',
        stadium: 'Old Trafford',
        league: 'Premier League',
        leagueLogo: 'assets/icons/Vectorchamps.png',
      ),
      MatchResult(
        homeTeam: 'CHE',
        homeLogo: 'assets/icons/Vectorchamps.png',
        homeScore: 1,
        awayTeam: 'MCI',
        awayLogo: 'assets/icons/serieavector.png',
        awayScore: 2,
        status: 'FT',
        stadium: 'Craven Cottage',
        league: 'Premier League',
        leagueLogo: 'assets/icons/laligavector.png',
      ),
      MatchResult(
        homeTeam: 'FUL',
        homeLogo: 'assets/icons/mlsvector.png',
        homeScore: 3,
        awayTeam: 'MCI',
        awayLogo: 'assets/icons/serieavector.png',
        awayScore: 0,
        status: 'FT',
        stadium: 'Craven Cottage',
        league: 'Premier League',
        leagueLogo: 'assets/icons/laligavector.png',
      ),
      MatchResult(
        homeTeam: 'FUL',
        homeLogo: 'assets/icons/Vectorchamps.png',
        homeScore: 4,
        awayTeam: 'MCI',
        awayLogo: 'assets/icons/mlsvector.png',
        awayScore: 1,
        status: 'FT',
        stadium: 'Old Trafford',
        league: 'Premier League',
        leagueLogo: 'assets/icons/laligavector.png',
      ),
    ],
    'La Liga': [
      MatchResult(
        homeTeam: 'BAR',
        homeLogo: 'assets/icons/mlsvector.png',
        homeScore: 0,
        awayTeam: 'ATM',
        awayLogo: 'assets/icons/Vectorchamps.png',
        awayScore: 4,
        status: 'FT',
        stadium: 'Camp Nou',
        league: 'La Liga',
        leagueLogo: 'assets/icons/serieavector.png',
      ),
      MatchResult(
        homeTeam: 'BAR',
        homeLogo: 'assets/icons/mlsvector.png',
        homeScore: 3,
        awayTeam: 'ATM',
        awayLogo: 'assets/icons/Vectorchamps.png',
        awayScore: 1,
        status: 'FT',
        stadium: 'Camp Nou',
        league: 'La Liga',
        leagueLogo: 'assets/icons/serieavector.png',
      ),
      MatchResult(
        homeTeam: 'BAR',
        homeLogo: 'assets/icons/mlsvector.png',
        homeScore: 1,
        awayTeam: 'ATM',
        awayLogo: 'assets/icons/Vectorchamps.png',
        awayScore: 2,
        status: 'FT',
        stadium: 'Camp Nou',
        league: 'La Liga',
        leagueLogo: 'assets/icons/serieavector.png',
      ),
      MatchResult(
        homeTeam: 'BAR',
        homeLogo: 'assets/icons/mlsvector.png',
        homeScore: 4,
        awayTeam: 'ATM',
        awayLogo: 'assets/icons/Vectorchamps.png',
        awayScore: 2,
        status: 'FT',
        stadium: 'Camp Nou',
        league: 'La Liga',
        leagueLogo: 'assets/icons/serieavector.png',
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/blurbg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Matches',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.calendar_today, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          children: _matchesByLeague.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LeagueHeader(
                  leagueName: entry.key,
                  leagueLogo: _matchesByLeague[entry.key]!.first.leagueLogo,
                ),
                ...entry.value.map((match) => MatchResultCard(match: match)),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
