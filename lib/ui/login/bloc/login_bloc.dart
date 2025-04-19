import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:my_book_store/blocs/blocs.dart';
import 'package:my_book_store/data/repositories/auth_repository.dart';
import 'package:my_book_store/utils/validators.dart';

class LoginBloc extends Bloc<AuthEvent, AuthState> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  final AuthRepository _authRepository;

  LoginBloc(this._authRepository)
      : super(AuthInitialState(showPassword: true)) {
    on<TooglePasswordVisibility>((event, emit) {
      // Apenas reemite o mesmo tipo de estado atual com a flag invertida
      emit(_copyWithNewShowPassword(state, !state.showPassword));
    });

    on<SubmitLoginEvent>((event, emit) async {
      final username = emailTextController.text.trim();
      final password = passwordTextController.text;

      if (!Validators.isPasswordValid(password)) {
        emit(AuthInvalidPasswordState(
          showPassword: state.showPassword,
          errorMessage: 'Senha inválida. Verifique os requisitos.',
        ));
        return;
      }

      emit(AuthLoadingState(showPassword: state.showPassword));

      try {
        final response = await _authRepository.login(
          username: username,
          password: password,
        );
        emit(AuthLoggedInState(
          showPassword: state.showPassword,
          authResponse: response,
        ));
      } catch (e) {
        emit(AuthFailureState(
          showPassword: state.showPassword,
          errorMessage: 'Erro ao fazer login. Verifique suas credenciais.',
        ));
      }
    });
  }

  AuthState _copyWithNewShowPassword(AuthState currentState, bool newValue) {
    if (currentState is AuthInitialState) {
      return AuthInitialState(showPassword: newValue);
    } else if (currentState is AuthInvalidPasswordState) {
      return AuthInvalidPasswordState(
        showPassword: newValue,
        errorMessage: currentState.errorMessage,
      );
    } else if (currentState is AuthLoadingState) {
      return AuthLoadingState(showPassword: newValue);
    } else if (currentState is AuthLoggedInState) {
      return AuthLoggedInState(
        showPassword: newValue,
        authResponse: currentState.authResponse,
      );
    } else if (currentState is AuthFailureState) {
      return AuthFailureState(
        showPassword: newValue,
        errorMessage: currentState.errorMessage,
      );
    } else {
      return AuthInitialState(showPassword: newValue); // fallback
    }
  }

  @override
  Future<void> close() {
    emailTextController.dispose();
    passwordTextController.dispose();
    return super.close();
  }
}
