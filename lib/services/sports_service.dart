import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/live_match.dart';

class SportsService {
  static const String _host = 'free-api-live-football-data.p.rapidapi.com';
  static const String _apiKey = 'ff8d313775msh287db38c39382cbp114146jsne4e2b497d613';

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
}