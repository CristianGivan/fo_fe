import 'dart:io';

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
