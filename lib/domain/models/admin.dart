class Admin {
  final int? id;
  final String name;
  final String photo;
  final String? username;
  final String? password;

  Admin({
    this.id,
    required this.name,
    required this.photo,
    this.username,
    this.password,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      username: json['username'],
      password: null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'photo': photo,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
    };
  }
}
