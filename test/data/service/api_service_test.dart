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

  test('deve retornar AuthResponse ao criar loja com sucesso', () async {
    final store = Store(
      name: 'Loja Teste',
      slogan: 'Slogan',
      banner: 'bannerBase64',
    );

    final user = User(
      id: 1,
      name: 'Julio Bitencourt',
      username: 'julio.bitencourt',
      password: '8ec4sJ7dx!*d',
      photo: 'imageBase64',
    );

    final expectedPayload = store.toJson()..['user'] = user.toJson();

    final fakeResponse = Response(
      data: {
        'refreshToken': 'tokenDeRefresh',
        'token': 'tokenDeAcesso',
        'store': store.toJson(),
        'user': user.toJson()..addAll({'role': 'Admin'}),
      },
      statusCode: 200,
      requestOptions: RequestOptions(path: ''),
    );

    when(() => mockDio.post(any(),
        data: any(named: 'data'),
        options: Options(
          responseType: ResponseType.plain,
        ))).thenAnswer((_) async => fakeResponse);

    final result = await apiService.createStore(
      store: store,
      user: user,
    );

    expect(result, isA<AuthResponse>());
    expect(result.store.name, equals('Loja Teste'));

    verify(() => mockDio.post(
          '/v1/store',
          data: expectedPayload,
        )).called(1);
  });
}
