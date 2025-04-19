abstract class AuthEvent {}

class LogoutEvent extends AuthEvent {}

class TooglePasswordVisibility extends AuthEvent {}

class SubmitLoginEvent extends AuthEvent {}
