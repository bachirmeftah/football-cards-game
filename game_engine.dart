import 'dart:math';
import '../data/card_catalog.dart';
import '../models/card_model.dart';

class PlayerState {
  final String name;
  final List<FootballCard> hand;
  PlayerState(this.name, [List<FootballCard>? cards]) : hand = cards ?? [];
}

class GameEngine {
  final Random _random;
  final List<PlayerState> players = [];
  final List<FootballCard> discardPile = [];
  final List<FootballCard> drawPile = [];
  int currentPlayer = 0;
  int direction = 1;
  int pendingDraw = 0;
  String? winner;
  String? lastExplanation;
  bool votingRequired = false;

  GameEngine({Random? random}) : _random = random ?? Random();

  FootballCard get topCard => discardPile.last;
  PlayerState get activePlayer => players[currentPlayer];

  void start(List<String> playerNames) {
    if (playerNames.length < 2 || playerNames.length > 4) {
      throw ArgumentError('The game supports 2 to 4 players.');
    }
    players
      ..clear()
      ..addAll(playerNames.map((name) => PlayerState(name)));
    drawPile
      ..clear()
      ..addAll([...footballCards, ...specialCards]..shuffle(_random));
    discardPile.clear();
    currentPlayer = 0;
    direction = 1;
    pendingDraw = 0;
    winner = null;
    lastExplanation = null;
    votingRequired = false;

    for (var i = 0; i < 7; i++) {
      for (final player in players) {
        player.hand.add(_drawOne());
      }
    }
    // Start with a non-action football card.
    var first = _drawOne();
    while (first.isAction) {
      drawPile.insert(0, first);
      first = _drawOne();
    }
    discardPile.add(first);
  }

  FootballCard _drawOne() {
    if (drawPile.isEmpty && discardPile.length > 1) {
      final top = discardPile.removeLast();
      drawPile.addAll(discardPile);
      drawPile.shuffle(_random);
      discardPile
        ..clear()
        ..add(top);
    }
    if (drawPile.isEmpty) {
      throw StateError('No cards remain in the draw pile.');
    }
    return drawPile.removeLast();
  }

  bool canPlay(FootballCard card) {
    if (card.isAction) return true;
    return topCard.relatedCardIds.contains(card.id) ||
        card.relatedCardIds.contains(topCard.id);
  }

  void drawForCurrentPlayer([int count = 1]) {
    for (var i = 0; i < count; i++) {
      if (drawPile.isEmpty && discardPile.length <= 1) break;
      activePlayer.hand.add(_drawOne());
    }
  }

  void playCard(FootballCard card, {String? explanation}) {
    if (winner != null) throw StateError('The game is over.');
    if (!activePlayer.hand.contains(card)) throw StateError('Card not in hand.');
    if (!canPlay(card)) throw StateError('This card does not connect to the previous card.');
    final playingPlayer = activePlayer;
    playingPlayer.hand.remove(card);
    discardPile.add(card);
    lastExplanation = explanation ?? card.fact;
    _applyAction(card);
    if (playingPlayer.hand.isEmpty) {
      winner = playingPlayer.name;
    }
  }

  void _applyAction(FootballCard card) {
    switch (card.action) {
      case ActionType.reverse:
        direction *= -1;
        _advance();
      case ActionType.skip:
        _advance();
        _advance();
      case ActionType.drawTwo:
        _advance();
        drawForCurrentPlayer(2);
        _advance();
      case ActionType.drawFour:
        _advance();
        drawForCurrentPlayer(4);
        _advance();
      case ActionType.varVote:
        votingRequired = true;
      case ActionType.wild:
      case ActionType.none:
        _advance();
    }
  }

  void resolveVote({required bool relationshipValid}) {
    if (!votingRequired) return;
    votingRequired = false;
    // In this starter build, the card has already been placed. An invalid vote
    // restores it to the player's hand and returns it to the discard pile.
    if (!relationshipValid) {
      final disputed = discardPile.removeLast();
      players[currentPlayer].hand.add(disputed);
      drawForCurrentPlayer(2);
    } else {
      _advance();
    }
  }

  void _advance() {
    currentPlayer = (currentPlayer + direction + players.length) % players.length;
  }

  void passTurn() => _advance();
}
