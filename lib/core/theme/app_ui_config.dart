import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized configuration file for the app's visual identity.
/// Any developer (even without Flutter experience) can change the app's
/// colors, typography, and spacing from this single file.
class AppUIConfig {
  // ==========================================
  // 1. TYPOGRAPHY CONFIGURATION
  // ==========================================

  /// The primary font family used across the application.
  /// To change the font, simply replace 'outfit' below with another Google Font.
  /// Examples: GoogleFonts.roboto(), GoogleFonts.inter(), GoogleFonts.poppins()
  static TextStyle get primaryFont => GoogleFonts.outfit();

  /// Default text theme builder using the primary font.
  static TextTheme get textTheme => GoogleFonts.outfitTextTheme();

  // ==========================================
  // 2. GLOBAL MEASUREMENT TOKENS
  // ==========================================

  /// The standard padding applied to the edges of most screens and cards.
  static const double defaultPadding = 24.0;

  /// The standard roundness of cards and modals.
  static const double cardRadius = 24.0;

  /// The default spacing between elements in a list or column.
  static const double defaultSpacing = 16.0;

  // ==========================================
  // 3. DEFAULT ROLE COLORS
  // ==========================================

  /// Default color for Students (typically a vibrant iOS-style blue)
  static const Color studentPrimary = Color(0xFF007AFF);

  /// Default color for Parents (typically a vibrant green)
  static const Color parentPrimary = Color(0xFF34C759);

  /// Default color for Teachers (typically a vibrant purple)
  static const Color teacherPrimary = Color(0xFFAF52DE);

  /// Default color for secondary situations (typically a bright blue-cyan)
  static const Color secondaryColor = Color(0xFF5AC8FA);

  /// Default color for negative/warning situations (e.g., absent, fees due)
  static const Color warningPrimary = Color(0xFFFF9500);

  /// Default color for critical alerts or errors
  static const Color alertPrimary = Color(0xFFFF2D55);
}
