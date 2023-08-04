class Player {
  final String id;
  final String? name;
  int score;

  Player({
    required this.id,
    required this.name,
    this.score = 0,
  });

  static Player fromJson(Map<String, dynamic> json, {String? id}) {
    return Player(
      id: json['id'] ?? id,
      name: json['name'],
      score: json['score'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'score': score,
    };
  }
}
