import 'package:flutter/material.dart';
import 'package:scoore/models/upcoming_match.dart';

class UpcomingMatchCard extends StatelessWidget {
  final UpcomingMatch match;
  const UpcomingMatchCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade700),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date + Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                match.date,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
              Text(
                match.time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Home team
          _TeamRow(logo: match.homeLogo, name: match.homeName),

          const SizedBox(height: 10),

          // Away team
          _TeamRow(logo: match.awayLogo, name: match.awayName),

          const SizedBox(height: 16),

          // League · Stadium
          Text(
            '${match.league} · ${match.stadium}',
            style: const TextStyle(color: Colors.white38, fontSize: 11),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _TeamRow extends StatelessWidget {
  final String logo;
  final String name;
  const _TeamRow({required this.logo, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(logo, height: 28, width: 28),
        const SizedBox(width: 10),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}