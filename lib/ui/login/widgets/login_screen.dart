import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_book_store/blocs/login/login_event.dart';
import 'package:my_book_store/blocs/login/login_state.dart';
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
        child: BlocListener<LoginBloc, LoginState>(
          bloc: loginBloc,
          listener: (context, state) async {
            if (state is LoginSuccessState) {
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
          child: BlocBuilder<LoginBloc, LoginState>(
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
                      controller: loginBloc.usernameTextController,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    InputField(
                      label: 'Senha',
                      controller: loginBloc.passwordTextController,
                      textInputAction: TextInputAction.done,
                      errorText:
                          state is LoginErrorState ? state.errorMessage : null,
                      obscureText: state is LoginTooglePasswordState
                          ? state.showPassword
                          : false,
                      onSubimitted: (value) {},
                      sufix: IconButton(
                        onPressed: () {
                          loginBloc.add(LoginPasswordToogleEvent());
                        },
                        icon: Icon(
                          state is LoginTooglePasswordState
                              ? state.showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.grayscaleHeader,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 64,
                      child: state is LoginLoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              onPressed: () async {
                                loginBloc.add(LoginPressedEvent());
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
      ),
    );
  }
}
