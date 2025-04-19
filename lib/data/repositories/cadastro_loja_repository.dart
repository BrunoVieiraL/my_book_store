import 'package:my_book_store/data/data.dart';
import 'package:my_book_store/domain/domain.dart';

class CadastroLojaRepository {
  final ApiService _apiService;

  CadastroLojaRepository(this._apiService);

  Future<AuthResponse> cadastrarLoja(Store store, User user) async {
    final response = await _apiService.createStore(
      store: store,
      user: user,
    );

    return response;
  }
}
