import 'package:flutter/material.dart';
import 'package:my_book_store/config/assets.dart';
import 'package:my_book_store/domain/domain.dart';
import 'package:my_book_store/ui/ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.authResponse,
  });

  final AuthResponse authResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.bookmark), label: 'Salvos'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        selectedIndex: 0,
        onDestinationSelected: (index) {
          // TODO: navegação entre abas
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.menu_book, color: AppColors.primaryDefault),
                  const SizedBox(width: 8),
                  Text(
                    'Olá,  👋', //TODO: ADD USER NAME
                    style: AppTypography.mobileDisplayMediumBold,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.tune),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: AppColors.grayscaleInput,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Livros salvos',
                style: AppTypography.mobileLinkLargeTight,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // mock
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return Image.asset(
                      Assets.emptyBookCover,
                      width: 120,
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Todos os livros',
                style: AppTypography.mobileLinkLargeTight,
              ),
              const SizedBox(height: 16),
              GridView.builder(
                itemCount: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return Image.asset(
                    Assets.emptyBookCover,
                  );
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
