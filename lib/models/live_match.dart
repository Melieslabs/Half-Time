class LiveMatch {
  final int id;
  final String homeTeam;
  final String homeCrest;
  final String homeTla;
  final int? homeScore;
  final String awayTeam;
  final String awayCrest;
  final String awayTla;
  final int? awayScore;
  final String status;
  final String leagueName;
  final String leagueEmblem;
  final String utcDate;

  LiveMatch({
    required this.id,
    required this.homeTeam,
    required this.homeCrest,
    required this.homeTla,
    required this.homeScore,
    required this.awayTeam,
    required this.awayCrest,
    required this.awayTla,
    required this.awayScore,
    required this.status,
    required this.leagueName,
    required this.leagueEmblem,
    required this.utcDate,
  });

  factory LiveMatch.fromJson(Map<String, dynamic> json) {
    return LiveMatch(
      id: json['id'],
      homeTeam: json['homeTeam']['shortName'],
      homeCrest: json['homeTeam']['crest'],
      homeTla: json['homeTeam']['tla'],
      homeScore: json['score']['fullTime']['home'],
      awayTeam: json['awayTeam']['shortName'],
      awayCrest: json['awayTeam']['crest'],
      awayTla: json['awayTeam']['tla'],
      awayScore: json['score']['fullTime']['away'],
      status: json['status'],
      leagueName: json['competition']['name'],
      leagueEmblem: json['competition']['emblem'],
      utcDate: json['utcDate'],
    );
  }
}