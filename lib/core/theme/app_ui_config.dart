import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppUIConfig {
  static TextStyle get primaryFont => GoogleFonts.outfit();
  static TextTheme get textTheme => GoogleFonts.outfitTextTheme();
  static const double defaultPadding = 24.0;
  static const double cardRadius = 24.0;
  static const double defaultSpacing = 16.0;
  static const Color studentPrimary = Color(0xFF007AFF);
  static const Color parentPrimary = Color(0xFF34C759);
  static const Color teacherPrimary = Color(0xFFAF52DE);
  static const Color secondaryColor = Color(0xFF5AC8FA);
  static const Color warningPrimary = Color(0xFFFF9500);
  static const Color alertPrimary = Color(0xFFFF2D55);
}
