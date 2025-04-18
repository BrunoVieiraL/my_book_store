import 'package:my_book_store/data/data.dart';
import 'package:my_book_store/domain/domain.dart';

class StoreRepository {
  final ApiService _apiService;

  StoreRepository(this._apiService);

  Future<Store> createStore(Store store) async {
    final response = await _apiService.createStore(store);

    final data = response.data['store'];
    return Store.fromJson(data);
  }
}
