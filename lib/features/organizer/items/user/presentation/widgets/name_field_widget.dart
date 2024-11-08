import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class NameFieldwidget extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const NameFieldwidget({
    Key? key,
    required this.controller,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: controller,
      hintText: 'Name',
      obscureText: false,
      keyboardType: TextInputType.name,
      prefixIcon: const Icon(CupertinoIcons.person_fill),
      validator: (val) {
        if (val!.isEmpty) {
          return 'Please fill in this field';
        } else if (val.length > 30) {
          return 'Name too long';
        }
        return null;
      },
      onChanged: (val) {
        context.read<UserValidationBloc>().add(ValidateNameBlocEvent(val));
      },
    );
  }
}
