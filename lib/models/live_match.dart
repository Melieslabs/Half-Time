class LiveMatch {
  final int id;
  final int? leagueId;
  final String homeName;
  final int homeScore;
  final String awayName;
  final int awayScore;
  final String scoreStr;
  final String liveTime;
  final bool finished;

  LiveMatch({
    required this.id,
    required this.leagueId,
    required this.homeName,
    required this.homeScore,
    required this.awayName,
    required this.awayScore,
    required this.scoreStr,
    required this.liveTime,
    required this.finished,
  });

  factory LiveMatch.fromJson(Map<String, dynamic> json) {
    final status = json['status'];

    return LiveMatch(
      id: json['id'],
      leagueId: json['leagueId'] as int?,
      homeName: json['home']['name'],
      homeScore: json['home']['score'],
      awayName: json['away']['name'],
      awayScore: json['away']['score'],
      scoreStr: status['scoreStr'],
      liveTime: status['liveTime']['short'],
      finished: status['finished'],
    );
  }
}
