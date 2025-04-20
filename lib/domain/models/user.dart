class User {
  final int? id;
  final String name;
  final String? username;
  final String? photo;
  final bool? isAdmin;
  final String? password;
  final String? initialLetters;

  User({
    this.id,
    required this.name,
    this.username,
    this.password,
    this.photo,
    this.isAdmin,
    this.initialLetters,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json.containsKey('username') ? json['username'] : null,
      photo: json['photo'],
      isAdmin: json['role'] == 'Admin',
      initialLetters: getInitials(json['name']),
    );
  }

  static String getInitials(String fullName) {
    final words = fullName.trim().split(' ');
    if (words.isEmpty) return '';

    if (words.length == 1) {
      return words[0].isNotEmpty ? words[0][0].toUpperCase() : '';
    }

    return (words[0][0] + words[1][0]).toUpperCase();
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'username': username,
      'photo': photo,
      'password': password,
    };
  }
}
