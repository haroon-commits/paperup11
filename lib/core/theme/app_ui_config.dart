import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized Application Configuration (Design System)
/// All UI parameters (Colors, Text, Spacing, Strings) must be fetched from this file.
class AppConfig {
  static const colors = _AppColors();
  static final text = _AppTextStyles();
  static const metrics = _AppMetrics();
  static const strings = _AppStrings();
}

// ==========================================
// 1. COLORS
// ==========================================
class _AppColors {
  const _AppColors();

  // Common UI Colors
  final Color primaryBackground = Colors.transparent;
  final Color white = Colors.white;
  final Color black = Colors.black;
  
  // Status Colors (e.g., Homework, Fees)
  final Color success = const Color(0xFF34C759); // Premium Green
  final Color info = const Color(0xFF007AFF);    // Premium Blue
  final Color warning = const Color(0xFFFF9500); // Premium Orange
  final Color danger = const Color(0xFFFF2D55);  // Premium Red
  
  // Timetable Subject Colors
  final Color subjectMath = const Color(0xFF007AFF);
  final Color subjectPhysics = const Color(0xFF5856D6);
  final Color subjectBreak = const Color(0xFF34C759);
  final Color subjectEnglish = const Color(0xFFAF52DE);
  final Color subjectChemistry = const Color(0xFFFF2D55);

  // Structural Colors (Using exact ARGB hex to remain const if needed)
  final Color cardBackground = const Color(0x1AFFFFFF); // white.withOpacity(0.1)
  final Color cardBorder = const Color(0x33FFFFFF);     // white.withOpacity(0.2)
  final Color textMain = Colors.white;
  final Color textMuted = const Color(0xB3FFFFFF);      // white.withOpacity(0.7)
  final Color textLight = const Color(0x99FFFFFF);      // white.withOpacity(0.6)
  final Color shadowDark = const Color(0x4D000000);     // black.withOpacity(0.3)
  final Color glassHighlight = const Color(0x26FFFFFF); // white.withOpacity(0.15)
}

// ==========================================
// 2. TEXT STYLES (Typography)
// ==========================================
class _AppTextStyles {
  // Base Font Family
  TextStyle get fontBase => GoogleFonts.outfit();

  // Headings
  TextStyle get heading1 => fontBase.copyWith(
        color: AppConfig.colors.textMain,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      );

  TextStyle get heading2 => fontBase.copyWith(
        color: AppConfig.colors.textMain,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: AppConfig.colors.shadowDark,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      );

  TextStyle get heading3 => fontBase.copyWith(
        color: AppConfig.colors.textMain,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.1,
      );

  // Body and Content
  TextStyle get body => fontBase.copyWith(
        color: AppConfig.colors.textMuted,
        fontSize: 14,
        height: 1.4,
        shadows: [
          const Shadow(color: Color(0x33000000), blurRadius: 2), // black.withOpacity(0.2)
        ],
      );

  TextStyle get bodySemiBold => fontBase.copyWith(
        color: AppConfig.colors.textMain,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );

  // Captions & Badges
  TextStyle get caption => fontBase.copyWith(
        fontSize: 11,
        color: AppConfig.colors.textLight,
        fontWeight: FontWeight.w900,
        letterSpacing: 0.5,
      );
      
  TextStyle get chip => fontBase.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w900,
        color: const Color(0xE6FFFFFF), // textMain.withOpacity(0.9)
        letterSpacing: 1,
      );
}

// ==========================================
// 3. METRICS & SIZES (Layout)
// ==========================================
class _AppMetrics {
  const _AppMetrics();

  final double paddingSmall = 10.0;
  final double paddingDefault = 20.0;
  final double paddingLarge = 24.0;
  
  final double spacingSmall = 8.0;
  final double spacingDefault = 16.0;
  final double spacingLarge = 24.0;

  final double radiusSmall = 8.0;
  final double radiusDefault = 12.0;
  final double radiusLarge = 24.0;
  
  final double iconSizeSmall = 14.0;
  final double iconSizeDefault = 20.0;
  final double iconSizeLarge = 28.0;
}

// ==========================================
// 4. STRINGS
// ==========================================
class _AppStrings {
  const _AppStrings();

  final String homeworkTitle = 'Homework';
  final String homeworkSubtitle = 'Assignments & Tasks';
  final String submitButton = 'Submit Now';
  final String dueDatePrefix = 'DUE: ';
  
  final String feesTitle = 'Fees Hub';
  final String feesSubtitle = 'Payments & Invoices';
  final String payNow = 'Pay Now';
  final String availableBalance = 'AVAILABLE BALANCE';
  final String paidOnPrefix = 'PAID ON ';
  final String dueByPrefix = 'DUE BY ';
  
  final String timetableTitle = 'Timetable';
  final String timetableSubtitle = 'Class Schedule';
  
  final String resultsTitle = 'Results';
  final String resultsSubtitle = 'Exam Performance';
}

// ==========================================
// BACKWARD COMPATIBILITY ALIAS (for transition)
// ==========================================
class AppUIConfig {
  static TextStyle get primaryFont => AppConfig.text.fontBase;
  static TextTheme get textTheme => GoogleFonts.outfitTextTheme();
  static const double defaultPadding = 24.0; // Restored to const
  static const double cardRadius = 24.0;     // Restored to const
  static const double defaultSpacing = 16.0; // Restored to const
  static const Color studentPrimary = Color(0xFF007AFF);
  static const Color parentPrimary = Color(0xFF34C759);
  static const Color teacherPrimary = Color(0xFFAF52DE);
  static const Color secondaryColor = Color(0xFF5AC8FA);
  static const Color warningPrimary = Color(0xFFFF9500);
  static const Color alertPrimary = Color(0xFFFF2D55);
}
