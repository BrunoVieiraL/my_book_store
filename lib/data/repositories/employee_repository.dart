import 'package:my_book_store/data/services/api_service.dart';
import 'package:my_book_store/domain/domain.dart';

class EmployeeRepository {
  final ApiService _apiService;
  EmployeeRepository(this._apiService);

  Future<User> addEmployee(
    int storeId,
    User user,
    String token,
  ) async {
    final response = await _apiService.createEmployee(
      storeId: storeId,
      user: user,
      token: token,
    );

    return response;
  }

  Future<List<User>> getEmployess(int storeId, String token) async {
    final response = await _apiService.getEmployees(
      storeId: storeId,
      token: token,
    );
    return response;
  }
}
