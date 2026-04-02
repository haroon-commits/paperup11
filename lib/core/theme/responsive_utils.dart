import 'package:flutter/material.dart';

/// Utility class for global adaptive scaling across all screen sizes.
/// It uses a baseline width of 375.0 (standard modern phone) to calculate
/// a scaling factor that is then applied to all static metrics.
class Responsive {
  static late MediaQueryData _mediaQueryData;
  static double screenWidth = 375.0;
  static double screenHeight = 812.0;
  static double scaleFactor = 1.0;
  static bool isTablet = false;

  /// Initializes the responsive scaling engine. 
  /// Should be called at the very beginning of the app's build method (in main.dart).
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    
    // Calculate the scale factor relative to a 375px wide design
    // We cap the scaling at 1.4 for tablets to ensure the UI stays elegant 
    // rather than just becoming "giant".
    double factor = screenWidth / 375.0;
    
    isTablet = screenWidth >= 600;
    
    if (isTablet) {
      scaleFactor = factor.clamp(1.0, 1.4);
    } else {
      scaleFactor = factor;
    }
  }

  /// Scales a value based on the screen width.
  static double s(double size) => (size * scaleFactor).roundToDouble();

  /// Scales a value based on the screen width, with no cap (use sparingly).
  static double sFull(double size) => (size * (screenWidth / 375.0)).roundToDouble();

  /// Returns localized horizontal padding based on device type for global consistency.
  static double get pagePadding => isTablet ? s(32.0) : s(24.0);
}

/// Extension for easy access to responsive sizing directly on numbers.
extension ResponsiveSizeExtension on num {
  double get s => Responsive.s(toDouble());
  double get sf => Responsive.sFull(toDouble());
}
