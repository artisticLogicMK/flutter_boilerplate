// import 'dart:io';
// import 'package:drift/drift.dart';
// import 'package:drift_sqflite/drift_sqflite.dart';
// import 'package:sqflite_sqlcipher/sqflite.dart' as sql;
// import 'package:path/path.dart' as p;
// import 'package:path_provider/path_provider.dart';

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'second_brain.sqlite'));

//     // Retrieve encryption key from secure storage
//     final secureStorage = FlutterSecureStorage();
//     String? encodedKey = await secureStorage.read(key: 'db_key');

//     List<int> key;
//     if (encodedKey == null) {
//       key = List<int>.generate(32, (_) => Random.secure().nextInt(256));
//       await secureStorage.write(key: 'db_key', value: base64UrlEncode(key));
//     } else {
//       key = base64Url.decode(encodedKey);
//     }

//     final db = await sql.openDatabase(
//       file.path,
//       password: base64UrlEncode(key), // SQLCipher uses string password
//     );

//     return DriftSqliteDatabase(db);
//   });
// }
