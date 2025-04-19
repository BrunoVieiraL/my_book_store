class Store {
  final int? id;
  final String name;
  final String slogan;
  final String banner;

  Store({
    this.id,
    required this.name,
    required this.slogan,
    required this.banner,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'] ?? json['idStore'],
      name: json['name'],
      slogan: json['slogan'],
      banner: json['banner'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'slogan': slogan,
      'banner': banner,
    };
  }
}
