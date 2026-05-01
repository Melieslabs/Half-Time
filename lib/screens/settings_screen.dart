import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _matchNotifications = true;
  bool _goalAlerts = true;
  bool _favouriteTeamsOnly = false;
  bool _liveScoreUpdates = true;
  String _selectedOddsFormat = 'Decimal';
  String _selectedTimezone = 'Local Time';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
            'Settings',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Profile card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2A1A1A),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.red[900],
                    child: const Text(
                      'E',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Emelie',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Football Fan',
                        style: TextStyle(color: Colors.white38, fontSize: 13),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.edit_outlined, color: Colors.white38, size: 20),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Notifications
            _SectionHeader(title: 'Notifications'),
            _SettingsCard(
              children: [
                _SwitchTile(
                  icon: Icons.notifications_outlined,
                  label: 'Match Notifications',
                  subtitle: 'Get notified when matches start',
                  value: _matchNotifications,
                  onChanged: (val) => setState(() => _matchNotifications = val),
                ),
                _Divider(),
                _SwitchTile(
                  icon: Icons.sports_soccer,
                  label: 'Goal Alerts',
                  subtitle: 'Instant alerts when goals are scored',
                  value: _goalAlerts,
                  onChanged: (val) => setState(() => _goalAlerts = val),
                ),
                _Divider(),
                _SwitchTile(
                  icon: Icons.favorite_outline,
                  label: 'Favourite Teams Only',
                  subtitle: 'Only notify for your favourite teams',
                  value: _favouriteTeamsOnly,
                  onChanged: (val) => setState(() => _favouriteTeamsOnly = val),
                ),
                _Divider(),
                _SwitchTile(
                  icon: Icons.live_tv_outlined,
                  label: 'Live Score Updates',
                  subtitle: 'Background score updates',
                  value: _liveScoreUpdates,
                  onChanged: (val) => setState(() => _liveScoreUpdates = val),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Display
            _SectionHeader(title: 'Display'),
            _SettingsCard(
              children: [
                _DropdownTile(
                  icon: Icons.format_list_numbered,
                  label: 'Odds Format',
                  value: _selectedOddsFormat,
                  options: ['Decimal', 'Fractional', 'American'],
                  onChanged: (val) =>
                      setState(() => _selectedOddsFormat = val!),
                ),
                _Divider(),
                _DropdownTile(
                  icon: Icons.access_time_outlined,
                  label: 'Match Time',
                  value: _selectedTimezone,
                  options: ['Local Time', 'UTC'],
                  onChanged: (val) => setState(() => _selectedTimezone = val!),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Favourite leagues
            _SectionHeader(title: 'Favourite Leagues'),
            _SettingsCard(
              children: [
                _LeagueTile(
                  logo: 'assets/icons/Vectorchamps.png',
                  name: 'Champions League',
                ),
                _Divider(),
                _LeagueTile(logo: 'assets/icons/mlsvector.png', name: 'MLS'),
                _Divider(),
                _LeagueTile(
                  logo: 'assets/icons/laligavector.png',
                  name: 'La Liga',
                ),
                _Divider(),
                _LeagueTile(
                  logo: 'assets/icons/serieavector.png',
                  name: 'Serie A',
                ),
              ],
            ),

            const SizedBox(height: 24),

            // About
            _SectionHeader(title: 'About'),
            _SettingsCard(
              children: [
                _InfoTile(
                  icon: Icons.info_outline,
                  label: 'Version',
                  value: '1.0.0',
                ),
                _Divider(),
                _InfoTile(
                  icon: Icons.data_usage_outlined,
                  label: 'Data Source',
                  value: 'football-data.org',
                ),
                _Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.privacy_tip_outlined,
                    color: Colors.white54,
                    size: 20,
                  ),
                  title: const Text(
                    'Privacy Policy',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.white38,
                  ),
                  dense: true,
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// Section header
class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: Colors.white38,
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

// Card wrapper
class _SettingsCard extends StatelessWidget {
  final List<Widget> children;
  const _SettingsCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2A1A1A),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(children: children),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.white12,
      height: 1,
      indent: 16,
      endIndent: 16,
    );
  }
}

// Switch tile
class _SwitchTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchTile({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white54, size: 20),
      title: Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.white38, fontSize: 11),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.red[400],
      ),
      dense: true,
    );
  }
}

// Dropdown tile
class _DropdownTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final List<String> options;
  final ValueChanged<String?> onChanged;

  const _DropdownTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white54, size: 20),
      title: Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
      trailing: DropdownButton<String>(
        value: value,
        dropdownColor: const Color(0xFF2A1A1A),
        underline: const SizedBox(),
        style: const TextStyle(color: Colors.white70, fontSize: 13),
        items: options
            .map((o) => DropdownMenuItem(value: o, child: Text(o)))
            .toList(),
        onChanged: onChanged,
      ),
      dense: true,
    );
  }
}

// League tile
class _LeagueTile extends StatelessWidget {
  final String logo;
  final String name;
  const _LeagueTile({required this.logo, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(logo, height: 20, width: 20),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.white38),
      dense: true,
      onTap: () {},
    );
  }
}

// Info tile
class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white54, size: 20),
      title: Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
      trailing: Text(
        value,
        style: const TextStyle(color: Colors.white38, fontSize: 13),
      ),
      dense: true,
    );
  }
}
