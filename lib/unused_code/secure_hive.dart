// // Use main.dart -> void main()

// import 'dart:convert';
// import 'dart:math';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Hive.initFlutter();

//   // Generate or retrieve encryption key
//   final secureStorage = FlutterSecureStorage();
//   String? encodedKey = await secureStorage.read(key: 'hive_key');

//   List<int> encryptionKey;
//   if (encodedKey == null) {
//     final key = List<int>.generate(32, (_) => Random.secure().nextInt(256));
//     await secureStorage.write(key: 'hive_key', value: base64UrlEncode(key));
//     encryptionKey = key;
//   } else {
//     encryptionKey = base64Url.decode(encodedKey);
//   }

//   await Hive.openBox(
//     'app_config',
//     encryptionCipher: HiveAesCipher(encryptionKey),
//   );

//   // Pre-load config AsyncNotifier
//   final container = ProviderContainer();
//   await container.read(appConfigProvider.future);

//   runApp(
//     UncontrolledProviderScope(
//       container: container,
//       child: const MainApp(),
//     ),
//   );
// }
