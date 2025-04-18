import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_book_store/data/data.dart';
import 'package:my_book_store/domain/domain.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late ApiService apiService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    apiService = ApiService(dio: mockDio);
  });

  test('deve retornar Response ao criar loja com sucesso', () async {
    final store = Store(
      name: 'Loja Teste',
      slogan: 'Slogan',
      banner: 'bannerBase64',
      admin: Admin(
        name: 'Admin',
        photo: 'photoBase64',
        username: 'admin',
        password: 'senha@123',
      ),
    );

    final fakeResponse = Response(
      data: {'store': store.toJson()},
      statusCode: 200,
      requestOptions: RequestOptions(path: '/v1/store'),
    );

    when(() => mockDio.post(
          any(),
          data: any(named: 'data'),
        )).thenAnswer((_) async => fakeResponse);

    final result = await apiService.createStore(store);

    expect(result.statusCode, 200);
    expect(result.data['store']['name'], equals('Loja Teste'));
    verify(() => mockDio.post('/v1/store', data: store.toJson())).called(1);
  });
}
