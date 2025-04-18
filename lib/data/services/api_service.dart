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

  Future<Response> createStore(Store store) async {
    try {
      final response = await _dio.post(
        '/v1/store',
        data: store.toJson(),
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Erro ao criar loja: ${e.response?.data ?? e.message}');
    }
  }
}
