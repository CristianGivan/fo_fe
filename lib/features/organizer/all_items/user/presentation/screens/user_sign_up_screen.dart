import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserSignUpScreen extends StatefulWidget {
  const UserSignUpScreen({super.key});

  @override
  _UserSignUpScreenState createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  UserTypeEnum _selectedUserType = UserTypeEnum.Temporary;
  bool _isAutoSignIn = false;
  bool wasEmailValid = false;
  bool wasNameValid = false;
  bool wasPasswordValid = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserBlocState>(listener: _userBlocListener),
          BlocListener<UserValidationBloc, UserValidationBlocState>(
              listener: _userValidationBlocListener),
        ],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildUserTypeDropdown(),
                  const SizedBox(height: 10),
                  _buildNameField(),
                  const SizedBox(height: 10),
                  _buildEmailField(),
                  const SizedBox(height: 10),
                  _buildPasswordField(),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  _buildAutoSignInCheckbox(),
                  _buildPasswordRequirements(),
                  const SizedBox(height: 20),
                  _buildSignUpButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _userBlocListener(BuildContext context, UserBlocState state) {
    if (state is UserSuccessBlocState) {
      GoRouter.of(context).go(OrganizerRouterNames.organizerRouteName);
      _showSnackBar(context, 'Sign up successful!');
    } else if (state is UserErrorBlocState) {
      _showSnackBar(context, state.errorMessage);
    }
  }

  void _userValidationBlocListener(BuildContext context, UserValidationBlocState state) {
    if (state is EmailValidationBlocState) {
      _handleValidationFeedback(
        context,
        wasValid: wasEmailValid,
        isValid: state.isValid,
        message: 'Invalid email format',
      );
      wasEmailValid = state.isValid;
    } else if (state is NameValidationBlocState) {
      _handleValidationFeedback(
        context,
        wasValid: wasNameValid,
        isValid: state.isValid,
        message: 'Invalid name',
      );
      wasNameValid = state.isValid;
    } else if (state is PasswordValidationBlocState) {
      _handleValidationFeedback(
        context,
        wasValid: wasPasswordValid,
        isValid: state.isValid,
        message: 'Invalid password',
      );
      wasPasswordValid = state.isValid;
    }
  }

  void _handleValidationFeedback(
    BuildContext context, {
    required bool wasValid,
    required bool isValid,
    required String message,
  }) {
    if (wasValid && !isValid) {
      _showSnackBar(context, message);
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    SnackBarWidget.showAboveBottomNavBar(context, content: message);
  }

  Widget _buildUserTypeDropdown() {
    return UserTypeDropdown(
      selectedUserType: _selectedUserType,
      onChanged: (UserTypeEnum? newValue) {
        setState(() {
          _selectedUserType = newValue!;
        });
      },
    );
  }

  Widget _buildNameField() {
    return NameFieldWidget(controller: nameController);
  }

  Widget _buildEmailField() {
    return EmailFieldWidget(controller: emailController);
  }

  Widget _buildPasswordField() {
    return PasswordFieldWidget(controller: passwordController);
  }

  Widget _buildSignUpButton() {
    bool isEnabled = true;

    return BlocBuilder<UserValidationBloc, UserValidationBlocState>(
      buildWhen: (previous, current) => current is FormValidationBlocState,
      builder: (context, state) {
        return SignUpButtonWidget(
          isEnabled: true,
          nameController: nameController,
          emailController: emailController,
          passwordController: passwordController,
          userType: _selectedUserType,
          autoSignIn: _isAutoSignIn,
        );
      },
    );
  }

  Widget _buildPasswordRequirements() {
    return BlocBuilder<UserValidationBloc, UserValidationBlocState>(
      buildWhen: (previous, current) => current is PasswordValidationBlocState,
      builder: (context, state) {
        if (state is PasswordValidationBlocState) {
          return PasswordRequirements(state: state);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildAutoSignInCheckbox() {
    return CheckboxListTile(
      title: const Text('Auto Sign In'),
      value: _isAutoSignIn,
      onChanged: (bool? value) {
        setState(() {
          _isAutoSignIn = value ?? false;
        });
      },
    );
  }
}
