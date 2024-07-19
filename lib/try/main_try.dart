import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fo_fe/main_init.dart' as di;
import 'package:fo_fe/try/app_main_try.dart';

import '../functions/simple_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const AppMainTry());
}
//   case "android":
//     {
//       database = await ObjectBox.create();
//       await Firebase.initializeApp(
//           options: DefaultFirebaseOptions.currentPlatform);
//       runApp(AppMainOld(FirebaseUserRepository()));
//     }
//     break;
//   case "windows":
//     {
//       database = await ObjectBox.create();
//       runApp(AppMainOld(LocalUserRepository()));
//     }
//     break;
//   case "linux":
//     {
//       database = await ObjectBox.create();
//       runApp(AppMainOld(LocalUserRepository()));
//     }
//     break;
//   default: // web
//     {
//       database = await ObjectBox.create();
//       await Firebase.initializeApp(
//           options: DefaultFirebaseOptions.currentPlatform);
//       runApp(AppMainOld(FirebaseUserRepository()));
//     }
//     break;
// }

// if (Platform.isAndroid) {
//   objectbox = await ObjectBox.create();
//   await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform);
//
//   runApp(AppMain(FirebaseUserRepository()));
// } else if (Platform.isWindows) {
//   objectbox = await ObjectBox.create();
//   runApp(AppMain(LocalUserRepository()));
// } else if (Platform.isLinux) {
//   objectbox = await ObjectBox.create();
//   runApp(AppMain(LocalUserRepository()));
// } else {
//   // web
//   objectbox = await ObjectBox.create();
//   await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform);
//   runApp(AppMain(FirebaseUserRepository()));
// }

// todo
// objectbox.store.close();
// }
