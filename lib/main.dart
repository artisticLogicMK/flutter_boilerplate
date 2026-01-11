import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:secondbrain/data/appconfig/appconfig_provider.dart';
import 'package:secondbrain/home_screen.dart';
import 'package:secondbrain/l10n/app_localizations.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('app_config');

  // Pre-load the config before building any UI
  final container = ProviderContainer();
  await container.read(appConfigProvider.future);

  // Enable edge-to-edge display on Android 10+
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); 

  // Set system navigation bar color to transparent
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, 
    // Adjust status bar brightness as needed for visibility
    statusBarIconBrightness: Brightness.dark, 
  ));

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MainApp(),
    ),
  );
}
/* For secure encryption (PROTECT HIVE)
  Reference: lib/unused_code/secure_hive.dart
*/


class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Config is guaranteed to be loaded
    final config = ref.watch(appConfigProvider).requireValue;

    return MaterialApp(
      debugShowCheckedModeBanner: false,


      // ---------- THEME ----------
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: config.themeMode,


      // ---------- LOCALIZATION ----------
      locale: config.locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],


      // ---------- APP ----------
      home: const HomeScreen(),
    );
  }
}
