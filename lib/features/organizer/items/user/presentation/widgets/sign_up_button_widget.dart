import 'package:fo_fe/features/authentication/presentation/bloc/auth_log_bloc/auth_log_bloc.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

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
    return BlocListener<SignUpBloc, SignUpBlocState>(
      listener: (context, state) {
        if (state is SignUpFailedBlocState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is SignUpSuccessBlocState) {
          context.read<AuthLogBloc>().add(AuthLogInBlocEvent(
              email: state.userEntity.email, password: state.userEntity.password));
          context.pushNamed(OrganizerRouterNames.organizerRoutePath);
        }
      },
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
    context.read<SignUpBloc>().add(SignUpRequestBlocEvent(
          user: user,
          isAutoSignIn: autoSignIn,
        ));
  }

  ButtonStyle _buttonStyle(BuildContext context) {
    return TextButton.styleFrom(
      elevation: 3.0,
      backgroundColor: isEnabled ? Theme.of(context).colorScheme.primary : Colors.grey,
    );
  }
}
