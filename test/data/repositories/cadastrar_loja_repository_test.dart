import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_book_store/data/repositories/create_store_repository.dart';
import 'package:my_book_store/data/services/api_service.dart';
import 'package:my_book_store/domain/domain.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late CreateStoreRepository repository;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    repository = CreateStoreRepository(mockApiService);
  });

  group('CadastroLojaRepository', () {
    test('deve retornar um AuthResponse ao cadastrar loja com sucesso',
        () async {
      final store = Store(
        name: 'Minha Lojinha',
        slogan: 'A melhor lojinha do sul do mundo!',
        banner: 'imageBase64',
      );
      final user = User(
        id: 1,
        name: 'Julio Bitencourt',
        username: 'julio.bitencourt',
        password: '8ec4sJ7dx!*d',
        photo: 'imageBase64',
        isAdmin: true,
      );

      final responseJson = {
        "refreshToken": "xxx",
        "token": "yyy",
        "store": store.toJson(),
        "user": user.toJson()
          ..addAll(
            {'role': 'Admin'},
          ),
      };

      when(() => mockApiService.createStore(store: store, user: user))
          .thenAnswer(
        (_) async => AuthResponse.fromJson(responseJson),
      );

      final result = await repository.createStore(store, user);

      expect(result.store.name, equals('Minha Lojinha'));
      expect(result.user.name, equals('Julio Bitencourt'));
      expect(result.user.isAdmin, isTrue);
    });
  });
}
