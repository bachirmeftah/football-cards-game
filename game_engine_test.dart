import 'package:flutter_test/flutter_test.dart';
import 'package:football_cards_game/game/game_engine.dart';

void main() {
  test('starts with 7 cards per player and one discard card', () {
    final game = GameEngine()..start(['A', 'B', 'C']);
    expect(game.players.length, 3);
    expect(game.players.every((p) => p.hand.length == 7), isTrue);
    expect(game.discardPile.length, 1);
  });

  test('rejects unsupported player counts', () {
    final game = GameEngine();
    expect(() => game.start(['Only one']), throwsArgumentError);
  });
}
