import 'package:my_book_store/domain/domain.dart';

class AuthResponse {
  final String token;
  final String refreshToken;
  final Store store;
  final User user;

  AuthResponse({
    required this.token,
    required this.refreshToken,
    required this.store,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      refreshToken: json['refreshToken'],
      store: Store.fromJson(json['store']),
      user: User.fromJson(json['user']),
    );
  }
}
