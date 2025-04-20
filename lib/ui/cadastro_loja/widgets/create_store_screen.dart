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
    final createStoreBloc = GetIt.instance<CreateStoreBloc>();

    return BlocListener<CreateStoreBloc, CreateStoreState>(
      bloc: createStoreBloc,
      listener: (context, state) async {
        if (state is CreateStoreSuccesState) {
          await Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NavigationBarScreen(
                authResponse: state.authResponse,
              ),
            ),
          );
        }
      },
      child: BlocBuilder<CreateStoreBloc, CreateStoreState>(
        bloc: createStoreBloc,
        builder: (context, state) {
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
              child: state is CreateStoreLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        createStoreBloc.add(CreateStorePressedEvent());
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
                        controller: createStoreBloc.nameStoreTextController,
                        textInputAction: TextInputAction.next,
                      ),
                      InputField(
                        label: 'Slogan da Loja',
                        controller: createStoreBloc.sloganStoreTextController,
                        textInputAction: TextInputAction.next,
                      ),
                      InputField(
                        label: 'Banner da Loja',
                        controller: createStoreBloc.bannerStoreTextController,
                        textInputAction: TextInputAction.next,
                      ),
                      InputField(
                        label: 'Nome do Administrador',
                        controller: createStoreBloc.adminTextController,
                        textInputAction: TextInputAction.next,
                      ),
                      InputField(
                        label: 'Senha',
                        controller: createStoreBloc.passwordTextController,
                        textInputAction: TextInputAction.next,
                        obscureText: state is CreateStoreVisibilityState
                            ? state.showPassword
                            : false,
                        sufix: IconButton(
                          onPressed: () {
                            createStoreBloc
                                .add(CreateStoreTooglePasswordEvent());
                          },
                          icon: const Icon(Icons.visibility),
                        ),
                      ),
                      InputField(
                        label: 'Repetir Senha',
                        controller:
                            createStoreBloc.passwordRepeatTextController,
                        textInputAction: TextInputAction.done,
                        obscureText: state is CreateStoreVisibilityState
                            ? state.showRepeatPassword
                            : false,
                        sufix: IconButton(
                          onPressed: () {
                            createStoreBloc
                                .add(CreateStoreToogleRepeatPasswordEvent());
                          },
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
      ),
    );
  }
}
