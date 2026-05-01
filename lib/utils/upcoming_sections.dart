import 'package:flutter/material.dart';
import '../models/upcoming_match.dart';
import '../services/sports_service.dart';

class UpcomingsSection extends StatefulWidget {
  const UpcomingsSection({super.key});

  @override
  State<UpcomingsSection> createState() => _UpcomingsSectionState();
}

class _UpcomingsSectionState extends State<UpcomingsSection> {
  final SportsService _service = SportsService();
  List<UpcomingMatch> _matches = [];
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
      final matches = await _service.getUpcomingMatches();
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Upcomings',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          height: 160,
          child: _buildContent(),
        ),
      ],
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.red),
      );
    }

    if (_error != null) {
      return Center(
        child: Text(_error!, style: const TextStyle(color: Colors.red)),
      );
    }

    if (_matches.isEmpty) {
      return const Center(
        child: Text(
          'No upcoming matches',
          style: TextStyle(color: Colors.white54),
        ),
      );
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _matches.length,
      itemBuilder: (context, index) =>
          _UpcomingCard(match: _matches[index]),
    );
  }
}

class _UpcomingCard extends StatelessWidget {
  final UpcomingMatch match;
  const _UpcomingCard({required this.match});

  String _formatDate(String utcDate) {
    final dt = DateTime.parse(utcDate).toLocal();
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${days[dt.weekday - 1]}, ${dt.day} ${months[dt.month - 1]}';
  }

  String _formatTime(String utcDate) {
    final dt = DateTime.parse(utcDate).toLocal();
    final hour = dt.hour.toString().padLeft(2, '0');
    final minute = dt.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date + time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDate(match.utcDate),
                style: const TextStyle(color: Colors.white54, fontSize: 11),
              ),
              Text(
                _formatTime(match.utcDate),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Home team
          Row(
            children: [
              Image.network(
                match.homeCrest,
                height: 24,
                width: 24,
                errorBuilder: (_, __, ___) => const SizedBox(width: 24),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  match.homeTla,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),
          const Text('vs', style: TextStyle(color: Colors.white38, fontSize: 12)),
          const SizedBox(height: 4),

          // Away team
          Row(
            children: [
              Image.network(
                match.awayCrest,
                height: 24,
                width: 24,
                errorBuilder: (_, __, ___) => const SizedBox(width: 24),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  match.awayTla,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const Spacer(),

          // League name
          Text(
            match.leagueName,
            style: const TextStyle(color: Colors.white38, fontSize: 10),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}