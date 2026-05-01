import 'package:flutter/material.dart';
import '../models/live_match.dart';

class LiveScoreCard extends StatelessWidget {
  final LiveMatch match;
  const LiveScoreCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    final isLive = match.status == 'IN_PLAY';
    final isPaused = match.status == 'PAUSED';

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1A1A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // League name + status badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.network(
                    match.leagueEmblem,
                    height: 16,
                    width: 16,
                    errorBuilder: (_, __, ___) => const SizedBox(width: 16),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    match.leagueName,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: isLive
                      ? Colors.red
                      : isPaused
                          ? Colors.orange
                          : Colors.grey[800],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  isLive
                      ? 'LIVE'
                      : isPaused
                          ? 'HT'
                          : 'FT',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Teams + score
          Row(
            children: [
              // Home team
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      match.homeCrest,
                      height: 24,
                      width: 24,
                      errorBuilder: (_, __, ___) => const SizedBox(width: 24),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      match.homeTla,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Score
              Text(
                '${match.homeScore ?? 0} - ${match.awayScore ?? 0}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Away team
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      match.awayTla,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.network(
                      match.awayCrest,
                      height: 24,
                      width: 24,
                      errorBuilder: (_, __, ___) => const SizedBox(width: 24),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}