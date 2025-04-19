import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_book_store/data/repositories/auth_repository.dart';
import 'package:my_book_store/data/services/api_service.dart';
import 'package:my_book_store/domain/domain.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late AuthRepository authRepository;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    authRepository = AuthRepository(mockApiService);
  });

  group('AuthRepository', () {
    test('deve retornar AuthResponse quando login for bem-sucedido', () async {
      const username = 'julio.bitencourt';
      const password = '8ec4sJ7dx!*d';

      final mockAuthResponse = AuthResponse(
        token: 'token123',
        refreshToken: 'refreshToken123',
        store: Store(
          id: 1,
          name: 'Minha Lojinha',
          slogan: 'Top demais',
          banner: 'imageBase64',
        ),
        user: User(
          id: 1,
          name: 'Julio Bitencourt',
          username: username,
          photo: 'imageBase64',
          isAdmin: true,
        ),
      );

      when(() => mockApiService.login(
            username: username,
            password: password,
          )).thenAnswer((_) async => mockAuthResponse);

      final result = await authRepository.login(
        username: username,
        password: password,
      );

      expect(result.token, mockAuthResponse.token);
      expect(result.user.name, mockAuthResponse.user.name);
      expect(result.store.name, mockAuthResponse.store.name);
    });

    test('deve lançar erro se login falhar', () async {
      const username = 'julio.bitencourt';
      const password = 'senha_errada';

      when(() => mockApiService.login(
            username: username,
            password: password,
          )).thenThrow(Exception('Login inválido'));

      expect(
        () async => await authRepository.login(
          username: username,
          password: password,
        ),
        throwsA(isA<Exception>()),
      );
    });
  });
}
