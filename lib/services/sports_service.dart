import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/live_match.dart';
import '../models/upcoming_match.dart';

class SportsService {
  static const String _baseUrl = 'https://api.football-data.org/v4';
  static const String _apiKey = 'b816eb49997348fb83dee583ef90c72c ';

  static const _headers = {'X-Auth-Token': _apiKey};

  Future<List<LiveMatch>> getLiveMatches() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/matches?status=IN_PLAY,PAUSED'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<dynamic> matches = body['matches'];
      return matches.map((json) => LiveMatch.fromJson(json)).toList();
    } else {
      throw Exception('Failed: ${response.statusCode}');
    }
  }

  Future<Map<String, List<LiveMatch>>> getTodaysMatches() async {
  try {
    final response = await http.get(
      Uri.parse('$_baseUrl/matches'),
      headers: _headers,
    ).timeout(const Duration(seconds: 30));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<dynamic> matches = body['matches'];

      final allMatches = matches
          .map((json) => LiveMatch.fromJson(json))
          .toList();

      final Map<String, List<LiveMatch>> grouped = {};
      for (final match in allMatches) {
        grouped.putIfAbsent(match.leagueName, () => []);
        grouped[match.leagueName]!.add(match);
      }

      return grouped;
    } else {
      throw Exception('Failed: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}

  Future<List<UpcomingMatch>> getUpcomingMatches() async {
    final competitions = ['PL', 'CL', 'PD', 'SA'];
    final List<UpcomingMatch> allMatches = [];

    for (final code in competitions) {
      try {
        final response = await http
            .get(
              Uri.parse(
                '$_baseUrl/competitions/$code/matches?status=SCHEDULED',
              ),
              headers: _headers,
            )
            .timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          final List<dynamic> matches = body['matches'];
          allMatches.addAll(
            matches.map((json) => UpcomingMatch.fromJson(json)).toList(),
          );
        }
      } catch (e) {
        continue;
      }
    }

    allMatches.sort((a, b) => a.utcDate.compareTo(b.utcDate));
    return allMatches.take(20).toList();
  }
}
