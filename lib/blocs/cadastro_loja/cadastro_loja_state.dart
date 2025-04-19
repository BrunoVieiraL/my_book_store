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

class ErroAoSubmeter extends CadastrarLojaState {
  final String mensagem;
  ErroAoSubmeter(this.mensagem);
}
