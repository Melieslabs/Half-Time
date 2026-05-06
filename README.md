# ⚽ GoalLine

A clean, real-time football live score app built with Flutter. GoalLine keeps you up to date with live scores, upcoming fixtures, and results across the world's biggest leagues — all in one place.

> Built by [@notkingmelies](https://twitter.com/notkingmelies)

---

## Screenshots

<!-- ![Home Screen](assets/screenshots/home.png) -->
<!-- ![Matches Screen](assets/screenshots/matches.png) -->
<!-- ![Settings Screen](assets/screenshots/settings.png) -->

---

## Features

- **Live Scores** — real-time scores across multiple competitions, updates every 60 seconds
- **Half Time / Full Time Indicators** — clear HT and FT badges on every match card
- **Upcoming Fixtures** — horizontally scrollable upcoming matches across Premier League, Champions League, La Liga and Serie A
- **Matches Screen** — today's full fixture list grouped by league with team crests
- **League Icons** — Champions League, MLS, La Liga, Serie A navigation tiles
- **Match Highlights Section** — horizontally scrollable highlights cards
- **Settings Screen** — notification preferences, odds format, match time display, favourite leagues
- **Side Drawer** — quick navigation, favourite leagues, app preferences
- **Pull to Refresh** — manual refresh on the matches screen

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter |
| Language | Dart |
| Live Scores | [football-data.org API](https://www.football-data.org) |
| HTTP Client | `http` package |
| State Management | `StatefulWidget` + `setState` |
| Navigation | `BottomNavigationBar` + `Navigator` |

---

## Architecture

```
lib/
├── models/
│   ├── live_match.dart         ← live score data model
│   └── upcoming_match.dart     ← upcoming fixture data model
├── services/
│   └── sports_service.dart     ← all API communication
├── screens/
│   ├── home_screen.dart        ← live scores + upcomings + highlights
│   ├── matches_screen.dart     ← today's fixtures grouped by league
│   └── settings_screen.dart   ← user preferences
└── utils/
    ├── live_score_card.dart    ← live match card widget
    ├── live_scores_section.dart ← live scores section with polling
    ├── upcoming_section.dart   ← upcoming fixtures horizontal scroll
    ├── match_highlights.dart   ← highlights section
    ├── league_tile_icon.dart   ← league icon + label widget
    └── league_tiles.dart      ← row of league icons
```

---

## API

GoalLine uses [football-data.org](https://www.football-data.org) for all match data.

| Endpoint | Usage |
|---|---|
| `GET /v4/matches?status=IN_PLAY,PAUSED` | Live scores |
| `GET /v4/matches` | Today's fixtures |
| `GET /v4/competitions/{code}/matches?status=SCHEDULED` | Upcoming fixtures |

Competitions covered: Premier League (`PL`), Champions League (`CL`), La Liga (`PD`), Serie A (`SA`).

---

## Getting Started

### Prerequisites
- Flutter SDK (stable)
- A free API key from [football-data.org](https://www.football-data.org)

### Setup

```bash
# Clone the repo
git clone https://github.com/Melieslabs/Goal-Line.git
cd Goal-Line

# Install dependencies
flutter pub get

# Add your API key
# Open lib/services/sports_service.dart
# Replace YOUR_KEY with your football-data.org token
static const String _apiKey = 'YOUR_KEY';

# Run the app
flutter run
```

---

## Lessons Learned

- How to structure a Flutter app around a REST API using a Service → Model → UI pattern
- How to handle async data with `FutureBuilder` and manual state management
- How to use `Timer.periodic` for live score polling without draining API quotas
- How to parse nested JSON into typed Dart models
- How to group flat API responses by league for display
- How to handle network timeouts gracefully per-request

---

## Roadmap

- [ ] Match detail screen with lineups and events
- [ ] Push notifications for goals
- [ ] Favourite teams personalisation
- [ ] Dark/light theme toggle
- [ ] Search for teams and players

---

## Author

**Emelie** — [@notkingmelies](https://twitter.com/notkingmelies)

Built under [Melieslabs](https://github.com/Melieslabs)

---

## License

MIT