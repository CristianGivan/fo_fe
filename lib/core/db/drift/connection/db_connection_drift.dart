import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift/wasm.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/wasm.dart';

LazyDatabase connect({
  required String dbName,
  bool logStatements = false,
  bool inMemory = false,
  bool isDev = false,
}) {
  return LazyDatabase(() async {
    if (isDev) {
      // Development connection logic
      String projectDir = Directory.current.path;
      final dbFolderPath = p.join(projectDir, 'lib', 'core', 'db', 'test_db');
      await Directory(dbFolderPath).create(recursive: true);
      final file = File(p.join(dbFolderPath, dbName));
      return NativeDatabase.createInBackground(
        file,
        logStatements: logStatements,
      );
    } else {
      // Production connection logic
      if (Platform.isAndroid ||
          Platform.isIOS ||
          Platform.isWindows ||
          Platform.isMacOS ||
          Platform.isLinux) {
        if (inMemory) {
          return NativeDatabase.memory(logStatements: logStatements);
        } else {
          final dbFolder = await getApplicationDocumentsDirectory();
          final file = File(p.join(dbFolder.path, dbName));
          return NativeDatabase.createInBackground(
            file,
            logStatements: logStatements,
          );
        }
      } else if (kIsWeb) {
        final response = await http.get(Uri.parse('sqlite3.wasm'));
        final fs = await IndexedDbFileSystem.open(dbName: '/db/');
        final sqlite3 = await WasmSqlite3.load(response.bodyBytes);
        final path = '/drift/db/$dbName';
        return WasmDatabase(
          sqlite3: sqlite3,
          path: path,
          fileSystem: fs,
          logStatements: logStatements,
        );
      } else {
        throw UnsupportedError('Unsupported platform');
      }
    }
  });
}
