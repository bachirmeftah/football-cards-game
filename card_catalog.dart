import '../models/card_model.dart';

/// Starter set: famous clubs only, in the requested league distribution:
/// Spain 3, Italy 3, Germany 2, England 6, France 1.
const footballCards = <FootballCard>[
  // Clubs: Spain (3)
  FootballCard(id: 'barcelona', name: 'Barcelona', category: CardCategory.club, subtitle: 'Spain • La Liga', relatedCardIds: ['messi','ronaldinho','xavi','iniesta','spain','la_liga','ucl','world_cup'], fact: 'Several World Cup winners have represented Barcelona.'),
  FootballCard(id: 'real_madrid', name: 'Real Madrid', category: CardCategory.club, subtitle: 'Spain • La Liga', relatedCardIds: ['ronaldo_cr7','zidane','ancelotti','brazil','france','la_liga','ucl','world_cup'], fact: 'Real Madrid has won the UEFA Champions League many times.'),
  FootballCard(id: 'atletico', name: 'Atlético Madrid', category: CardCategory.club, subtitle: 'Spain • La Liga', relatedCardIds: ['griezmann','simeone','france','la_liga','ucl'], fact: 'Atlético Madrid is one of Spain’s best-known clubs.'),

  // Italy (3)
  FootballCard(id: 'juventus', name: 'Juventus', category: CardCategory.club, subtitle: 'Italy • Serie A', relatedCardIds: ['ronaldo_cr7','zidane','italy','serie_a','ucl'], fact: 'Juventus is one of Italy’s most successful clubs.'),
  FootballCard(id: 'ac_milan', name: 'AC Milan', category: CardCategory.club, subtitle: 'Italy • Serie A', relatedCardIds: ['ronaldinho','kaka','ancelotti','brazil','serie_a','ucl'], fact: 'AC Milan has a rich European history.'),
  FootballCard(id: 'inter', name: 'Inter Milan', category: CardCategory.club, subtitle: 'Italy • Serie A', relatedCardIds: ['lukaku','italy','serie_a','ucl'], fact: 'Inter Milan is a major club in Italian football.'),

  // Germany (2)
  FootballCard(id: 'bayern', name: 'Bayern Munich', category: CardCategory.club, subtitle: 'Germany • Bundesliga', relatedCardIds: ['lewandowski','ancelotti','germany','bundesliga','ucl'], fact: 'Bayern Munich is one of Europe’s most decorated clubs.'),
  FootballCard(id: 'dortmund', name: 'Borussia Dortmund', category: CardCategory.club, subtitle: 'Germany • Bundesliga', relatedCardIds: ['lewandowski','germany','bundesliga','ucl'], fact: 'Dortmund is famous for its passionate supporters.'),

  // England (6)
  FootballCard(id: 'man_city', name: 'Manchester City', category: CardCategory.club, subtitle: 'England • Premier League', relatedCardIds: ['guardiola','haaland','premier_league','england','ucl'], fact: 'Manchester City has become a major force in English football.'),
  FootballCard(id: 'liverpool', name: 'Liverpool', category: CardCategory.club, subtitle: 'England • Premier League', relatedCardIds: ['klopp','salah','premier_league','england','ucl'], fact: 'Liverpool has a famous European history.'),
  FootballCard(id: 'arsenal', name: 'Arsenal', category: CardCategory.club, subtitle: 'England • Premier League', relatedCardIds: ['arsene_wenger','premier_league','england'], fact: 'Arsenal is one of the historic clubs in English football.'),
  FootballCard(id: 'chelsea', name: 'Chelsea', category: CardCategory.club, subtitle: 'England • Premier League', relatedCardIds: ['mourinho','premier_league','england','ucl'], fact: 'Chelsea has won major domestic and European trophies.'),
  FootballCard(id: 'man_united', name: 'Manchester United', category: CardCategory.club, subtitle: 'England • Premier League', relatedCardIds: ['ferguson','ronaldo_cr7','premier_league','england','ucl'], fact: 'Manchester United is one of the most followed clubs worldwide.'),
  FootballCard(id: 'tottenham', name: 'Tottenham Hotspur', category: CardCategory.club, subtitle: 'England • Premier League', relatedCardIds: ['premier_league','england'], fact: 'Tottenham is a well-known London club.'),

  // France (1)
  FootballCard(id: 'psg', name: 'Paris Saint-Germain', category: CardCategory.club, subtitle: 'France • Ligue 1', relatedCardIds: ['messi','neymar','mbappe','france','ligue_1','ucl'], fact: 'Paris Saint-Germain is one of France’s leading clubs.'),

  // Players
  FootballCard(id: 'messi', name: 'Lionel Messi', category: CardCategory.player, subtitle: 'Argentina', relatedCardIds: ['barcelona','psg','argentina','world_cup','copa_america'], fact: 'Messi played for Barcelona and won the 2022 FIFA World Cup with Argentina.'),
  FootballCard(id: 'ronaldo_cr7', name: 'Cristiano Ronaldo', category: CardCategory.player, subtitle: 'Portugal', relatedCardIds: ['real_madrid','juventus','man_united','portugal','euro'], fact: 'Cristiano Ronaldo has represented several major European clubs.'),
  FootballCard(id: 'ronaldinho', name: 'Ronaldinho', category: CardCategory.player, subtitle: 'Brazil', relatedCardIds: ['barcelona','ac_milan','brazil','world_cup'], fact: 'Ronaldinho played for Barcelona and won the 2002 World Cup with Brazil.'),
  FootballCard(id: 'xavi', name: 'Xavi Hernández', category: CardCategory.player, subtitle: 'Spain', relatedCardIds: ['barcelona','spain','world_cup'], fact: 'Xavi was part of Spain’s 2010 World Cup-winning team.'),
  FootballCard(id: 'iniesta', name: 'Andrés Iniesta', category: CardCategory.player, subtitle: 'Spain', relatedCardIds: ['barcelona','spain','world_cup'], fact: 'Iniesta scored the winning goal in the 2010 World Cup final.'),
  FootballCard(id: 'zidane', name: 'Zinedine Zidane', category: CardCategory.player, subtitle: 'France', relatedCardIds: ['real_madrid','juventus','france','world_cup'], fact: 'Zidane played for Juventus and Real Madrid and won the 1998 World Cup.'),
  FootballCard(id: 'griezmann', name: 'Antoine Griezmann', category: CardCategory.player, subtitle: 'France', relatedCardIds: ['atletico','france','world_cup'], fact: 'Griezmann was part of France’s 2018 World Cup-winning squad.'),
  FootballCard(id: 'kaka', name: 'Kaká', category: CardCategory.player, subtitle: 'Brazil', relatedCardIds: ['ac_milan','brazil','world_cup'], fact: 'Kaká won the 2007 Ballon d’Or while at AC Milan.'),
  FootballCard(id: 'lukaku', name: 'Romelu Lukaku', category: CardCategory.player, subtitle: 'Belgium', relatedCardIds: ['inter','belgium'], fact: 'Lukaku has represented Inter Milan.'),
  FootballCard(id: 'lewandowski', name: 'Robert Lewandowski', category: CardCategory.player, subtitle: 'Poland', relatedCardIds: ['bayern','dortmund','poland'], fact: 'Lewandowski played for both Bayern Munich and Borussia Dortmund.'),
  FootballCard(id: 'haaland', name: 'Erling Haaland', category: CardCategory.player, subtitle: 'Norway', relatedCardIds: ['man_city','norway'], fact: 'Haaland plays for Manchester City.'),
  FootballCard(id: 'salah', name: 'Mohamed Salah', category: CardCategory.player, subtitle: 'Egypt', relatedCardIds: ['liverpool','egypt','africa'], fact: 'Mohamed Salah represents Egypt and plays for Liverpool.'),
  FootballCard(id: 'neymar', name: 'Neymar Jr.', category: CardCategory.player, subtitle: 'Brazil', relatedCardIds: ['psg','brazil','copa_america'], fact: 'Neymar has represented PSG and Brazil.'),
  FootballCard(id: 'mbappe', name: 'Kylian Mbappé', category: CardCategory.player, subtitle: 'France', relatedCardIds: ['psg','france','world_cup'], fact: 'Mbappé won the 2018 World Cup with France.'),

  // Managers
  FootballCard(id: 'mourinho', name: 'José Mourinho', category: CardCategory.manager, relatedCardIds: ['chelsea','inter','real_madrid'], fact: 'Mourinho has coached Chelsea, Inter and Real Madrid.'),
  FootballCard(id: 'ancelotti', name: 'Carlo Ancelotti', category: CardCategory.manager, relatedCardIds: ['real_madrid','ac_milan','bayern'], fact: 'Ancelotti has managed several major European clubs.'),
  FootballCard(id: 'guardiola', name: 'Pep Guardiola', category: CardCategory.manager, relatedCardIds: ['man_city','barcelona','bayern'], fact: 'Guardiola has managed Barcelona, Bayern and Manchester City.'),
  FootballCard(id: 'klopp', name: 'Jürgen Klopp', category: CardCategory.manager, relatedCardIds: ['liverpool','dortmund'], fact: 'Klopp managed both Liverpool and Borussia Dortmund.'),
  FootballCard(id: 'ferguson', name: 'Sir Alex Ferguson', category: CardCategory.manager, relatedCardIds: ['man_united'], fact: 'Ferguson is strongly associated with Manchester United.'),

  // Countries, leagues, competitions
  FootballCard(id: 'argentina', name: 'Argentina', category: CardCategory.nationalTeam, relatedCardIds: ['messi','world_cup','copa_america'], fact: 'Argentina won the 2022 FIFA World Cup.'),
  FootballCard(id: 'portugal', name: 'Portugal', category: CardCategory.nationalTeam, relatedCardIds: ['ronaldo_cr7','euro'], fact: 'Portugal won UEFA Euro 2016.'),
  FootballCard(id: 'brazil', name: 'Brazil', category: CardCategory.nationalTeam, relatedCardIds: ['ronaldinho','kaka','neymar','world_cup','copa_america'], fact: 'Brazil has won the FIFA World Cup five times.'),
  FootballCard(id: 'france', name: 'France', category: CardCategory.nationalTeam, relatedCardIds: ['zidane','griezmann','mbappe','world_cup','euro'], fact: 'France won the FIFA World Cup in 1998 and 2018.'),
  FootballCard(id: 'spain', name: 'Spain', category: CardCategory.nationalTeam, relatedCardIds: ['xavi','iniesta','world_cup','euro'], fact: 'Spain won the 2010 FIFA World Cup.'),
  FootballCard(id: 'england', name: 'England', category: CardCategory.nationalTeam, relatedCardIds: ['premier_league','world_cup'], fact: 'England won the 1966 FIFA World Cup.'),
  FootballCard(id: 'italy', name: 'Italy', category: CardCategory.nationalTeam, relatedCardIds: ['serie_a','world_cup','euro'], fact: 'Italy has won the FIFA World Cup four times.'),
  FootballCard(id: 'germany', name: 'Germany', category: CardCategory.nationalTeam, relatedCardIds: ['bundesliga','world_cup','euro'], fact: 'Germany has won the FIFA World Cup four times.'),
  FootballCard(id: 'egypt', name: 'Egypt', category: CardCategory.nationalTeam, relatedCardIds: ['salah','africa'], fact: 'Egypt is one of Africa’s most successful national teams.'),
  FootballCard(id: 'belgium', name: 'Belgium', category: CardCategory.nationalTeam, relatedCardIds: ['lukaku'], fact: 'Belgium has produced many prominent international players.'),
  FootballCard(id: 'norway', name: 'Norway', category: CardCategory.nationalTeam, relatedCardIds: ['haaland'], fact: 'Erling Haaland represents Norway.'),
  FootballCard(id: 'poland', name: 'Poland', category: CardCategory.nationalTeam, relatedCardIds: ['lewandowski'], fact: 'Robert Lewandowski represents Poland.'),

  FootballCard(id: 'world_cup', name: 'FIFA World Cup', category: CardCategory.competition, relatedCardIds: ['argentina','brazil','france','spain','italy','germany','messi','ronaldinho','zidane','mbappe'], fact: 'The FIFA World Cup is the major international national-team tournament.'),
  FootballCard(id: 'ucl', name: 'UEFA Champions League', category: CardCategory.competition, relatedCardIds: ['barcelona','real_madrid','juventus','ac_milan','inter','bayern','dortmund','man_city','liverpool','chelsea','man_united','psg'], fact: 'The Champions League is UEFA’s premier club competition.'),
  FootballCard(id: 'copa_america', name: 'Copa América', category: CardCategory.competition, relatedCardIds: ['argentina','brazil','messi','neymar'], fact: 'Copa América is a major South American national-team competition.'),
  FootballCard(id: 'euro', name: 'UEFA European Championship', category: CardCategory.competition, relatedCardIds: ['portugal','france','spain','italy','germany'], fact: 'The UEFA European Championship is contested by European national teams.'),
  FootballCard(id: 'premier_league', name: 'Premier League', category: CardCategory.league, relatedCardIds: ['man_city','liverpool','arsenal','chelsea','man_united','tottenham','england'], fact: 'The Premier League is England’s top division.'),
  FootballCard(id: 'la_liga', name: 'La Liga', category: CardCategory.league, relatedCardIds: ['barcelona','real_madrid','atletico','spain'], fact: 'La Liga is Spain’s top division.'),
  FootballCard(id: 'serie_a', name: 'Serie A', category: CardCategory.league, relatedCardIds: ['juventus','ac_milan','inter','italy'], fact: 'Serie A is Italy’s top division.'),
  FootballCard(id: 'bundesliga', name: 'Bundesliga', category: CardCategory.league, relatedCardIds: ['bayern','dortmund','germany'], fact: 'The Bundesliga is Germany’s top division.'),
  FootballCard(id: 'ligue_1', name: 'Ligue 1', category: CardCategory.league, relatedCardIds: ['psg','france'], fact: 'Ligue 1 is France’s top division.'),
  FootballCard(id: 'africa', name: 'Africa', category: CardCategory.continent, relatedCardIds: ['egypt','salah'], fact: 'Egypt and Mohamed Salah are connected to African football.'),
];

const specialCards = <FootballCard>[
  FootballCard(id: 'draw_two', name: '+2', category: CardCategory.action, action: ActionType.drawTwo, subtitle: 'Draw two'),
  FootballCard(id: 'draw_four', name: '+4', category: CardCategory.action, action: ActionType.drawFour, subtitle: 'Draw four'),
  FootballCard(id: 'reverse', name: 'REVERSE', category: CardCategory.action, action: ActionType.reverse, subtitle: 'Change direction'),
  FootballCard(id: 'skip', name: 'SKIP', category: CardCategory.action, action: ActionType.skip, subtitle: 'Skip next player'),
  FootballCard(id: 'wild', name: 'WILD', category: CardCategory.action, action: ActionType.wild, subtitle: 'Choose category'),
  FootballCard(id: 'var_vote', name: 'VAR', category: CardCategory.action, action: ActionType.varVote, subtitle: 'Challenge a connection'),
];
