abstract class CadastrarLojaEvent {}

class SenhaChanged extends CadastrarLojaEvent {
  final String senha;
  SenhaChanged(this.senha);
}

class ConfirmarSenhaChanged extends CadastrarLojaEvent {
  final String confirmarSenha;
  ConfirmarSenhaChanged(this.confirmarSenha);
}

class SubmeterFormulario extends CadastrarLojaEvent {}
