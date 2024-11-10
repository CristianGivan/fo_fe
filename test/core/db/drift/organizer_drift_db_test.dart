import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

void main() {
  // Ensure that the Flutter bindings are initialized
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Database Schema Test', () {
    late OrganizerDriftDB db;

    // Initialize the in-memory database before each test
    setUp(() {
      // db = OrganizerDriftDB(inMemory: true);
      db = OrganizerDriftDB(isDev: true);
    });

    // Close the database after each test
    tearDown(() async {
      await db.close();
    });

    test('Check all tables are created', () async {
      // Query the sqlite_master table to get a list of all created tables
      final result = await db
          .customSelect(
            'SELECT name FROM sqlite_master WHERE type = "table"',
          )
          .get();

      // Extract table names from the result
      final createdTables = result.map((row) => row.read<String>('name')).toSet();

      // Define the expected tables
      final expectedTables = {
        'organizer_item_table_drift',
        'sqlite_sequence',
        'task_table_drift',
        'task_tag_link_table_drift',
        'task_reminder_link_table_drift',
        'task_user_link_table_drift',
        'user_table_drift',
        'user_user_table_drift',
        'reminder_table_drift',
      };

      // Verify that all expected tables exist in the database
      expect(createdTables, containsAll(expectedTables));
    });

    test('Get database location in debug mode', () async {
      // Get the application documents directory
      final directory = await getApplicationDocumentsDirectory();

      // Construct the database path
      final dbPath = p.join(directory.path, 'organizer_drift_db.sqlite');

      // Print the database path for debugging purposes
      print('Database location: $dbPath');

      // You can also perform additional checks or assertions if needed
      expect(dbPath, isNotNull);
    });
  });
}
