import 'package:flutter/material.dart';
import 'package:my_book_store/ui/ui.dart';

class HomeBottomSheet extends StatelessWidget {
  const HomeBottomSheet({super.key, required this.homeBloc});

  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    //TODO: USE FILTER TO REQUEST BOOKS
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    heightFactor: 5,
                    child: Text(
                      'Filtrar',
                      style: AppTypography.mobileDisplayMediumBold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              InputField(
                hintText: 'Filtrar por título',
                controller: homeBloc.bookTitleTextController,
              ),
              const SizedBox(height: 12),
              InputField(
                hintText: 'Filtrar por autor',
                controller: homeBloc.bookAuthorTextController,
              ),
              const SizedBox(height: 24),
              const Text('Ano de publicação'),
              RangeSlider(
                values: const RangeValues(2000, 2020),
                min: 1900,
                max: 2024,
                onChanged: (range) {},
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Avaliação'),
                  Row(
                    children: List.generate(
                      5,
                      (index) => const Icon(Icons.star_border),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Status'),
                  Row(
                    children: [
                      Switch(value: true, onChanged: null), // Substitua depois
                      SizedBox(width: 8),
                      Text('Estoque'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A00FF), // roxo
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Filtrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
