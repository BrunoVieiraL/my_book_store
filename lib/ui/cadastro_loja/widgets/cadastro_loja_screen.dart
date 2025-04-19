import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_book_store/blocs/blocs.dart';
import 'package:my_book_store/config/assets.dart';
import 'package:my_book_store/ui/ui.dart';

class CadastroLojaScreen extends StatelessWidget {
  const CadastroLojaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cadastroLojaBloc = GetIt.instance<CadastroLojaBloc>();

    return BlocBuilder(
      bloc: cadastroLojaBloc,
      builder: (context, state) {
        if (state is SenhaInvalida || state is ConfirmacaoIncorreta) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text((state as dynamic).mensagem)),
          );
        }

        if (state is FormularioValido) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Formulário válido!')),
          );
          //TODO: NAVIGATE TO HOME
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Cadastrar Loja',
              style: AppTypography.mobileDisplayMediumBold,
            ),
            leading: IconButton.filled(
              style: IconButton.styleFrom(
                backgroundColor: AppColors.primaryDefault,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.chevron_left,
                color: AppColors.grayscaleBackground,
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                cadastroLojaBloc.add(SubmeterFormulario());
              },
              child: Text(
                'Salvar',
                style: AppTypography.desktopLinkSmall,
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 16,
                  children: [
                    Image.asset(
                      Assets.logoPupleWithText,
                      width: 132,
                      height: 145,
                    ),
                    InputField(
                      label: 'Nome da Loja',
                      controller: cadastroLojaBloc.nomeLojaTextController,
                      textInputAction: TextInputAction.next,
                    ),
                    InputField(
                      label: 'Slogan da Loja',
                      controller: cadastroLojaBloc.sloganLojaTextController,
                      textInputAction: TextInputAction.next,
                    ),
                    InputField(
                      label: 'Banner da Loja',
                      controller: cadastroLojaBloc.bannerLojaTextController,
                      textInputAction: TextInputAction.next,
                    ),
                    InputField(
                      label: 'Nome do Administrador',
                      controller: cadastroLojaBloc.nomeAdminTextController,
                      textInputAction: TextInputAction.next,
                    ),
                    InputField(
                      label: 'Senha',
                      controller: cadastroLojaBloc.senhaTextController,
                      focusNode: cadastroLojaBloc.senhaFocusNode,
                      textInputAction: TextInputAction.next,
                      onSubimitted: (value) {
                        cadastroLojaBloc.add(SenhaChanged(value));
                        FocusScope.of(context).requestFocus(
                            cadastroLojaBloc.repetirSenhaFocusNode);
                      },
                      sufix: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.visibility),
                      ),
                    ),
                    InputField(
                      label: 'Repetir Senha',
                      controller: cadastroLojaBloc.repetirSenhaTextController,
                      focusNode: cadastroLojaBloc.repetirSenhaFocusNode,
                      textInputAction: TextInputAction.done,
                      onSubimitted: (value) {
                        cadastroLojaBloc.add(ConfirmarSenhaChanged(value));
                      },
                      sufix: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.visibility),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
