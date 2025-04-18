import 'package:flutter/material.dart';
import 'package:my_book_store/ui/ui.dart';

abstract final class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.grayscaleBackground,
    iconTheme: const IconThemeData(color: AppColors.grayscaleHeader),
    primaryColor: AppColors.primaryDefault,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDefault,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
