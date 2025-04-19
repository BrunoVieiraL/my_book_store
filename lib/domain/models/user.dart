class User {
  final int id;
  final String name;
  final String username;
  final String photo;
  final bool isAdmin;
  final String? password;

  User({
    required this.id,
    required this.name,
    required this.username,
    this.password,
    required this.photo,
    required this.isAdmin,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      photo: json['photo'],
      isAdmin: json['role'] == 'Admin',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'photo': photo,
      'password': password,
    };
  }
}
