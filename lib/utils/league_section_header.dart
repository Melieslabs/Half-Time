import 'package:flutter/material.dart';

class LeagueHeader extends StatelessWidget {
  final String leagueName;
  final String leagueLogo;
  const LeagueHeader({
    super.key,
    required this.leagueName,
    required this.leagueLogo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Image.asset(leagueLogo, height: 24, width: 24),
          const SizedBox(width: 10),
          Text(
            leagueName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}