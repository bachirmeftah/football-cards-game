enum CardCategory {
  club, country, nationalTeam, competition, league, continent,
  player, manager, event, action
}

enum ActionType { none, drawTwo, drawFour, reverse, skip, wild, varVote }

class FootballCard {
  final String id;
  final String name;
  final CardCategory category;
  final String subtitle;
  final ActionType action;
  final List<String> relatedCardIds;
  final String? fact;

  const FootballCard({
    required this.id,
    required this.name,
    required this.category,
    this.subtitle = '',
    this.action = ActionType.none,
    this.relatedCardIds = const [],
    this.fact,
  });

  bool get isAction => action != ActionType.none;
}
