import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class EmailFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController nameController;
  final TextEditingController passwordController;

  const EmailFieldWidget({
    Key? key,
    required this.controller,
    required this.nameController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserValidationBloc, UserValidationBlocState>(
      buildWhen: (previous, current) => current is EmailValidationBlocState,
      builder: (context, state) {
        return MyTextField(
          controller: controller,
          hintText: 'Email',
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(CupertinoIcons.mail_solid),
          //tobe define
          validator: (val) {
            if (state is EmailValidationBlocState && !state.isValid) {
              return 'Invalid email format';
            }
            return null;
          },
        );
      },
    );
  }
}
