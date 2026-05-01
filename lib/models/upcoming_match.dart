class UpcomingMatch {
  final int id;
  final String homeTeam;
  final String homeCrest;
  final String homeTla;
  final String awayTeam;
  final String awayCrest;
  final String awayTla;
  final String utcDate;
  final String leagueName;
  final String leagueEmblem;

  UpcomingMatch({
    required this.id,
    required this.homeTeam,
    required this.homeCrest,
    required this.homeTla,
    required this.awayTeam,
    required this.awayCrest,
    required this.awayTla,
    required this.utcDate,
    required this.leagueName,
    required this.leagueEmblem,
  });

  factory UpcomingMatch.fromJson(Map<String, dynamic> json) {
    return UpcomingMatch(
      id: json['id'],
      homeTeam: json['homeTeam']['shortName'],
      homeCrest: json['homeTeam']['crest'],
      homeTla: json['homeTeam']['tla'],
      awayTeam: json['awayTeam']['shortName'],
      awayCrest: json['awayTeam']['crest'],
      awayTla: json['awayTeam']['tla'],
      utcDate: json['utcDate'],
      leagueName: json['competition']['name'],
      leagueEmblem: json['competition']['emblem'],
    );
  }
}
