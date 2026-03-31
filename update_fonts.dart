import 'dart:io';

void main() async {
  final libDir = Directory('lib');
  final importLine = "import 'package:paperup1/core/theme/app_ui_config.dart';";

  if (!await libDir.exists()) {
    print('lib directory not found');
    return;
  }

  await for (var entity in libDir.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      bool needsSave = false;
      var content = await entity.readAsString();

      // Check if file uses GoogleFonts.outfit(
      if (content.contains('GoogleFonts.outfit(')) {
        content = content.replaceAll('GoogleFonts.outfit(', 'AppUIConfig.primaryFont.copyWith(');
        needsSave = true;
      }

      // Check for padding: const EdgeInsets.all(24) and all(24.0)
      if (content.contains('EdgeInsets.all(24)') || content.contains('EdgeInsets.all(24.0)')) {
        content = content.replaceAll('EdgeInsets.all(24)', 'EdgeInsets.all(AppUIConfig.defaultPadding)');
        content = content.replaceAll('EdgeInsets.all(24.0)', 'EdgeInsets.all(AppUIConfig.defaultPadding)');
        needsSave = true;
      }
      
      // Radius replacements for hardcoded border radius 24
      if (content.contains('BorderRadius.circular(24)') || content.contains('BorderRadius.circular(24.0)')) {
        content = content.replaceAll('BorderRadius.circular(24)', 'BorderRadius.circular(AppUIConfig.cardRadius)');
        content = content.replaceAll('BorderRadius.circular(24.0)', 'BorderRadius.circular(AppUIConfig.cardRadius)');
        needsSave = true;
      }

      if (needsSave) {
        // We need to add the import if it's not present
        if (!content.contains(importLine)) {
          // Add import at the top of the file, after the material import if possible
          if (content.contains("import 'package:flutter/material.dart';")) {
             content = content.replaceFirst(
                "import 'package:flutter/material.dart';", 
                "import 'package:flutter/material.dart';\n$importLine"
             );
          } else {
             content = "$importLine\n$content";
          }
        }
        await entity.writeAsString(content);
        print('Updated: ${entity.path}');
      }
    }
  }
}
