import 'dart:io';

import 'package:path_provider/path_provider.dart';

// String getClassPath(Type type) {
//   var uri = reflectClass(type).owner!.uri;
//   return uri.toFilePath();
// }

String getProjectPath() {
  String currentDirectory = "";
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    String currentDirectory = Directory.current.path;
    print('Current directory: $currentDirectory');
  } else if (Platform.isAndroid || Platform.isIOS) {
    // Use path_provider or Flutter-specific APIs for platform-specific paths
  }
  return currentDirectory;
}

Future<String> getExcelExportPath() async {
  final fileName = 'Organizer';

  final suffixName = formatSuffixOfYYMMDD_HHMMSS();

  final directory = await getApplicationDocumentsDirectory();
  return '${directory.path}/${fileName}_${suffixName}.xlsx';
}

String formatSuffixOfYYMMDD_HHMMSS() {
  DateTime dateTime = DateTime.now();
  final year = dateTime.year % 100; // Get last two digits of the year
  final month = dateTime.month.toString().padLeft(2, '0'); // Ensure two digits
  final day = dateTime.day.toString().padLeft(2, '0'); // Ensure two digits
  final hour = dateTime.hour.toString().padLeft(2, '0'); // Ensure two digits
  final minute = dateTime.minute.toString().padLeft(2, '0'); // Ensure two digits
  final second = dateTime.second.toString().padLeft(2, '0'); // Ensure two digits
  final millisecond =
      (dateTime.millisecond / 10).floor().toString().padLeft(2, '0'); // Ensure two digits

  return '$year$month${day}_$hour$minute$second$millisecond';
}
