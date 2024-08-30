import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:sqlite3/wasm.dart';

Future<DatabaseConnection> connect(
  String dbName, {
  bool logStatements = false,
  bool inMemory = false,
  bool isDev = false, // New parameter for development mode
}) async {
  final response = await http.get(Uri.parse('sqlite3.wasm'));
  final fs = await IndexedDbFileSystem.open(dbName: '/db/');
  final sqlite3 = await WasmSqlite3.load(response.bodyBytes);

  if (inMemory) {
    return DatabaseConnection(
        WasmDatabase.inMemory(sqlite3, logStatements: logStatements));
  } else {
    // Determine path based on isDev flag
    final basePath = isDev
        ? p.join('lib', 'core', 'db', 'test_db') // For development
        : '/drift/db'; // For production
    final path = p.join(basePath, dbName);

    return DatabaseConnection(WasmDatabase(
        sqlite3: sqlite3,
        path: path,
        fileSystem: fs,
        logStatements: logStatements));
  }
}
