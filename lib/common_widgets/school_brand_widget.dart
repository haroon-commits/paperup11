import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';

/// A reusable widget that shows the school logo and name.
/// All values come from [AppUIConfig.strings] — change them there!
class SchoolBrandWidget extends StatelessWidget {
  /// Size of the logo container. Defaults to 56.
  final double logoSize;

  /// Whether to show the school name below the logo. Defaults to true.
  final bool showName;

  /// Axis to lay out the logo and name. Defaults to [Axis.vertical].
  final Axis direction;

  const SchoolBrandWidget({
    super.key,
    this.logoSize = 56,
    this.showName = true,
    this.direction = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    final logoWidget = Container(
      width: logoSize,
      height: logoSize,
      padding: EdgeInsets.all(logoSize * 0.14),
      decoration: BoxDecoration(
        color: AppUIConfig.colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(logoSize * 0.28),
        border: Border.all(
          color: AppUIConfig.colors.white.withOpacity(0.25),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppUIConfig.colors.shadowDark,
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SvgPicture.asset(
        AppUIConfig.strings.schoolLogoAsset,
        colorFilter: ColorFilter.mode(
          AppUIConfig.colors.white,
          BlendMode.srcIn,
        ),
        fit: BoxFit.contain,
      ),
    );

    final nameWidget = Text(
      AppUIConfig.strings.schoolName,
      textAlign: TextAlign.center,
      style: AppUIConfig.text.heading3.copyWith(
        color: AppUIConfig.colors.white,
        fontSize: direction == Axis.horizontal ? 16 : 18,
        letterSpacing: 0.5,
        shadows: [
          Shadow(
            color: AppUIConfig.colors.shadowDark,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );

    if (!showName) return logoWidget;

    if (direction == Axis.horizontal) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          logoWidget,
          SizedBox(width: AppUIConfig.metrics.spacingSmall),
          Flexible(child: nameWidget),
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        logoWidget,
        SizedBox(height: AppUIConfig.metrics.spacingSmall),
        nameWidget,
      ],
    );
  }
}
