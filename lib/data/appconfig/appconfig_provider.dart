import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:secondbrain/data/appconfig/appconfig_state.dart';

final appConfigProvider =
    AsyncNotifierProvider<AppConfigNotifier, AppConfigState>(
        AppConfigNotifier.new);

class AppConfigNotifier extends AsyncNotifier<AppConfigState> {
  late final Box _box;

  @override
  Future<AppConfigState> build() async {
    _box = Hive.box('app_config');

    // Store indicator datas here e.g isPro, isLaunched etc
    final storedFlags = Map<String, bool>.from(_box.get('flags') ?? {});

    // Load persisted theme mode, default to system
    final themeString = _box.get('theme_mode') as String?;
    ThemeMode themeMode;
    switch (themeString) {
      case 'light':
        themeMode = ThemeMode.light;
        break;
      case 'dark':
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.system;
    }

    // Locale
    final localeCode = _box.get('locale_code') as String?;
    final locale = localeCode != null ? Locale(localeCode) : null;

    return AppConfigState(
      themeMode: themeMode,
      flags: storedFlags,
      locale: locale,
    );
  }




  // ------------- PUBLIC METHODS ----------------

  // Set a flag 
  Future<void> setFlag(String key, bool value) async {
    final updated = Map<String, bool>.from(state.value!.flags)
      ..[key] = value;

    state = AsyncData(state.value!.copyWith(flags: updated));
    await _box.put('flags', updated);

    /* Use in UI like so:
      final config = ref.watch(appConfigProvider);

      if (config.value!.isEnabled('pro')) {
        // show feature
      }
    */
  }

  /// Semantic helper methods (VERY GOOD PRACTICE)
  Future<void> enablePro() async {
    await setFlag('pro', true);
  }

  Future<void> disablePro() async {
    await setFlag('pro', false);
  }


  // Set theme
  Future<void> setThemeMode(ThemeMode mode) async {
    state = AsyncData(state.value!.copyWith(themeMode: mode));

    String storedValue;
    switch (mode) {
      case ThemeMode.light:
        storedValue = 'light';
        break;
      case ThemeMode.dark:
        storedValue = 'dark';
        break;
      default:
        storedValue = 'system';
        break;
    }
    await _box.put('theme_mode', storedValue);
  }


  // Set app language
  Future<void> setLocale(Locale? locale) async {
    state = AsyncData(state.value!.copyWith(locale: locale));

    if (locale == null) {
      await _box.delete('locale_code'); // back to system
    } else {
      await _box.put('locale_code', locale.languageCode);
    }
  }


  // Indicate onboarding screen is seen
  Future<void> setOnboardingSeen(bool seen) async {
    await setFlag('onboardingSeen', seen);
  }
}
