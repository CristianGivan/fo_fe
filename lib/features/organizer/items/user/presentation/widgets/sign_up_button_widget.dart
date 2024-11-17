import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/other/user_validation.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class SignUpButtonWidget extends StatefulWidget {
  final bool isEnabled;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AddUserActionEnum action;
  final UserTypeEnum userType;
  final bool autoSignIn;

  const SignUpButtonWidget({
    Key? key,
    required this.isEnabled,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.action,
    required this.userType,
    required this.autoSignIn,
  }) : super(key: key);

  @override
  _SignUpButtonWidgetState createState() => _SignUpButtonWidgetState();
}

class _SignUpButtonWidgetState extends State<SignUpButtonWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: TextButton(
        onPressed: widget.isEnabled ? _validateAndSubmit : null,
        style: _buttonStyle(context),
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

  void _validateAndSubmit() {
    List<String> errorMessages = [];

    if (!UserValidation.isNameValid(widget.nameController.text)) {
      errorMessages.add('Invalid name');
    }
    if (!UserValidation.isEmailValid(widget.emailController.text)) {
      errorMessages.add('Invalid email');
    }
    if (!UserValidation.isPasswordValid(widget.passwordController.text)) {
      errorMessages.add('Invalid password');
    }

    if (errorMessages.isEmpty) {
      _performAction();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessages.join('\n')),
        ),
      );
    }
  }

  void _performAction() {
    final user = UserEntity(
      name: widget.nameController.text,
      email: widget.emailController.text,
      password: widget.passwordController.text,
      userType: widget.userType,
    );
    switch (widget.action) {
      case AddUserActionEnum.AddUser:
        context.read<UserBloc>().add(AddUserBlocEvent(user));
        context.pop();
        break;
      case AddUserActionEnum.SignUp:
        context.read<AuthSignBloc>().add(AuthSignUpBlocEvent(
              user: user,
              isAutoSignIn: widget.autoSignIn,
            ));
        context.pushNamed(OrganizerRouterNames.organizerRoutePath);
        break;
    }
  }

  ButtonStyle _buttonStyle(BuildContext context) {
    return TextButton.styleFrom(
      elevation: 3.0,
      backgroundColor: widget.isEnabled ? Theme.of(context).colorScheme.primary : Colors.grey,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
    );
  }
}
