import 'package:flutter/material.dart';
import 'package:scoore/models/match_model.dart';

class MatchResultCard extends StatelessWidget {
  final MatchResult match;
  const MatchResultCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1A1A),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          // League name
          Text(
            match.league,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),

          const SizedBox(height: 10),

          // Score row — 3 equal sections
          IntrinsicHeight(
            child: Row(
              children: [
                // Home team — left third
                Expanded(
                  child: _TeamColumn(
                    logo: match.homeLogo,
                    name: match.homeTeam,
                    align: CrossAxisAlignment.start,
                  ),
                ),

                // Score + status — center third
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${match.homeScore}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF3A2A2A),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              match.status,
                              style: TextStyle(
                                color: match.status == 'FT'
                                    ? Colors.white70
                                    : Colors.red[400],
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${match.awayScore}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        match.stadium,
                        style: const TextStyle(
                          color: Colors.white38,
                          fontSize: 11,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                // Away team — right third
                Expanded(
                  child: _TeamColumn(
                    logo: match.awayLogo,
                    name: match.awayTeam,
                    align: CrossAxisAlignment.end,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TeamColumn extends StatelessWidget {
  final String logo;
  final String name;
  final CrossAxisAlignment align;

  const _TeamColumn({
    required this.logo,
    required this.name,
    required this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: align,
      children: [
        Image.asset(logo, height: 32, width: 32),
        const SizedBox(height: 6),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}