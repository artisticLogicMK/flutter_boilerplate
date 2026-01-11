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
  double get xl2 => 24;
  double get xl3 => 30;
  double get xl4 => 36;
  double get xl5 => 48;
  double get xl6 => 60;
  double get xl7 => 72;
  double get xl8 => 96;
  double get xl9 => 128;
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
