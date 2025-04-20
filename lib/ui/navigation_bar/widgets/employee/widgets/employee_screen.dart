import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_book_store/blocs/blocs.dart';
import 'package:my_book_store/domain/domain.dart';
import 'package:my_book_store/ui/ui.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key, required this.authResponse});

  final AuthResponse authResponse;

  @override
  Widget build(BuildContext context) {
    final employeeBloc = GetIt.instance<EmployeeBloc>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      employeeBloc.add(EmployeeLoadEvent(
        authResponse.store.id!,
        authResponse.token,
      ));
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionários'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryDefault,
        child: const Icon(
          Icons.add,
          color: AppColors.grayscaleBackground,
        ),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmployeeAddEdit(
                employeeBloc: employeeBloc,
                authResponse: authResponse,
              ),
            ),
          );
        },
      ),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
          bloc: employeeBloc,
          builder: (context, state) {
            if (state is EmployeeLoadedState) {
              return state.employees.isEmpty
                  ? const Center(
                      child: Text('Nenhum funcionário cadastrado'),
                    )
                  : ListView.builder(
                      itemCount: state.employees.length,
                      itemBuilder: (context, index) {
                        User user = state.employees[index];

                        return SizedBox(
                          height: 56,
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Text(
                                  user.initialLetters!,
                                  style: AppTypography.desktopLinkXSmall,
                                ),
                              ),
                              Text(
                                user.name,
                                style: AppTypography.desktopLinkXSmall,
                              ),
                              IconButton(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EmployeeAddEdit(
                                        employeeBloc: employeeBloc,
                                        authResponse: authResponse,
                                        user: user,
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.edit_outlined,
                                  color: AppColors.grayscaleHeader,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  employeeBloc.add(EmployeeEditEvent());
                                },
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: AppColors.grayscaleHeader,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
