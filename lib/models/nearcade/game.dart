class Game {
  final int gameId;
  final int titleId;
  final String name;
  final String version;
  final String comment;
  final int quantity;
  final String cost;

  Game({
    required this.gameId,
    required this.titleId,
    required this.name,
    required this.version,
    required this.comment,
    required this.quantity,
    required this.cost,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      gameId: json['gameId'] as int,
      titleId: json['titleId'] as int,
      name: json['name'] as String,
      version: json['version'] as String,
      comment: json['comment'] as String,
      quantity: json['quantity'] as int,
      cost: json['cost'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gameId': gameId,
      'titleId': titleId,
      'name': name,
      'version': version,
      'comment': comment,
      'quantity': quantity,
      'cost': cost,
    };
  }
}
