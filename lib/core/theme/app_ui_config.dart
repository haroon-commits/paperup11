import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized Application Configuration (Design System)
/// HOW TO USE FOR NON-DEVELOPERS:
/// This file controls how the entire app looks.
/// - To change colors (like the main app color, text colors, or button colors), look under "1. COLORS".
/// - To change fonts and text sizes, look under "2. TEXT STYLES".
/// - To change spacing, paddings, and the rounded corners of boxes, look under "3. METRICS".
/// - To change common element designs like cards or buttons, look under "4. COMPONENTS".
///
/// You only need to change the values on the right side of the equals sign (=).
/// For example, to change `primaryBackground`, change `Colors.transparent` to `Colors.white` or `Color(0xFF123456)`.
/// There's no need to edit any other file to change the general look and feel!
class AppUIConfig {
  static const colors = _AppColors();
  static final text = _AppTextStyles();
  static const metrics = _AppMetrics();
  static final components = _AppComponentStyles();
  static const strings = _AppStrings();

  // BACKWARD COMPATIBILITY ALIAS (for transition)
  static TextStyle get primaryFont => text.fontBase;
  static TextTheme get textTheme => GoogleFonts.outfitTextTheme();
  static double get defaultPadding => metrics.paddingDefault;
  static double get cardRadius => metrics.radiusLarge;
  static double get defaultSpacing => metrics.spacingDefault;

  static const Color studentPrimary = Color(0xFF007AFF);
  static const Color parentPrimary = Color(0xFF34C759);
  static const Color teacherPrimary = Color(0xFFAF52DE);
  static const Color secondaryColor = Color(0xFF5AC8FA);
  static const Color warningPrimary = Color(0xFFFF9500);
  static const Color alertPrimary = Color(0xFFFF2D55);
}

// For older code relying on AppConfig directly
class AppConfig {
  static const colors = _AppColors();
  static final text = AppUIConfig.text;
  static const metrics = _AppMetrics();
  static final components = AppUIConfig.components;
  static const strings = _AppStrings();
}

// ==========================================
// 1. COLORS
// ==========================================
class _AppColors {
  const _AppColors();

  // --- Core Application Colors ---
  /// The main background color of the app. (Note: Many views use transparent over a gradient background)
  final Color primaryBackground = Colors.transparent;

  /// Pure white, used for text and icons on dark backgrounds
  final Color white = Colors.white;

  /// Pure black, used for dark themes or heavy contrast
  final Color black = Colors.black;

  /// A completely transparent color, used when no background is needed
  final Color transparent = Colors.transparent;

  // --- Theme Specific Colors ---
  final Color studentTheme = const Color(0xFF007AFF);
  final Color parentTheme = const Color(0xFF34C759);
  final Color teacherTheme = const Color(0xFFAF52DE);

  // --- Status & Semantic Colors ---
  /// Used for positive actions, success messages, parent theme
  final Color success = const Color(0xFF34C759); // Premium Green

  /// Used for information, primary actions, student theme
  final Color info = const Color(0xFF007AFF); // Premium Blue

  /// Used for warnings, pending status, or attention-grabbing elements
  final Color warning = const Color(0xFFFF9500); // Premium Orange

  /// Used for errors, destructive actions, or danger
  final Color danger = const Color(0xFFFF2D55); // Premium Red

  // --- Timetable & Subject Colors ---
  final Color subjectMath = const Color(0xFF007AFF);
  final Color subjectPhysics = const Color(0xFF5856D6);
  final Color subjectBreak = const Color.fromARGB(255, 31, 221, 78);
  final Color subjectEnglish = const Color(0xFFAF52DE);
  final Color subjectChemistry = const Color(0xFFFF2D55);

  // --- Structural & UI Colors ---
  /// The background color for cards and containers. (Default: 10% white)
  final Color cardBackground = const Color(0x1AFFFFFF);

  /// The border line color around cards and containers. (Default: 20% white)
  final Color cardBorder = const Color(0x33FFFFFF);

  /// The main text color for most readable content.
  final Color textMain = Colors.white;

  /// A softer text color for descriptions or less important text. (Default: 70% white)
  final Color textMuted = const Color(0xB3FFFFFF);

  /// A very faint text color for captions or tiny details. (Default: 60% white)
  final Color textLight = const Color(0x99FFFFFF);

  /// The color of shadows underneath cards to give a 3D effect.
  final Color shadowDark = const Color(0x4D000000);

  /// A bright highlight color often used to give a glass-like shine effect.
  final Color glassHighlight = const Color(0x26FFFFFF);

  /// Color for dividing lines between list items. (Default: 10% white)
  final Color divider = const Color(0x1AFFFFFF);

  /// Faint white background for active/selected states or pressed buttons
  final Color activeBackground = const Color(0x26FFFFFF);
}

// ==========================================
// 2. TEXT STYLES (Typography)
// ==========================================
class _AppTextStyles {
  // --- Base Font Family ---
  /// The main font used everywhere in the app. Change this to change the whole app's font!
  TextStyle get fontBase => GoogleFonts.outfit();

  // --- Headings ---
  /// The biggest title style, used for main page headers (e.g., "PaperUp.")
  TextStyle get heading1 => fontBase.copyWith(
    color: AppUIConfig.colors.textMain,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: -1,
  );

  /// Medium-large titles, used for important section headers
  TextStyle get heading2 => fontBase.copyWith(
    color: AppUIConfig.colors.textMain,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        color: AppUIConfig.colors.shadowDark,
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  );

  /// Smaller titles, used for card headers or subsections
  TextStyle get heading3 => fontBase.copyWith(
    color: AppUIConfig.colors.textMain,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.1,
  );

  // --- Body and Content ---
  /// The standard text style for regular paragraphs and descriptions
  TextStyle get body => fontBase.copyWith(
    color: AppUIConfig.colors.textMuted,
    fontSize: 14,
    height: 1.4,
    shadows: [
      const Shadow(
        color: Color(0x33000000),
        blurRadius: 2,
      ), // black.withOpacity(0.2)
    ],
  );

  /// A bolder version of the regular body text, used for emphasis
  TextStyle get bodySemiBold => fontBase.copyWith(
    color: AppUIConfig.colors.textMain,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  /// Regular text that defaults to textMain instead of textMuted.
  TextStyle get bodyBright => fontBase.copyWith(
    color: AppUIConfig.colors.textMain,
    fontSize: 14,
    height: 1.4,
  );

  // --- Captions & Badges ---
  /// Tiny text used for dates, times, or super small labels
  TextStyle get caption => fontBase.copyWith(
    fontSize: 11,
    color: AppUIConfig.colors.textLight,
    fontWeight: FontWeight.w900,
    letterSpacing: 0.5,
  );

  /// Tiny text specifically used inside small completely rounded badges (chips)
  TextStyle get chip => fontBase.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w900,
    color: const Color(0xE6FFFFFF), // textMain.withOpacity(0.9)
    letterSpacing: 1,
  );

  /// Style applied to text inside big primary App Buttons
  TextStyle get button => fontBase.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppUIConfig.colors.white,
  );
}

// ==========================================
// 3. METRICS & SIZES (Layout)
// ==========================================
class _AppMetrics {
  const _AppMetrics();

  // --- Paddings (Space inside a box) ---
  /// Very small inner spacing
  final double paddingTiny = 8.0;

  /// Small inner spacing, like inside a tight card
  final double paddingSmall = 12.0;

  /// The standard inner spacing used for most screens and containers
  final double paddingDefault = 16.0;

  /// Large inner spacing, for spacious screens or big cards
  final double paddingLarge = 24.0;

  // --- Spacings/Margins (Space between boxes) ---
  /// Tiny gap between items (e.g. icon and text)
  final double spacingTiny = 4.0;

  /// Small gap between closely related items
  final double spacingSmall = 8.0;

  /// Standard gap between most sections
  final double spacingDefault = 16.0;

  /// Large gap to separate distinct big sections of a page
  final double spacingLarge = 24.0;

  /// Extra large gap for major sections
  final double spacingExtraLarge = 32.0;

  // --- Border Radii (How round the corners are) ---
  /// Slightly rounded corners (e.g. small tags)
  final double radiusSmall = 8.0;

  /// Standard rounded corners for most cards and inputs
  final double radiusDefault = 16.0;

  /// Very rounded corners for major, soft-looking containers
  final double radiusLarge = 24.0;

  /// Circular corner radius used for massive rounded bases.
  final double radiusExtraLarge = 32.0;

  /// Fully rounded (pill shape), perfectly circular for avatar edges or buttons
  final double radiusPill = 999.0;

  // --- Icon Sizes ---
  final double iconSizeSmall = 16.0;
  final double iconSizeDefault = 24.0;
  final double iconSizeLarge = 32.0;
}

// ==========================================
// 4. COMPONENT STYLES
// ==========================================
class _AppComponentStyles {
  // Styles for common structural pieces.

  /// Standard Edge Insets for page borders
  EdgeInsets get pagePadding =>
      EdgeInsets.all(AppUIConfig.metrics.paddingLarge); // used originally as 24

  /// Standard Edge Insets for inner cards
  EdgeInsets get cardPadding => EdgeInsets.all(
    AppUIConfig.metrics.paddingDefault,
  ); // used originally as 16

  /// Default Border Radius object for big containers (like GlassContainer)
  BorderRadius get containerRadius =>
      BorderRadius.circular(AppUIConfig.metrics.radiusLarge);

  /// Default Border Radius object for Bottom Sheets or Sliders
  BorderRadius get bottomSheetRadius => BorderRadius.vertical(
    bottom: Radius.circular(AppUIConfig.metrics.radiusExtraLarge),
  );

  /// Default Border Radius for input fields or small buttons
  BorderRadius get inputRadius =>
      BorderRadius.circular(AppUIConfig.metrics.radiusDefault);
}

// ==========================================
// 5. STRINGS
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

  // Global & Navigation
  final String appName = 'PaperUp.';
  final String goToDashboard = 'Go to Dashboard';
  final String error404 = '404';
  final String pageNotFound = 'Page Not Found';
  final String errorPrefix = 'Error:';

  // Auth / Login
  final String loginSubtitle = 'THE FUTUR OF SCHOOLING';
  final String studentEmailLabel = 'STUDENT EMAIL';
  final String passwordLabel = 'PASSWORD';
  final String getStartedButton = 'GET STARTED';
  final String fastAccessDemo = 'FAST ACCESS FOR DEMO';

  // Dashboard
  final String quickStats = 'Quick Stats';
  final String quickActions = 'Quick Actions';
  final String goodMorning = 'Good Morning,';
  final String fallbackStudentName = 'Student';
  final String markAttendance = 'Mark Attendance';
  final String uploadHomework = 'Upload Homework';
  final String enterMarks = 'Enter Marks';
  final String syllabus = 'Syllabus';
  final String attendance = 'Attendance';
  final String classes = 'Classes';
  final String feesDue = 'Fees Due';
  final String messages = 'Messages';

  // Profile & Theme Settings
  final String profileTitle = 'Profile';
  final String profileAccountSettings = 'Account Settings';
  final String profileAppPreferences = 'App Preferences';
  final String personalInfo = 'Personal Information';
  final String privacySecurity = 'Privacy & Security';
  final String notificationSettings = 'Notification Settings';
  final String themeCustomization = 'Theme Customization';
  final String languageSetting = 'Language (English)';
  final String helpSupport = 'Help & Support';
  final String signOut = 'Sign Out';
  final String appearanceTitle = 'Appearance';
  final String appearanceSubtitle = 'Personalize your experience';
  final String themeDesignStyle = 'Design Style';
  final String themePrimaryColor = 'Primary Color';
  final String themePremiumFeatures = 'Premium Features';
  final String themeAnimBgTitle = 'Animated Background';
  final String themeAnimBgSub = 'Top-notch organic liquid effects';
  final String themeGlass = 'Glass';
  final String themeNeo = 'Neo';
  final String themeClean = 'Clean';

  // Attendance & Messages
  final String attendanceSubtitle = 'Academic Records';
  final String messagesTitle = 'Notifications';
  final String messagesSubtitle = 'Latest Updates';
}
