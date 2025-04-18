import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_book_store/config/assets.dart';
import 'package:my_book_store/ui/ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(milliseconds: 400),
      () {
        setState(() {
          _animate = true;
        });
      },
    );

    Future.delayed(const Duration(milliseconds: 1800), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primaryDefault,
      body: Stack(
        children: [
          // Logo animado de baixo para o topo
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            top: _animate ? size.height * 0.2 : size.height,
            left: size.width / 2 - 66,
            child: Image.asset(
              Assets.logoWhite,
              height: 132,
              width: 132,
            ),
          ),

          // Texto animado do centro para baixo do logo
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            top: _animate ? size.height * 0.4 : size.height / 2 - 10,
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                'BookStore',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grayscaleBackground,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
