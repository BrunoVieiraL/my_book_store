import 'package:dio/dio.dart';
import 'package:my_book_store/domain/domain.dart';
import 'package:my_book_store/flavors/flavor_config.dart';

class ApiService {
  final Dio _dio;

  ApiService({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: FlavorConfig.instance.apiBaseUrl,
                headers: {'Content-Type': 'application/json'},
              ),
            );

  Future<AuthResponse> login({
    required String username,
    required String password,
  }) async {
    final response = await _dio.post('/v1/auth', data: {
      'user': username,
      'password': password,
    });
    return AuthResponse.fromJson(response.data);
  }

  Future<Map<String, dynamic>> validateToken({
    required String refreshToken,
  }) async {
    final response = await _dio.post(
      '/v1/auth/validateToken',
      data: {'refreshToken': refreshToken},
    );
    return response.data;
  }

  Future<AuthResponse> createStore({
    required Store store,
    required User user,
  }) async {
    final payload = store.toJson()..['user'] = user.toJson();
    final response = await _dio.post('/v1/store', data: payload);
    return AuthResponse.fromJson(response.data);
  }

  Future<Store> getStore({required int storeId}) async {
    final response = await _dio.get('/v1/store/$storeId');
    return Store.fromJson(response.data);
  }

  Future<void> updateStore({
    required int storeId,
    required Store store,
  }) async {
    await _dio.put('/v1/store/$storeId', data: store.toJson());
  }

  Future<void> createEmployee(
      {required int storeId, required User user}) async {
    await _dio.post(
      '/v1/store/$storeId/employee',
      data: user.toJson(),
    );
  }

  Future<List<User>> getEmployees({required int storeId}) async {
    final response = await _dio.get('/v1/store/$storeId/employee');
    final list = response.data as List;
    return list.map((json) => User.fromJson(json)).toList();
  }

  Future<void> updateEmployee({
    required int storeId,
    required int employeeId,
    required User user,
  }) async {
    await _dio.put('/v1/store/$storeId/employee/$employeeId',
        data: user.toJson());
  }

  Future<void> deleteEmployee({
    required int storeId,
    required int employeeId,
  }) async {
    await _dio.delete('/v1/store/$storeId/employee/$employeeId');
  }

  Future<Book> createBook({
    required int storeId,
    required Book book,
  }) async {
    final response = await _dio.post(
      '/v1/store/$storeId/book',
      data: book.toJson(),
    );
    return Book.fromJson(response.data);
  }

  Future<Book> updateBook({
    required int storeId,
    required int bookId,
    required Book book,
  }) async {
    final response = await _dio.put(
      '/v1/store/$storeId/book/$bookId',
      data: book.toJson(),
    );
    return Book.fromJson(response.data);
  }

  Future<Book> getBook({
    required int storeId,
    required int bookId,
  }) async {
    final response = await _dio.get('/v1/store/$storeId/book/$bookId');
    return Book.fromJson(response.data);
  }

  Future<void> deleteBook({
    required int storeId,
    required int bookId,
  }) async {
    await _dio.delete('/v1/store/$storeId/book/$bookId');
  }
}
