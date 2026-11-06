# Football Cards — Prototype 0.1

A Flutter starter project for a football relationship card game inspired by shedding-card games.

## Requested famous-club distribution

- Spain / La Liga: Barcelona, Real Madrid, Atlético Madrid (3)
- Italy / Serie A: Juventus, AC Milan, Inter Milan (3)
- Germany / Bundesliga: Bayern Munich, Borussia Dortmund (2)
- England / Premier League: Manchester City, Liverpool, Arsenal, Chelsea, Manchester United, Tottenham (6)
- France / Ligue 1: Paris Saint-Germain (1)

Total: 15 famous clubs.

## What's implemented

- Flutter app shell and dark football-inspired interface.
- Local pass-and-play prototype for 2–4 players.
- Seven starting cards per player.
- Football card catalogue with the requested club distribution.
- Basic relationship validation against the immediately previous card.
- Starter special-card definitions and basic effects.
- A small set of football relationship facts.
- Basic game-engine tests.

## Important prototype limitations

This is the first playable foundation, not a finished release:
- Online multiplayer is not implemented yet.
- Wi-Fi/LAN multiplayer is not implemented yet.
- Voting is represented in the engine but needs a complete player-facing voting flow.
- Special-card rules need further balancing and QA.
- The initial football relationship catalogue is intentionally small and should be reviewed/expanded before public release.
- The initial turn UI is pass-and-play on one device; hidden-hand privacy is not yet implemented.

## Run

1. Install Flutter SDK.
2. Extract this project.
3. From the project folder run:

   ```bash
   flutter pub get
   flutter test
   flutter run
   ```

## Next development milestones

1. Complete relationship proof and challenge voting flow.
2. Improve special-card turn sequencing and UNO-style last-card rules.
3. Add proper private player hands / hot-seat privacy.
4. Add online rooms and server-authoritative game state.
5. Add local Wi-Fi rooms.
6. Expand the verified football database and add Arabic/French localization.
7. Add app icons, sound, animation, and production builds.
