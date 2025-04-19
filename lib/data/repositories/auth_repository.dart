import 'package:my_book_store/data/services/api_service.dart';
import 'package:my_book_store/domain/models/auth_response.dart';

class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  Future<AuthResponse> login({
   required String username,
   required String password,
  }) {
    return _apiService.login(
      username: username,
      password: password,
    );
  }
}
