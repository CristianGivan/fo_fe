import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/user/presentation/bloc/user_bloc.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class SignUpButtonWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignUpButtonWidget({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserValidationBloc, UserValidationBlocState>(
      buildWhen: (previous, current) => current is FormValidationBlocState,
      builder: (context, state) {
        bool isFormValid = state is FormValidationBlocState && state.isFormValid;
        return BlocBuilder<UserBloc, UserBlocState>(
          builder: (context, userState) {
            bool isLoading = userState is UserLoadingBlocState;
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextButton(
                onPressed: isFormValid && !isLoading
                    ? () {
                        context.read<UserBloc>().add(
                              AddUserBlocEvent(
                                UserEntity(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              ),
                            );
                      }
                    : null,
                style: TextButton.styleFrom(
                  elevation: 3.0,
                  backgroundColor:
                      isFormValid ? Theme.of(context).colorScheme.primary : Colors.grey,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: Text(
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
              ),
            );
          },
        );
      },
    );
  }
}
