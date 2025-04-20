import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_book_store/blocs/blocs.dart';
import 'package:my_book_store/domain/domain.dart';
import 'package:my_book_store/ui/ui.dart';

class NavigationBarScreen extends StatelessWidget {
  const NavigationBarScreen({
    super.key,
    required this.authResponse,
  });

  final AuthResponse authResponse;

  @override
  Widget build(BuildContext context) {
    final naviBarBloc = GetIt.instance<NavigationBarBloc>();

    return BlocBuilder(
      bloc: naviBarBloc,
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: NavigationBar(
            indicatorColor: Colors.transparent,
            labelBehavior:
                authResponse.user.isAdmin != null && authResponse.user.isAdmin!
                    ? NavigationDestinationLabelBehavior.onlyShowSelected
                    : NavigationDestinationLabelBehavior.alwaysShow,
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              if (authResponse.user.isAdmin!)
                const NavigationDestination(
                  icon: Icon(Icons.search),
                  label: 'Funcionarios',
                ),
              NavigationDestination(
                icon: Icon(
                  authResponse.user.isAdmin!
                      ? Icons.receipt_long_outlined
                      : Icons.bookmark_border,
                ),
                label: 'Salvos',
              ),
              const NavigationDestination(
                icon: Icon(Icons.person_outline),
                label: 'Perfil',
              ),
            ],
            selectedIndex:
                state is NavigationBarDestinationChangedState ? state.index : 0,
            onDestinationSelected: (index) {
              naviBarBloc.add(NavigationBarDestinationChangeEvent(index));
            },
          ),
          body: [
            HomeScreen(authResponse: authResponse),
            EmployeeScreen(authResponse: authResponse),
            Container(),
            Container(),
          ][state is NavigationBarDestinationChangedState ? state.index : 0],
        );
      },
    );
  }
}
