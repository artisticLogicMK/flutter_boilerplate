import 'package:flutter/material.dart';
import 'neutral_palette.dart';

extension ThemeX on BuildContext {
  NeutralPalette get neutrals =>
      Theme.of(this).extension<NeutralPalette>()!;
}
