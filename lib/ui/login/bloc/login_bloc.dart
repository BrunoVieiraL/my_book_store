import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:my_book_store/blocs/blocs.dart';
import 'package:my_book_store/utils/validators.dart';

class LoginBloc extends Bloc<AuthEvent, AuthState> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  LoginBloc() : super(AuthInitialState(showPassword: true)) {
    on<TooglePasswordVisibility>(
      (event, emit) =>
          emit(AuthTooglePasswordState(showPassword: !state.showPassword)),
    );
    on<SubmitLoginEvent>((event, emit) {
      if (!Validators.isPasswordValid(passwordTextController.text)) {
        emit(AuthInvalidPasswordState(
          showPassword: state.showPassword,
          errorMessage: 'Senha inválida. Verifique os requisitos.',
        ));
      } else {
        emit(AuthSuccessState(showPassword: state.showPassword));
      }
    });
  }
}
