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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: BlocBuilder<LoginBloc, AuthState>(
            bloc: loginBloc,
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.logoPupleWithText,
                    cacheHeight: 145,
                    cacheWidth: 132,
                    filterQuality: FilterQuality.high,
                  ),
                  InputField(
                    label: 'E-mail',
                    controller: loginBloc.emailTextController,
                    textInputType: TextInputType.emailAddress,
                  ),
                  InputField(
                    label: 'Senha',
                    controller: loginBloc.passwordTextController,
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
                  SizedBox(
                    width: double.infinity,
                    height: 64,
                    child: ElevatedButton(
                      onPressed: () {
                        loginBloc.add(SubmitLoginEvent());
                      },
                      child: Text(
                        'Entrar',
                        style: AppTypography.desktopLinkSmall,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // navegação
                    },
                    child: Text(
                      'Cadastre sua loja',
                      style: AppTypography.desktopLinkXSmall,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
