import 'package:fo_fe/features/authentication/presentation/bloc/auth_log_bloc/auth_log_bloc.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserAddButtonWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserBlocState>(
      listener: (context, state) {
        if (state is UserSuccessBlocState) {
          // Show success message or navigate if needed
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User added successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          context.pop();
        } else if (state is UserErrorBlocState) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${state.errorMessage}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: TextButton(
          onPressed: isEnabled ? () => _performAction(context) : null,
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
      ),
    );
  }

  void _performAction(BuildContext context) {
    final authState = context.read<AuthLogBloc>().state;

    if (authState is AuthAuthenticatedBlocState) {
      final logInUserId = authState.authEntity.userId;

      final user = UserEntity(
        name: nameController.text,
        email: emailController.text,
        password: '',
        userType: UserTypeEnum.Remote,
      );

      context.read<UserBloc>().add(AddUserBlocEvent(user));
      context.read<UserBloc>().add(AddUserToUserBlocEvent(
            userLinkedId: user.id,
            userId: logInUserId,
          ));
    }
  }

  ButtonStyle _buttonStyle(BuildContext context) {
    return TextButton.styleFrom(
      elevation: 3.0,
      backgroundColor: isEnabled ? Theme.of(context).colorScheme.primary : Colors.grey,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
    );
  }
}
