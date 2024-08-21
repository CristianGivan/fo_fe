// import 'package:flutter/material.dart';
// import 'package:fo_fe/features/authentication/config/authentication_exports.dart';
// import 'package:fo_fe/features/organizer/config/organizer_exports.dart';
// import 'package:go_router/go_router.dart';
//
// class OrganizerPage extends StatelessWidget {
//   const OrganizerPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const SizedBox(height: 10),
//           Center(
//             child: ElevatedButton(
//               onPressed: () =>
//                   context.push(OrganizerRouterNames.organizerTaskRoute),
//               child: const Text('Go to the topics screen'),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Center(
//             child: ElevatedButton(
//               onPressed: () =>
//                   context.push(OrganizerRouterNames.organizerTaskRoute),
//               // context.push(OrganizerRouterNames.organizerTasksRoute),
//               child: const Text('Go to the tasks screen'),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Center(
//             child: ElevatedButton(
//               onPressed: () =>
//                   context.push(OrganizerRouterNames.organizerTaskRoute),
//               child: const Text('Go to the reminder screen'),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Center(
//             child: ElevatedButton(
//               onPressed: () =>
//                   context.push(AuthenticationRouterNames.authenticationRoute),
//               child: const Text('Authentication'),
//             ),
//           ),
//           const Center(
//             child: TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'Enter a search term',
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
