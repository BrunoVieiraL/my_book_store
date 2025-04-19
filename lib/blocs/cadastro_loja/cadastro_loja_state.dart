import 'package:my_book_store/domain/domain.dart';

abstract class CadastrarLojaState {}

class CadastrarLojaFormInitial extends CadastrarLojaState {}

class SenhaInvalida extends CadastrarLojaState {
  final String mensagem;
  SenhaInvalida(this.mensagem);
}

class ConfirmacaoIncorreta extends CadastrarLojaState {
  final String mensagem;
  ConfirmacaoIncorreta(this.mensagem);
}

class FormularioValido extends CadastrarLojaState {}

class SubmissaoEmProgresso extends CadastrarLojaState {}

class CadastroSucesso extends CadastrarLojaState {
  final AuthResponse authResponse;

  CadastroSucesso(this.authResponse);
}

class ErroAoCadastrar extends CadastrarLojaState {
  final String mensagem;

  ErroAoCadastrar(this.mensagem);
}
