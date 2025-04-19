import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_book_store/blocs/blocs.dart';
import 'package:my_book_store/config/assets.dart';
import 'package:my_book_store/ui/ui.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = GetIt.instance<LoginBloc>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: BlocBuilder<LoginBloc, AuthState>(
          bloc: loginBloc,
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 48),
                  Image.asset(
                    Assets.logoPupleWithText,
                    width: 132,
                    height: 145,
                    filterQuality: FilterQuality.high,
                  ),
                  const SizedBox(height: 32),
                  InputField(
                    label: 'E-mail',
                    controller: loginBloc.emailTextController,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  InputField(
                    label: 'Senha',
                    controller: loginBloc.passwordTextController,
                    textInputAction: TextInputAction.done,
                    errorText: state is AuthInvalidPasswordState
                        ? state.errorMessage
                        : null,
                    obscureText: state.showPassword,
                    onSubimitted: (value) {
                      loginBloc.add(SubmitLoginEvent());
                    },
                    sufix: IconButton(
                      onPressed: () {
                        loginBloc.add(TooglePasswordVisibility());
                      },
                      icon: Icon(
                        state.showPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.grayscaleHeader,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 64,
                    child: ElevatedButton(
                      onPressed: () {
                        loginBloc.add(SubmitLoginEvent());
                      },
                      child: Text(
                        'Entrar',
                        style: AppTypography.desktopLinkSmall.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CadastroLojaScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Cadastre sua loja',
                      style: AppTypography.desktopLinkXSmall,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
