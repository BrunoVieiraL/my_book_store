import 'package:flutter/material.dart';
import 'package:my_book_store/ui/core/themes/colors.dart';
import 'package:my_book_store/ui/core/themes/typography.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.sufix,
    required this.label,
    required this.controller,
    this.onSubimitted,
    this.obscureText = false,
    this.textInputType,
    this.errorText,
    this.textInputAction,
    this.focusNode,
  });

  final Widget? sufix;
  final String label;
  final TextEditingController controller;
  final Function(String value)? onSubimitted;
  final bool obscureText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? errorText;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode, // ✅ Adicionado
      obscureText: obscureText,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      onSubmitted: onSubimitted,
      decoration: InputDecoration(
        suffix: sufix,
        labelText: label,
        errorText: errorText,
        labelStyle: AppTypography.desktopTextXSmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.grayscaleHeader,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        fillColor: AppColors.grayscaleInput,
        filled: true,
      ),
    );
  }
}
