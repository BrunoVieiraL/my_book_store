import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_book_store/data/repositories/cadastro_loja_repository.dart';
import 'package:my_book_store/data/services/api_service.dart';
import 'package:my_book_store/domain/domain.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late CadastroLojaRepository repository;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    repository = CadastroLojaRepository(mockApiService);
  });

  group('CadastroLojaRepository', () {
    test('deve retornar um Store ao cadastrar com sucesso', () async {
      final store = Store(
        name: 'Minha Lojinha',
        slogan: 'A melhor lojinha do sul do mundo!',
        banner: 'imageBase64',
        admin: Admin(
          name: 'Julio Bitencourt',
          photo: 'imageBase64',
          username: 'julio.bitencourt',
          password: '8ec4sJ7dx!*d',
        ),
      );

      final responseJson = {
        "refreshToken": "xxx",
        "store": {
          "banner": "imageBase64",
          "id": 1,
          "name": "Minha Lojinha",
          "slogan": "A melhor lojinha do sul do mundo!"
        },
        "token": "xxx",
        "user": {
          "id": 1,
          "name": "Julio Bitencourt",
          "photo": "imageBase64",
          "role": "Admin"
        }
      };

      when(() => mockApiService.createStore(store)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: responseJson,
        ),
      );

      final result = await repository.cadastrarLoja(store);

      expect(result, isNotNull);
      expect(result.name, equals('Minha Lojinha'));
    });
  });
}
