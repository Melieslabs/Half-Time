class MatchResult {
  final String homeTeam;
  final String homeLogo;
  final int homeScore;
  final String awayTeam;
  final String awayLogo;
  final int awayScore;
  final String status;
  final String stadium;
  final String league;
  final String leagueLogo;

  MatchResult({
    required this.homeTeam,
    required this.homeLogo,
    required this.homeScore,
    required this.awayTeam,
    required this.awayLogo,
    required this.awayScore,
    required this.status,
    required this.stadium,
    required this.league,
    required this.leagueLogo,
  });
}