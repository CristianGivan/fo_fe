// import 'package:flutter/material.dart';
// import 'package:fo_fe/features/authentication/presentation/screens/authentication.dart';
// import 'package:fo_fe/features/communication/presentation/screens/communication.dart';
// import 'package:fo_fe/features/home/presentation/screens/home_screen.dart';
// import 'package:fo_fe/features/home/presentation/screens/quick_note.dart';
// import 'package:fo_fe/features/home/presentation/screens/quick_note_reminder_task.dart';
// import 'package:fo_fe/features/home/presentation/screens/quick_reminder.dart';
// import 'package:fo_fe/features/home/presentation/screens/quick_task.dart';
// import 'package:fo_fe/features/media/presentation/screens/media.dart';
// import 'package:fo_fe/features/organizer/presentation/screens/organizer.dart';
// import 'package:fo_fe/features/practice/presentation/screens/practice.dart';
//
// class AppRouter {
//   Route onGenerateRoute(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       case '/':
//         return MaterialPageRoute(
//           builder: (_) => const HomePage(
//             title: "Home Screen",
//             colorWidget: Colors.blue,
//           ),
//         );
//       case '/quick_note_reminder_task':
//         return MaterialPageRoute(
//           builder: (_) => const QuickNoteReminderTaskScreen(
//             title: "Quick Note Reminder Task",
//             colorWidget: Colors.green,
//           ),
//         );
//       case '/quick_note':
//         return MaterialPageRoute(
//           builder: (_) => const QuickNote(
//             title: "Quick note",
//             colorWidget: Colors.yellow,
//           ),
//         );
//       case '/quick_reminder':
//         return MaterialPageRoute(
//           builder: (_) => const QuickReminder(
//             title: "Quick reminder",
//             colorWidget: Colors.yellow,
//           ),
//         );
//       case '/quick_task':
//         return MaterialPageRoute(
//           builder: (_) => const QuickTask(
//             title: "Quick task",
//             colorWidget: Colors.yellow,
//           ),
//         );
//       case '/organizer':
//         return MaterialPageRoute(
//           builder: (_) => const Organizer(
//             title: "Organizer",
//             colorWidget: Colors.deepPurple,
//           ),
//         );
//       case '/communication':
//         return MaterialPageRoute(
//           builder: (_) => const Communication(
//             title: "Communication",
//             colorWidget: Colors.deepPurple,
//           ),
//         );
//       case '/media':
//         return MaterialPageRoute(
//           builder: (_) => const Media(
//             title: "Media",
//             colorWidget: Colors.deepPurple,
//           ),
//         );
//       case '/practice':
//         return MaterialPageRoute(
//           builder: (_) => const Practice(
//             title: "Practice",
//             colorWidget: Colors.deepPurple,
//           ),
//         );
//       case '/authentication':
//         return MaterialPageRoute(
//           builder: (_) => const Authentication(
//             title: "Authentication",
//             colorWidget: Colors.deepPurple,
//           ),
//         );
//       default:
//         return MaterialPageRoute(
//           builder: (_) => const HomePage(
//             title: "Home Screen",
//             colorWidget: Colors.red,
//           ),
//         );
//     }
//   }
// }
