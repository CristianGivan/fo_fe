import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

Future<DatabaseConnection> connectDb(
  String dbName, {
  bool logStatements = false,
}) async {
  String projectDir = Directory.current.path;
  final dbFolderPath = p.join(projectDir, 'lib', 'core', 'db', 'test_db');
  await Directory(dbFolderPath).create(recursive: true);
  final file = File(p.join(dbFolderPath, dbName));
  return DatabaseConnection(NativeDatabase(file, logStatements: logStatements));
}
