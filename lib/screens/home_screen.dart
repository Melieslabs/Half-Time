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
          backgroundColor: const Color(0xFF1A0A0A),
          elevation: 0,
          width: 300,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile section
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white12)),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.red[900],
                        child: const Text(
                          'U',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Football Fan',
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Navigation links
                _DrawerSection(title: 'Navigation'),
                _DrawerItem(
                  icon: Icons.home_outlined,
                  label: 'Home',
                  onTap: () {},
                ),
                _DrawerItem(
                  icon: Icons.sports_soccer,
                  label: 'Matches',
                  onTap: () {},
                ),
                _DrawerItem(
                  icon: Icons.newspaper_outlined,
                  label: 'News',
                  onTap: () {},
                ),
                _DrawerItem(
                  icon: Icons.settings_outlined,
                  label: 'Settings',
                  onTap: () {},
                ),

                const Divider(color: Colors.white12, height: 32),

                // Favourite leagues
                _DrawerSection(title: 'Favourite Leagues'),
                _DrawerLeagueItem(
                  logo: 'assets/icons/Vectorchamps.png',
                  name: 'Champions League',
                ),
                _DrawerLeagueItem(
                  logo: 'assets/icons/mlsvector.png',
                  name: 'MLS',
                ),
                _DrawerLeagueItem(
                  logo: 'assets/icons/laligavector.png',
                  name: 'La Liga',
                ),
                _DrawerLeagueItem(
                  logo: 'assets/icons/serieavector.png',
                  name: 'Serie A',
                ),

                const Divider(color: Colors.white12, height: 32),

                // Notifications
                _DrawerSection(title: 'Preferences'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.notifications_outlined,
                            color: Colors.white54,
                            size: 20,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Notifications',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Switch(
                        value: true,
                        onChanged: (_) {},
                        activeThumbColor: Colors.red[400],
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // App version
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'GoalLine v1.0.0',
                    style: TextStyle(color: Colors.white24, fontSize: 12),
                  ),
                ),
              ],
            ),
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

class _DrawerSection extends StatelessWidget {
  final String title;
  const _DrawerSection({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: Colors.white38,
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white54, size: 20),
      title: Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
      onTap: onTap,
      dense: true,
    );
  }
}

class _DrawerLeagueItem extends StatelessWidget {
  final String logo;
  final String name;
  const _DrawerLeagueItem({required this.logo, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(logo, height: 20, width: 20),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
      dense: true,
    );
  }
}
