import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_book_store/blocs/blocs.dart';
import 'package:my_book_store/ui/ui.dart';

void main() {
  group('LoginBloc', () {
    late LoginBloc loginBloc;

    setUp(() {
      loginBloc = LoginBloc();
    });

    tearDown(() {
      loginBloc.close();
    });

    blocTest<LoginBloc, AuthState>(
      'emite AuthErrorState se a senha for inválida',
      build: () => loginBloc,
      act: (bloc) {
        bloc.passwordTextController.text = '123'; // senha inválida
        bloc.add(SubmitLoginEvent());
      },
      expect: () => [
        isA<AuthInvalidPasswordState>(),
      ],
    );

    blocTest<LoginBloc, AuthState>(
      'emite AuthSuccessState se a senha for válida',
      build: () => loginBloc,
      act: (bloc) {
        bloc.passwordTextController.text = 'A!bcd123'; // senha válida
        bloc.add(SubmitLoginEvent());
      },
      expect: () => [
        isA<AuthSuccessState>(),
      ],
    );

    blocTest<LoginBloc, AuthState>(
      'emite AuthTooglePasswordState ao alternar visibilidade',
      build: () => loginBloc,
      act: (bloc) => bloc.add(TooglePasswordVisibility()),
      expect: () => [
        isA<AuthTooglePasswordState>().having(
          (s) => s.showPassword,
          'showPassword',
          false,
        ),
      ],
    );

    blocTest<LoginBloc, AuthState>(
      'emite AuthInvalidPasswordState quando a senha é inválida',
      build: () => loginBloc,
      act: (bloc) {
        bloc.passwordTextController.text = 'abc'; // senha inválida
        bloc.add(SubmitLoginEvent());
      },
      expect: () => [
        isA<AuthInvalidPasswordState>().having((state) => state.errorMessage,
            'errorMessage', 'Senha inválida. Verifique os requisitos.'),
      ],
    );
  });
}
