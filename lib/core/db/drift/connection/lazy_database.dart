// lib/lazy_database.dart

import 'package:drift/drift.dart';

import 'db_connection.dart';

LazyDatabase createLazyDatabase({
  required String dbName,
  bool logStatements = false,
  bool inMemory = false,
  bool isDev = false,
}) {
  return LazyDatabase(() async {
    return connect(
      dbName: dbName,
      logStatements: logStatements,
      inMemory: inMemory,
      isDev: isDev,
    );
  });
}
