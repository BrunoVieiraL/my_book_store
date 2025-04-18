import 'package:my_book_store/domain/domain.dart';

class Store {
  final int? id;
  final String name;
  final String slogan;
  final String banner;
  final Admin? admin;

  Store({
    this.id,
    required this.name,
    required this.slogan,
    required this.banner,
    this.admin,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'] ?? json['idStore'], // a API varia o nome da chave
      name: json['name'],
      slogan: json['slogan'],
      banner: json['banner'],
      admin: json['admin'] != null ? Admin.fromJson(json['admin']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'slogan': slogan,
      'banner': banner,
      if (admin != null) 'admin': admin!.toJson(),
    };
  }
}
