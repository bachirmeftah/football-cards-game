import 'package:flutter/material.dart';
import 'data/card_catalog.dart';
import 'game/game_engine.dart';
import 'models/card_model.dart';

void main() => runApp(const FootballCardsApp());

class FootballCardsApp extends StatelessWidget {
  const FootballCardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Cards',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF07130F),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB7F36B), brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final names = ['Player 1', 'Player 2'];
  int playerCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.sports_soccer, size: 76, color: Color(0xFFB7F36B)),
                  const SizedBox(height: 18),
                  const Text('FOOTBALL CARDS', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, letterSpacing: 2)),
                  const SizedBox(height: 8),
                  const Text('Connect football history. Play your cards.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 32),
                  const Align(alignment: Alignment.centerLeft, child: Text('Number of players')),
                  const SizedBox(height: 8),
                  SegmentedButton<int>(
                    segments: const [
                      ButtonSegment(value: 2, label: Text('2')),
                      ButtonSegment(value: 3, label: Text('3')),
                      ButtonSegment(value: 4, label: Text('4')),
                    ],
                    selected: {playerCount},
                    onSelectionChanged: (v) => setState(() => playerCount = v.first),
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(54)),
                    onPressed: () {
                      final game = GameEngine()..start(List.generate(playerCount, (i) => 'Player ${i + 1}'));
                      Navigator.push(context, MaterialPageRoute(builder: (_) => GameScreen(game: game)));
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('START LOCAL GAME'),
                  ),
                  const SizedBox(height: 12),
                  const Text('Prototype 0.1 • Local pass-and-play', style: TextStyle(color: Colors.white38, fontSize: 12)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  final GameEngine game;
  const GameScreen({super.key, required this.game});
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GameEngine get game => widget.game;

  Color _categoryColor(CardCategory category) {
    switch (category) {
      case CardCategory.club: return const Color(0xFF1D6B52);
      case CardCategory.player: return const Color(0xFF245A91);
      case CardCategory.nationalTeam:
      case CardCategory.country: return const Color(0xFF8B5A25);
      case CardCategory.competition:
      case CardCategory.league: return const Color(0xFF68499A);
      case CardCategory.manager: return const Color(0xFF8A3E59);
      case CardCategory.continent: return const Color(0xFF47766D);
      case CardCategory.event: return const Color(0xFF8B7130);
      case CardCategory.action: return const Color(0xFF9B3D35);
    }
  }

  Widget _card(FootballCard card, {bool small = false, VoidCallback? onTap, bool enabled = true}) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: small ? 94 : 112,
        height: small ? 132 : 158,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: _categoryColor(card.category),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withOpacity(.55), width: 1.2),
          boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 8, offset: Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(card.category.name.toUpperCase(), style: const TextStyle(fontSize: 8, letterSpacing: 1, fontWeight: FontWeight.bold)),
            const Spacer(),
            Center(child: Icon(card.isAction ? Icons.flash_on : Icons.sports_soccer, size: small ? 25 : 32, color: Colors.white)),
            const SizedBox(height: 7),
            Text(card.name, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(fontSize: small ? 11 : 13, fontWeight: FontWeight.w900)),
            if (card.subtitle.isNotEmpty) ...[
              const SizedBox(height: 3),
              Text(card.subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: const TextStyle(fontSize: 8, color: Colors.white70)),
            ],
          ],
        ),
      ),
    );
  }

  void _play(FootballCard card) {
    try {
      setState(() => game.playCard(card));
      if (game.winner != null) {
        showDialog(context: context, builder: (_) => AlertDialog(
          title: const Text('Full time!'),
          content: Text('${game.winner} wins the match!'),
          actions: [TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); }, child: const Text('Home'))],
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString().replaceFirst('Bad state: ', ''))));
    }
  }

  @override
  Widget build(BuildContext context) {
    final player = game.activePlayer;
    return Scaffold(
      appBar: AppBar(title: const Text('FOOTBALL CARDS'), actions: [
        IconButton(onPressed: () => setState(() => game.drawForCurrentPlayer()), icon: const Icon(Icons.add_card), tooltip: 'Draw a card'),
      ]),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(game.players.length, (i) => Column(children: [
                  CircleAvatar(backgroundColor: i == game.currentPlayer ? const Color(0xFFB7F36B) : Colors.white24, child: Text('${i + 1}', style: TextStyle(color: i == game.currentPlayer ? Colors.black : Colors.white))),
                  const SizedBox(height: 5),
                  Text(game.players[i].name, style: TextStyle(fontWeight: i == game.currentPlayer ? FontWeight.bold : FontWeight.normal)),
                  Text('${game.players[i].hand.length} cards', style: const TextStyle(color: Colors.white54, fontSize: 11)),
                ])),
              ),
            ),
            const Spacer(),
            const Text('PREVIOUS CARD', style: TextStyle(color: Colors.white54, letterSpacing: 2, fontSize: 11)),
            _card(game.topCard),
            if (game.lastExplanation != null)
              Padding(padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8), child: Text(game.lastExplanation!, textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFFB7F36B), fontSize: 12))),
            Text('Direction: ${game.direction == 1 ? 'Clockwise' : 'Counter-clockwise'}', style: const TextStyle(color: Colors.white54)),
            const Spacer(),
            Padding(padding: const EdgeInsets.all(8), child: Text("${player.name}'s turn", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: player.hand.map((card) => _card(card, small: true, enabled: game.canPlay(card), onTap: () => _play(card))).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 18),
              child: Row(children: [
                Expanded(child: OutlinedButton.icon(onPressed: () => setState(() { game.drawForCurrentPlayer(); game.passTurn(); }), icon: const Icon(Icons.add), label: const Text('DRAW & PASS'))),
                const SizedBox(width: 10),
                Expanded(child: FilledButton.icon(onPressed: () => setState(() => game.passTurn()), icon: const Icon(Icons.skip_next), label: const Text('PASS TURN'))),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
