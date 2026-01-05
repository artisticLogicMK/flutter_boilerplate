import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/app_database.dart';
import 'database_provider.dart';

final remindersProvider =
    AsyncNotifierProvider<RemindersNotifier, List<Reminder>>(
        RemindersNotifier.new);

class RemindersNotifier extends AsyncNotifier<List<Reminder>> {
  late final AppDatabase _db;

  @override
  Future<List<Reminder>> build() async {
    _db = ref.read(databaseProvider);
    return _db.select(_db.reminders).get();
  }

  Future<void> addReminder({
    required String title,
    required String type,
  }) async {
    // Optional optimistic update later
    await _db.into(_db.reminders).insert(
      RemindersCompanion.insert(
        title: title,
        type: type,
      ),
    );

    state = AsyncData(
      await _db.select(_db.reminders).get(),
    );
  }
}
