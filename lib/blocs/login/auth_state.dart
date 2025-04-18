abstract class AuthState {
  bool showPassword;

  AuthState({required this.showPassword});
}

class AuthInitialState extends AuthState {
  AuthInitialState({required super.showPassword});
}

class AuthSuccessState extends AuthState {
  AuthSuccessState({required super.showPassword});
}

class AuthErrorState extends AuthState {
  AuthErrorState({required super.showPassword});
}

class AuthTooglePasswordState extends AuthState {
  AuthTooglePasswordState({required super.showPassword});
}

class AuthInvalidPasswordState extends AuthState {
  final String errorMessage;

  AuthInvalidPasswordState({
    required super.showPassword,
    required this.errorMessage,
  });
}
