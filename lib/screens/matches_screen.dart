import 'package:flutter/material.dart';
import '../models/live_match.dart';
import '../services/sports_service.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  final SportsService _service = SportsService();
  Map<String, List<LiveMatch>> _matchesByLeague = {};
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    setState(() => _isLoading = true);
    try {
      final matches = await _service.getTodaysMatches();
      setState(() {
        _matchesByLeague = matches;
        _isLoading = false;
        _error = null;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/blurbg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Matches',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh, color: Colors.white),
              onPressed: _fetch,
            ),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator(color: Colors.red));
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Connection timed out',
              style: TextStyle(color: Colors.white54),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetch,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_matchesByLeague.isEmpty) {
      return const Center(
        child: Text(
          'No matches today',
          style: TextStyle(color: Colors.white54),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _fetch,
      child: ListView(
        children: _matchesByLeague.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // League header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    Image.network(
                      entry.value.first.leagueEmblem,
                      height: 24,
                      width: 24,
                      errorBuilder: (_, __, ___) => const SizedBox(width: 24),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      entry.key,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Match cards for this league
              ...entry.value.map((match) => _MatchCard(match: match)),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _MatchCard extends StatelessWidget {
  final LiveMatch match;
  const _MatchCard({required this.match});

  String _formatTime(String utcDate) {
    final dt = DateTime.parse(utcDate).toLocal();
    final hour = dt.hour.toString().padLeft(2, '0');
    final minute = dt.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  Color get _statusColor {
    switch (match.status) {
      case 'IN_PLAY':
        return Colors.red;
      case 'PAUSED':
        return Colors.orange;
      case 'FINISHED':
        return Colors.grey;
      default:
        return Colors.transparent;
    }
  }

  String get _statusLabel {
    switch (match.status) {
      case 'IN_PLAY':
        return 'LIVE';
      case 'PAUSED':
        return 'HT';
      case 'FINISHED':
        return 'FT';
      default:
        return _formatTime(match.utcDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isScheduled = match.status == 'TIMED' || match.status == 'SCHEDULED';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1A1A),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          // Home team
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  match.homeTla,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Image.network(
                  match.homeCrest,
                  height: 28,
                  width: 28,
                  errorBuilder: (_, __, ___) => const SizedBox(width: 28),
                ),
              ],
            ),
          ),

          // Score or time — center
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: isScheduled
                ? Text(
                    _formatTime(match.utcDate),
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Column(
                    children: [
                      Text(
                        '${match.homeScore ?? 0} - ${match.awayScore ?? 0}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: _statusColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _statusLabel,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),

          // Away team
          Expanded(
            child: Row(
              children: [
                Image.network(
                  match.awayCrest,
                  height: 28,
                  width: 28,
                  errorBuilder: (_, __, ___) => const SizedBox(width: 28),
                ),
                const SizedBox(width: 8),
                Text(
                  match.awayTla,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
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
