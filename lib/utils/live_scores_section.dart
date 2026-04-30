import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scoore/utils/live_score.dart';
import '../models/live_match.dart';
import '../services/sports_service.dart';

class LiveScoresSection extends StatefulWidget {
  const LiveScoresSection({super.key});

  @override
  State<LiveScoresSection> createState() => _LiveScoresSectionState();
}

class _LiveScoresSectionState extends State<LiveScoresSection> {
  final SportsService _service = SportsService();
  List<LiveMatch> _matches = [];
  bool _isLoading = true;
  String? _error;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _fetch();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) => _fetch());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _fetch() async {
    setState(() => _isLoading = true); // ← add this line
    try {
      final matches = await _service.getLiveMatches();
      setState(() {
        _matches = matches;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Live Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: _fetch,
                child: const Icon(Icons.refresh, color: Colors.white54),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _buildContent(),
        ),
      ],
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator(color: Colors.red));
    }

    if (_error != null) {
      return Center(
        child: Text(_error!, style: const TextStyle(color: Colors.red)),
      );
    }

    if (_matches.isEmpty) {
      return const Center(
        child: Text(
          'No live matches right now',
          style: TextStyle(color: Colors.white54),
        ),
      );
    }

    final visible = _matches.take(5).toList();
    return Column(
      children: visible.map((m) => LiveScoreCard(match: m)).toList(),
    );
  }
}
