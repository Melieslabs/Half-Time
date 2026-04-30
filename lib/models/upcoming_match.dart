class UpcomingMatch {
  final int id;
  final int? leagueId;
  final String homeName;
  final String awayName;
  final String time;

  UpcomingMatch({
    required this.id,
    required this.leagueId,
    required this.homeName,
    required this.awayName,
    required this.time,
  });

  factory UpcomingMatch.fromJson(Map<String, dynamic> json) {
    return UpcomingMatch(
      id: json['id'],
      leagueId: json['leagueId'] as int?,
      homeName: json['home']['name'],
      awayName: json['away']['name'],
      time: json['time'],
    );
  }
}