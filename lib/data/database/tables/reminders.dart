import 'package:drift/drift.dart';

class Reminders extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get type => text()();
}
