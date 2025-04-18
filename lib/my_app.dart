import 'package:flutter/material.dart';
import 'package:my_book_store/flavor.dart';
import 'package:my_book_store/ui/ui.dart';
import 'package:my_book_store/utils/flavor_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      builder: (context, child) => FlavorConfig.instance.flavor == Flavor.qa
          ? Banner(
              message: 'QA',
              textStyle: AppTypography.mobileLinkSmall,
              location: BannerLocation.topStart,
              color: AppColors.primaryDefault,
              child: child,
            )
          : child!,
      home: const SplashScreen(),
    );
  }
}
