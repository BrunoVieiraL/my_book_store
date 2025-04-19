import 'package:my_book_store/domain/domain.dart';

abstract class AuthState {
  bool showPassword;

  AuthState({required this.showPassword});
}

class AuthInitialState extends AuthState {
  AuthInitialState({required super.showPassword});
}

class AuthInvalidPasswordState extends AuthState {
  final String errorMessage;

  AuthInvalidPasswordState({
    required super.showPassword,
    required this.errorMessage,
  });
}

class AuthLoadingState extends AuthState {
  AuthLoadingState({required super.showPassword});
}

class AuthLoggedInState extends AuthState {
  final AuthResponse authResponse;

  AuthLoggedInState({
    required super.showPassword,
    required this.authResponse,
  });
}

class AuthFailureState extends AuthState {
  final String errorMessage;

  AuthFailureState({
    required this.errorMessage,
    required super.showPassword,
  });
}
