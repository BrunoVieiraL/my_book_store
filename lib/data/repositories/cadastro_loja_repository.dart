import 'package:my_book_store/data/services/api_service.dart';
import 'package:my_book_store/domain/models/store.dart';

class CadastroLojaRepository {
  final ApiService _apiService;

  CadastroLojaRepository(this._apiService);

  Future<Store> cadastrarLoja(Store store) async {
    final response = await _apiService.createStore(store);

    return Store.fromJson(response.data['store']);
  }
}
