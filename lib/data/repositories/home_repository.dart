import 'package:my_book_store/data/data.dart';
import 'package:my_book_store/domain/domain.dart';

class HomeRepository {
  final ApiService _apiService;
  HomeRepository(this._apiService);

  Future<List<Book>> getBooks(Filter filter) async {
    final response = _apiService.getBooks(filter);

    return response;
  }
}
