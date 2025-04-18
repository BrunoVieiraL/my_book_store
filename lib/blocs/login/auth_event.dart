abstract class AuthEvent {}

class LoginEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

class TooglePasswordVisibility extends AuthEvent {}

class SubmitLoginEvent extends AuthEvent{}
