import 'package:flutter/material.dart';

/// ===============================
/// TEXT SIZE VALUES (TAILWIND-LIKE)
/// ===============================

extension TextSizeX on BuildContext {
  AppTextSize get text => const AppTextSize();
}

class AppTextSize {
  const AppTextSize();

  double get xs => 12;
  double get sm => 14;
  double get base => 16;
  double get lg => 18;
  double get xl => 20;
  double get x2l => 24;
  double get x3l => 30;
}

/// ===============================
/// FONT WEIGHT VALUES
/// ===============================

extension FontWeightX on BuildContext {
  AppFontWeight get font => const AppFontWeight();
}

class AppFontWeight {
  const AppFontWeight();

  FontWeight get light => FontWeight.w300;
  FontWeight get regular => FontWeight.w400;
  FontWeight get medium => FontWeight.w500;
  FontWeight get semibold => FontWeight.w600;
  FontWeight get bold => FontWeight.w700;
}
