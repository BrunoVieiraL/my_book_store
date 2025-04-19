import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_book_store/blocs/blocs.dart';
import 'package:my_book_store/data/data.dart';
import 'package:my_book_store/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_book_store/ui/ui.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LoginBloc loginBloc;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginBloc = LoginBloc(mockAuthRepository);
  });

  tearDown(() => loginBloc.close());

  blocTest<LoginBloc, AuthState>(
    'emite AuthInvalidPasswordState se a senha for inválida',
    build: () => LoginBloc(mockAuthRepository),
    act: (bloc) {
      bloc.passwordTextController.text = '123';
      bloc.add(SubmitLoginEvent());
    },
    expect: () => [
      isA<AuthInvalidPasswordState>(),
    ],
  );

  blocTest<LoginBloc, AuthState>(
    'emite AuthSuccessState se a senha for válida e login bem-sucedido',
    build: () {
      when(() => mockAuthRepository.login(
            username: any(named: 'username'),
            password: any(named: 'password'),
          )).thenAnswer(
        (_) async => AuthResponse(
          token: 'abc123',
          refreshToken: 'xyz456',
          user: User(
            id: 1,
            name: 'Fulano',
            username: 'fulano',
            photo: '',
            password: '',
            isAdmin: true,
          ),
          store: Store(name: 'Minha Loja', slogan: 'Top', banner: ''),
        ),
      );
      return LoginBloc(mockAuthRepository);
    },
    act: (bloc) {
      bloc.emailTextController.text = 'email@teste.com';
      bloc.passwordTextController.text = 'A@bcd123';
      bloc.add(SubmitLoginEvent());
    },
    expect: () => [
      isA<AuthLoadingState>(),
      isA<AuthLoggedInState>(),
    ],
    verify: (_) {
      verify(() => mockAuthRepository.login(
            username: 'email@teste.com',
            password: 'A@bcd123',
          )).called(1);
    },
  );

  blocTest<LoginBloc, AuthState>(
    'alterna visibilidade da senha mantendo o tipo de estado atual',
    build: () => LoginBloc(mockAuthRepository),
    seed: () => AuthInitialState(showPassword: true),
    act: (bloc) => bloc.add(TooglePasswordVisibility()),
    expect: () => [
      isA<AuthInitialState>()
          .having((s) => s.showPassword, 'showPassword', false),
    ],
  );
}
