import 'package:flutter/material.dart';

class MatchHighlight {
  final String thumbnail;
  final String title;
  final String score;
  final String leagueLogo;
  final String homeLogo;
  final String awayLogo;

  MatchHighlight({
    required this.thumbnail,
    required this.title,
    required this.score,
    required this.leagueLogo,
    required this.homeLogo,
    required this.awayLogo,
  });
}

class MatchHighlightsSection extends StatelessWidget {
  MatchHighlightsSection({super.key});

  final List<MatchHighlight> highlights = [
    MatchHighlight(
      thumbnail: 'assets/icons/mlsvector.png',
      title: 'Real Madrid 2 - 0 Real Sociedad | LaLiga 24/25',
      score: '2 - 0',
      leagueLogo: 'assets/icons/mlsvector.png',
      homeLogo: 'assets/icons/mlsvector.png',
      awayLogo: 'assets/icons/mlsvector.png',
    ),
    MatchHighlight(
      thumbnail: 'assets/icons/mlsvector.png',
      title: 'Barcelona 3 - 1 Atletico | LaLiga 24/25',
      score: '3 - 1',
      leagueLogo: 'assets/icons/laligavector.png',
      homeLogo: 'assets/icons/mlsvector.png',
      awayLogo: 'assets/icons/mlsvector.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Match Highlights',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Horizontal scroll
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: highlights.length,
            itemBuilder: (context, index) =>
                _HighlightCard(highlight: highlights[index]),
          ),
        ),
      ],
    );
  }
}

class _HighlightCard extends StatelessWidget {
  final MatchHighlight highlight;
  const _HighlightCard({required this.highlight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        width: 220,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF2A1A1A),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    highlight.thumbnail,
                    height: 120,
                    width: 220,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.7),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // League logo — top left
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Image.asset(
                      highlight.leagueLogo,
                      height: 20,
                      width: 20,
                    ),
                  ),

                  // Score badge — bottom left
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Row(
                      children: [
                        Image.asset(highlight.homeLogo, height: 18, width: 18),
                        const SizedBox(width: 6),
                        Text(
                          highlight.score,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Image.asset(highlight.awayLogo, height: 18, width: 18),
                      ],
                    ),
                  ),

                  // Play button — center
                  Positioned.fill(
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Title below thumbnail
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                highlight.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
