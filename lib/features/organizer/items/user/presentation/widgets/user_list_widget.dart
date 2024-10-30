// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fo_fe/features/organizer/items/user/presentation/widgets/user_item_widget.dart';
// import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
//
// class UserListWidget extends StatelessWidget {
//   final int userId;
//
//   const UserListWidget({super.key, required this.userId});
//
//   @override
//   Widget build(BuildContext context) {
//     // Dispatch the event to fetch users linked to userId
//     context.read<UserBlocUser>().add(GetUserItemsByUserIdBlocEvent(userId: userId));
//
//     return BlocBuilder<UserBlocUser, UserBlocState>(
//       builder: (context, state) {
//         if (state is UserLoadingBlocState) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is UserItemsLoadedBlocIState) {
//           final users = state.users;
//
//           return ListView.builder(
//             itemCount: users.size(),
//             itemBuilder: (context, index) {
//               final user = users.getAt(index);
//               return UserItemWidget(userName: user.name, email: user.email);
//             },
//           );
//         } else if (state is UserErrorBlocState) {
//           return const Center(child: Text('Failed to load users'));
//         }
//         return Container(); // Fallback if state is not recognized
//       },
//     );
//   }
// }
