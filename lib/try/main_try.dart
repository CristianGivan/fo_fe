import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';
import 'package:fo_fe/main_init.dart' as di;
import 'package:fo_fe/try/app_main_try.dart';

import '../functions/simple_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  Bloc.observer = SimpleBlocObserver();
  // testSignUp();
  runApp(const AppMainTry());
}

void testSignUp() async {
  // Create an instance of SignUpUseCase
  final signUpUseCase = sl<SignUpUseCase>();

  // Define the parameters for the sign-up process
  final signUpParams = SignUpParams(
    name: 'Test3@example.com',
    email: 'Test3@example.com',
    password: 'Test3@example.com',
  );

  // Call the use case
  final result = await signUpUseCase(signUpParams);

  // Print the result
  result.fold(
    (failure) => print('Sign Up Failed: $failure'),
    (authEntity) => print('Sign Up Successful: $authEntity'),
  );
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
