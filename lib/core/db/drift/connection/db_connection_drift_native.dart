import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart'; // Import for getApplicationDocumentsDirectory()

Future<DatabaseConnection> connect(
  String dbName, {
  bool logStatements = false,
  bool inMemory = false,
  bool isDev = false,
}) async {
  if (inMemory) {
    return DatabaseConnection(
        NativeDatabase.memory(logStatements: logStatements));
  } else if (isDev) {
    // Development directory setup
    Directory dbFolder;

    if (Platform.isAndroid || Platform.isIOS) {
      // For mobile platforms, use the application's documents directory
      final appDocDir = await getApplicationDocumentsDirectory();
      dbFolder = Directory(p.join(appDocDir.path, 'dev_db'));
    } else {
      // For other platforms, use a more accessible directory (e.g., current directory for desktop)
      final projectDir = Directory.current.path;
      dbFolder = Directory(p.join(projectDir, 'lib', 'core', 'db', 'test_db'));
    }

    // Ensure the directory exists
    await dbFolder.create(recursive: true);

    final file = File(p.join(dbFolder.path, dbName));
    return DatabaseConnection(
        NativeDatabase(file, logStatements: logStatements));
  } else {
    // Persistent database for production or other environments
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, dbName));
    return DatabaseConnection(
        NativeDatabase(file, logStatements: logStatements));
  }
}
