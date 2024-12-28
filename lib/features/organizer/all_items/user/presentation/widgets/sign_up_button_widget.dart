import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/auth_log_bloc/auth_log_bloc.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../utils/other/user_validation.dart';

class SignUpButtonWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final UserTypeEnum userType;
  final bool autoSignIn;
  final bool isEnabled;

  const SignUpButtonWidget({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.userType,
    required this.autoSignIn,
    required this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SignUpBloc, SignUpBlocState>(
          listener: (context, state) {
            if (state is SignUpFailedBlocState) {
              SnackBarWidget.showAboveBottomNavBar(context,
                  content: 'Sign up failed: ${state.error}', backgroundColor: Colors.red);
            } else if (state is SignUpSuccessBlocState) {
              SnackBarWidget.showAboveBottomNavBar(context,
                  content: 'Sign up successful, now we will log you in',
                  backgroundColor: Colors.green);
              context.read<AuthLogBloc>().add(AuthLogInBlocEvent(
                  email: state.userEntity.email, password: state.userEntity.password));
            }
          },
        ),
        BlocListener<AuthLogBloc, AuthLogBlocState>(
          listener: (context, state) {
            if (state is AuthLogFailedBlocState) {
              SnackBarWidget.showAboveBottomNavBar(context,
                  content: 'Login failed: ${state.error}', backgroundColor: Colors.red);
            } else if (state is AuthAuthenticatedBlocState) {
              SnackBarWidget.showAboveBottomNavBar(context,
                  content: 'Login successful', backgroundColor: Colors.green);
              context.pushNamed(OrganizerRouterNames.organizerRoutePath);
            }
          },
        ),
      ],
      child: TextButton(
        onPressed: isEnabled ? () => _performAction(context) : null,
        style: _buttonStyle(context),
        child: const Text('Sign Up'),
      ),
    );
  }

  void _performAction(BuildContext context) {
    final user = UserEntity(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      userType: userType,
    );
// todo -refactor- check this even earlier
    List<String> invalidFields = UserValidation.getInvalidFields(user);
    if (invalidFields.isEmpty) {
      context.read<SignUpBloc>().add(SignUpRequestBlocEvent(
            user: user,
            isAutoSignIn: autoSignIn,
          ));
    } else {
      SnackBarWidget.showAboveBottomNavBar(context,
          content: 'Error: ${invalidFields.join(',\n ')}', backgroundColor: Colors.red);
    }
  }

  ButtonStyle _buttonStyle(BuildContext context) {
    return TextButton.styleFrom(
      elevation: 3.0,
      backgroundColor: isEnabled ? Theme.of(context).colorScheme.primary : Colors.grey,
    );
  }
}
