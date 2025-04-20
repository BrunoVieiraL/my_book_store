// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_book_store/domain/domain.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {
  String username = '';
  String password = '';
}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  AuthResponse authResponse;
  LoginSuccessState(this.authResponse);
}

class LoginErrorState extends LoginState {
  String errorMessage;
  LoginErrorState(this.errorMessage);
}

class LoginTooglePasswordState extends LoginState {
  bool showPassword;

  LoginTooglePasswordState(this.showPassword);
}
