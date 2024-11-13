import 'package:fo_fe/features/authentication/presentation/bloc/authentication_bloc_sign_up/authentication_sign_up.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class SignUpButtonWidget extends StatefulWidget {
  final bool isEnabled;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AddUserActionEnum action;

  const SignUpButtonWidget({
    Key? key,
    required this.isEnabled,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.action,
  }) : super(key: key);

  @override
  _SignUpButtonWidgetState createState() => _SignUpButtonWidgetState();
}

class _SignUpButtonWidgetState extends State<SignUpButtonWidget> {
  @override
  void initState() {
    super.initState();
    // Emit ValidateFormBlocEvent to check if all fields are valid
    context.read<UserValidationBloc>().add(ValidateFormBlocEvent(
          email: widget.emailController.text,
          password: widget.passwordController.text,
          name: widget.nameController.text,
        ));
  }

  void _validateAndSubmit() {
    // Validate the form fields
    if (widget.formKey.currentState!.validate()) {
      context.read<UserValidationBloc>().add(ValidateFormBlocEvent(
            email: widget.emailController.text,
            password: widget.passwordController.text,
            name: widget.nameController.text,
          ));
// todo -refactor- is not better tu instatiet the user here?
      final userValidationState = context.read<UserValidationBloc>().state;
      if (userValidationState is FormValidationBlocState && userValidationState.isFormValid) {
        if (widget.action == AddUserActionEnum.AddUser) {
          context.read<UserBloc>().add(
                AddUserBlocEvent(
                  UserEntity(
                    name: widget.nameController.text,
                    email: widget.emailController.text,
                    password: widget.passwordController.text,
                  ),
                ),
              );
        } else if (widget.action == AddUserActionEnum.SignUp) {
          context.read<AuthenticationSignUp>().add(
                AuthSignUpBlocEvent(
                  name: widget.nameController.text,
                  email: widget.emailController.text,
                  password: widget.passwordController.text,
                ),
              );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: TextButton(
        onPressed: widget.isEnabled ? _validateAndSubmit : null,
        style: TextButton.styleFrom(
          elevation: 3.0,
          backgroundColor: widget.isEnabled ? Theme.of(context).colorScheme.primary : Colors.grey,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        child: const Padding(
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
  }
}
