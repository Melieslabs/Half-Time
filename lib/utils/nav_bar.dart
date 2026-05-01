import 'package:flutter/material.dart';
import 'package:scoore/screens/matches_screen.dart';
import 'package:scoore/screens/settings_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MatchesScreen()),
      ).then((_) => setState(() => _selectedIndex = 0));
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsScreen()),
      ).then((_) => setState(() => _selectedIndex = 0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: const TextStyle(color: Colors.red),
      unselectedLabelStyle: const TextStyle(color: Colors.grey),
      selectedItemColor: Colors.red[400],
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: false,
      selectedFontSize: 15,
      iconSize: 27,
      backgroundColor: Colors.black.withAlpha(179),
      currentIndex: _selectedIndex,
      onTap: onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/home_button.png',
            height: 24,
            width: 24,
            color: _selectedIndex == 0 ? Colors.red[400] : Colors.grey,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/matches_button.png',
            height: 24,
            width: 24,
            color: _selectedIndex == 1 ? Colors.red[400] : Colors.grey,
          ),
          label: "Matches",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/setting_button.png',
            height: 24,
            width: 24,
            color: _selectedIndex == 2 ? Colors.red[400] : Colors.grey,
          ),
          label: "Settings",
        ),
      ],
    );
  }
}
