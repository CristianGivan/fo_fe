import 'package:fo_fe/features/authentication/presentation/bloc/auth_sign_bloc/auth_sign_bloc.dart';
import 'package:fo_fe/features/organizer/items/user/utils/other/user_validation.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserAddButtonWidget extends StatefulWidget {
  final bool isEnabled;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;

  const UserAddButtonWidget({
    Key? key,
    required this.isEnabled,
    required this.formKey,
    required this.nameController,
    required this.emailController,
  }) : super(key: key);

  @override
  _UserAddButtonWidgetState createState() => _UserAddButtonWidgetState();
}

class _UserAddButtonWidgetState extends State<UserAddButtonWidget> {
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
            'Add User',
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
    final authState = context.read<AuthSignBloc>().state;

    if (authState is AuthUserIdLoadedBlocState) {
      final logInUserId = authState.userId;

      final user = UserEntity(
        name: widget.nameController.text,
        email: widget.emailController.text,
        password: '',
        userType: UserTypeEnum.Remote,
      );
      context.read<UserBloc>().add(AddUserBlocEvent(user));
      final userState = context.read<UserBloc>().state;
      if (userState is UserSuccessBlocState) {
        context.read<UserBloc>().add(AddUserToUserBlocEvent(
              userLinkedId: user.id,
              userId: logInUserId,
            ));
      }
      context.pop();
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
