import 'package:flutter/material.dart';
import 'package:scoore/models/match_highlights.dart';
import 'package:scoore/utils/league_tiles.dart';
import 'package:scoore/utils/nav_bar.dart';
import 'package:scoore/utils/live_scores_section.dart';
import 'package:scoore/utils/upcoming_sections.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Image.asset(
                'assets/icons/ball.png',
                height: 28,
                width: 28,
                color: Colors.lightBlue,
              ),
              const SizedBox(width: 8),
              const Text(
                'GoalLine',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        endDrawer: Drawer(
          backgroundColor: Colors.transparent,
          elevation: 0,
          width: 500,
          child: Column(
            children: [
              DrawerHeader(
                child: Text(
                  "Sport News",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(height: 90, child: NavBar()),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: LeagueTiles(),
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  const SizedBox(height: 24),
                  const LiveScoresSection(),
                  const SizedBox(height: 16),
                  UpcomingsSection(),
                  const SizedBox(height: 24),
                  MatchHighlightsSection(),
                  const SizedBox(height: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
