import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_store/blocs/blocs.dart';
import 'package:my_book_store/data/data.dart';
import 'package:my_book_store/domain/domain.dart';

class CadastroLojaBloc extends Bloc<CadastrarLojaEvent, CadastrarLojaState> {
  final CadastroLojaRepository _cadastroLojaRepository;
  final nomeLojaTextController = TextEditingController();
  final sloganLojaTextController = TextEditingController();
  final bannerLojaTextController = TextEditingController();
  final nomeAdminTextController = TextEditingController();
  final senhaTextController = TextEditingController();
  final repetirSenhaTextController = TextEditingController();

  final senhaFocusNode = FocusNode();
  final repetirSenhaFocusNode = FocusNode();

  String _senha = '';
  String _confirmarSenha = '';

  CadastroLojaBloc(this._cadastroLojaRepository)
      : super(CadastrarLojaFormInitial()) {
    on<SenhaChanged>((event, emit) {
      _senha = event.senha;
      _validarCampos(emit);
    });

    on<ConfirmarSenhaChanged>((event, emit) {
      _confirmarSenha = event.confirmarSenha;
      _validarCampos(emit);
    });

    on<SubmeterFormulario>((event, emit) async {
      if (!_validarSenha(_senha)) {
        emit(SenhaInvalida("A senha não atende aos critérios."));
        return;
      }

      if (_senha != _confirmarSenha) {
        emit(ConfirmacaoIncorreta("As senhas não coincidem."));
        return;
      }

      emit(SubmissaoEmProgresso());

      emit(SubmissaoEmProgresso());

      try {
        final response = await _cadastroLojaRepository.cadastrarLoja(
          Store(
            name: nomeLojaTextController.text,
            slogan: sloganLojaTextController.text,
            banner: bannerLojaTextController.text,
          ),
          User(
            name: nomeAdminTextController.text,
            username: nomeAdminTextController.text.toLowerCase(),
            photo: '',
          ),
        ); // implemente isso
        emit(CadastroSucesso(response));
      } catch (e) {
        emit(ErroAoCadastrar("Erro ao cadastrar loja: $e"));
      }
    });
  }

  void _validarCampos(Emitter emit) {
    if (!_validarSenha(_senha)) {
      emit(SenhaInvalida(
          "A senha deve ter entre 6 e 10 caracteres, conter uma letra maiúscula e um caractere especial."));
    } else if (_confirmarSenha.isNotEmpty && _senha != _confirmarSenha) {
      emit(ConfirmacaoIncorreta("As senhas não coincidem."));
    } else {
      emit(FormularioValido());
    }
  }

  bool _validarSenha(String senha) {
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*[!@#\$&*~]).{7,9}$');
    return regex.hasMatch(senha);
  }

  @override
  Future<void> close() {
    nomeLojaTextController.dispose();
    sloganLojaTextController.dispose();
    bannerLojaTextController.dispose();
    nomeAdminTextController.dispose();
    senhaTextController.dispose();
    repetirSenhaTextController.dispose();
    senhaFocusNode.dispose();
    repetirSenhaFocusNode.dispose();
    return super.close();
  }
}
