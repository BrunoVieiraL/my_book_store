import 'package:my_book_store/data/data.dart';
import 'package:my_book_store/domain/domain.dart';

class CreateStoreRepository {
  final ApiService _apiService;

  CreateStoreRepository(this._apiService);

  Future<AuthResponse> createStore(Store store, User user) async {
    final response = await _apiService.createStore(
      store: store,
      user: user,
    );

    return response;
  }
}
