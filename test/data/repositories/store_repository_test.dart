import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_book_store/data/data.dart';
import 'package:my_book_store/domain/domain.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late StoreRepository repository;
  late MockApiService mockApi;

  setUp(() {
    mockApi = MockApiService();
    repository = StoreRepository(mockApi);
  });

  test('deve retornar Store ao criar com sucesso', () async {
    final store = Store(
      name: 'Loja Teste',
      slogan: 'Slogan',
      banner: 'imageBase64',
      admin: Admin(
        name: 'Admin',
        photo: 'imageBase64',
        username: 'admin',
        password: 'senha123!',
      ),
    );

    when(() => mockApi.createStore(store)).thenAnswer(
      (_) async => Response(
        data: {
          'store': {
            "name": store.name,
            "slogan": store.slogan,
            "banner": store.banner,
            "id": 1,
          }
        },
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await repository.createStore(store);

    expect(result.name, 'Loja Teste');
    verify(() => mockApi.createStore(store)).called(1);
  });
}
