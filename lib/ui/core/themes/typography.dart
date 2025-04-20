import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_book_store/ui/ui.dart';

abstract final class AppTypography {
  static TextStyle desktopLinkSmall = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 0.28,
    letterSpacing: 0.75,
    color: AppColors.grayscaleBackground,
  );

  static TextStyle desktopLinkXSmall = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 0.20,
    letterSpacing: 0.25,
    color: AppColors.primaryDefault,
  );

  static TextStyle desktopTextXSmall = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 0.20,
    letterSpacing: 0.25,
    color: AppColors.grayscaleLabel,
  );

  static TextStyle desktopLinkMediumTight = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 0.24,
    letterSpacing: 0.75,
    color: AppColors.grayscaleBackground,
  );

  static TextStyle mobileDisplayMediumBold = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 0.32,
    letterSpacing: 1,
  );

  static TextStyle mobileDisplaySmallBold = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 0.32,
    letterSpacing: 1,
  );

  static TextStyle mobileLinkSmall = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 0.26,
    letterSpacing: 0.75,
  );

  static TextStyle mobileLinkLargeTight = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height: 0.24,
    letterSpacing: 0.75,
    color: AppColors.grayscaleHeader,
  );
}
