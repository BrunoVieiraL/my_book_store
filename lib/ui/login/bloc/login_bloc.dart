import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_store/blocs/blocs.dart';
import 'package:my_book_store/data/data.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  bool _showPassword = true;

  LoginBloc(
    this._authRepository,
  ) : super(LoginInitialState()) {
    on<LoginPasswordToogleEvent>(
      (event, emit) {
        _showPassword = !_showPassword;
        emit(LoginTooglePasswordState(_showPassword));
      },
    );

    on<LoginPressedEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        final authResponse = await _authRepository.login(
          username: usernameTextController.text,
          password: passwordTextController.text,
        );
        emit(LoginSuccessState(authResponse));
      } catch (e) {
        emit(LoginErrorState(e.toString()));
      }
    });
  }
}
