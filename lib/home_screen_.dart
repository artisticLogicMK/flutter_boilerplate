import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secondbrain/components/material_button.dart';
import 'package:secondbrain/data/appconfig/appconfig_provider.dart';
import 'package:secondbrain/data/database/app_database.dart';
import 'package:secondbrain/data/providers/reminders_provider.dart';
import 'package:secondbrain/l10n/app_localizations.dart';
import 'package:secondbrain/services/permission_service.dart';
import 'package:secondbrain/sliver.dart';
import 'theme/theme_extensions.dart';
import 'theme_playground.dart';

class Boiler extends ConsumerWidget {
  const Boiler({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminders = ref.watch(remindersProvider);

    final isDark = Theme.of(context).brightness == Brightness.dark;

    final l10n = AppLocalizations.of(context)!;

    final permissionService =
    ref.read(permissionServiceProvider);

    return Scaffold(
      backgroundColor: context.nt.neutral200,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    ref
                        .read(remindersProvider.notifier)
                        .addReminder(title: "Drink water", type: "daily");
                      final granted = await permissionService.requestLocation();
                  },
                  child: Text('Add Reminder'),
                ),



                remindersWidget(reminders),



                SizedBox(height: 100),



                Consumer(
                  builder: (context, ref, _) {
                    final notifier = ref.read(appConfigProvider.notifier);

                    return Column(
                      children: [
                        Text(
                          'Theming',
                          style: TextStyle(
                            color: context.nt.neutral600,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ListTile(
                          title: Text("${l10n.system}: ${isDark ? 'Dark' : 'Light'}"),
                          onTap: () => notifier.setThemeMode(ThemeMode.system),
                        ),
                        ListTile(
                          title: Text(l10n.light),
                          onTap: () => notifier.setThemeMode(ThemeMode.light),
                        ),
                        ListTile(
                          title: Text(l10n.dark),
                          onTap: () => notifier.setThemeMode(ThemeMode.dark),
                        ),


                        // Locale
                        Text('Locale', style: TextStyle(
                            color: context.nt.neutral600,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ListTile(
                          title: Text(l10n.system),
                          onTap: () => ref
                              .read(appConfigProvider.notifier)
                              .setLocale(null),
                        ),

                        ListTile(
                          title: const Text("English"),
                          onTap: () => ref
                              .read(appConfigProvider.notifier)
                              .setLocale(const Locale('en')),
                        ),

                        ListTile(
                          title: const Text("Español"),
                          onTap: () => ref
                              .read(appConfigProvider.notifier)
                              .setLocale(const Locale('es')),
                        ),
                      ],
                    );
                  },
                ),


                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const Sliver()
                      ),
                    );
                  },
                  child: const Text('Theme Preview'),
                ),

                AppButton(label: "Done", onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget remindersWidget(AsyncValue<List<Reminder>> reminders) {
  return reminders.when(
    loading: () => const CircularProgressIndicator(),
    error: (e, _) => Text('Error: $e'),
    data: (list) => Column(
      children: list.map((r) {
        return ListTile(title: Text(r.title), subtitle: Text(r.type));
      }).toList(),
    ),
  );
}
