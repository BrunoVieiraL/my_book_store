import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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
    final homeBloc = GetIt.instance<HomeBloc>();

    final double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 8,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.menu_book, color: AppColors.primaryDefault),
                  const SizedBox(width: 8),
                  Text(
                    'Olá, ${authResponse.user.name} 👋',
                    style: AppTypography.mobileDisplayMediumBold,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.70,
                    height: 64,
                    child: InputField(
                      hintText: 'Buscar',
                      controller: homeBloc.searchTextController,
                      sufix: IconButton(
                        onPressed: () async {
                          //TODO: ADD SEARCH
                        },
                        icon: const Icon(
                          Icons.search,
                          color: AppColors.grayscaleLabel,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return HomeBottomSheet(homeBloc: homeBloc);
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.tune,
                      color: AppColors.grayscaleHeader,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Livros salvos',
                style: AppTypography.mobileLinkLargeTight,
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
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
                  return Image.asset(Assets.emptyBookCover);
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
