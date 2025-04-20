import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_store/blocs/blocs.dart';
import 'package:my_book_store/domain/domain.dart';
import 'package:my_book_store/ui/ui.dart';

class EmployeeAddEdit extends StatelessWidget {
  const EmployeeAddEdit({
    super.key,
    required this.employeeBloc,
    required this.authResponse,
    this.user,
  });

  final EmployeeBloc employeeBloc;
  final AuthResponse authResponse;
  final User? user;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton.filled(
          color: AppColors.grayscaleBackground,
          style:
              IconButton.styleFrom(backgroundColor: AppColors.primaryDefault),
          onPressed: () {},
          icon: const Icon(Icons.chevron_left),
        ),
        title: Text(
          user != null ? 'Editar funcionário' : 'Novo funcionário',
          style: AppTypography.mobileDisplayMediumBold,
        ),
      ),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        bloc: employeeBloc,
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            spacing: 16,
            children: [
              CircleAvatar(
                minRadius: 62,
                child: Text(
                  user != null ? user!.initialLetters! : 'NV',
                  style: AppTypography.desktopLinkMediumTight,
                ),
              ),
              InputField(
                controller: employeeBloc.nameEmployeeTextController,
                hintText: 'Nome',
              ),
              InputField(
                controller: employeeBloc.usernameEmployeeTextController,
                hintText: 'User name',
              ),
              InputField(
                controller: employeeBloc.passwordEmployeeTextController,
                label: 'Senha',
                obscureText:
                    state is EmployeePasswordState ? state.showPassword : false,
                sufix: IconButton(
                  onPressed: () {
                    employeeBloc.add(EmployeeTooglePasswordEvent());
                  },
                  icon: const Icon(Icons.visibility),
                ),
              ),
              SizedBox(height: height * 0.21),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    employeeBloc.add(EmployeeAddEvent(
                      authResponse.store.id!,
                      authResponse.token,
                    ));
                    if (state is EmployeeAddSuccessState) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Salvar',
                    style: AppTypography.desktopLinkSmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
