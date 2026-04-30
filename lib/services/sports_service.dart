import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scoore/models/upcoming_match.dart';
import '../models/live_match.dart';

class SportsService {
  static const String _host = 'free-api-live-football-data.p.rapidapi.com';
  static const String _apiKey =
      '8234dca3a6msh3cdc988abc0d150p1d858fjsn92133aa050e4';

  static final Map<int, String> _leagueCache = {};

  Future<List<LiveMatch>> getLiveMatches() async {
    final response = await http.get(
      Uri.parse('https://$_host/football-current-live'),
      headers: {
        'x-rapidapi-key': _apiKey,
        'x-rapidapi-host': _host,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<dynamic> live = body['response']['live'];
      return live.map((json) => LiveMatch.fromJson(json)).toList();
    } else {
      throw Exception('Failed: ${response.statusCode}');
    }
  }

  Future<String> getLeagueName(int leagueId) async {
    if (_leagueCache.containsKey(leagueId)) {
      return _leagueCache[leagueId]!;
    }

    final response = await http.get(
      Uri.parse('https://$_host/football-get-league-detail?leagueid=$leagueId'),
      headers: {
        'x-rapidapi-key': _apiKey,
        'x-rapidapi-host': _host,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final String name = body['response']['leagues']['name'];
      _leagueCache[leagueId] = name;
      return name;
    } else {
      return 'Unknown League';
    }
  }

  Future<List<UpcomingMatch>> getUpcomingMatches() async {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    final date =
        '${tomorrow.year}${tomorrow.month.toString().padLeft(2, '0')}${tomorrow.day.toString().padLeft(2, '0')}';

    final response = await http.get(
      Uri.parse('https://$_host/football-get-matches-by-date?date=$date'),
      headers: {
        'x-rapidapi-key': _apiKey,
        'x-rapidapi-host': _host,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<dynamic> matches = body['response']['matches'];
      return matches.map((json) => UpcomingMatch.fromJson(json)).toList();
    } else {
      throw Exception('Failed: ${response.statusCode}');
    }
  }
}
