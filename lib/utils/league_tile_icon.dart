import 'package:flutter/material.dart';

class LeagueTileIcon extends StatelessWidget {
  final String leagueLogo;
  final String leagueName;
  final Color? textColor;
  const LeagueTileIcon({
    super.key,
    required this.leagueLogo,
    required this.leagueName,
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logo
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(255, 52, 37, 37),
          ),
          child: Image.asset(
            leagueLogo,
            height: 40,
            width: 40,
            color: textColor,
          ),
        ),

        const SizedBox(height: 8),
        // Name
        Text(
          leagueName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
