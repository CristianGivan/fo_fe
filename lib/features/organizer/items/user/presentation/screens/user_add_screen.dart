import 'package:fo_fe/features/organizer/items/user/presentation/widgets/user_add_button_widget.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserAddScreen extends StatefulWidget {
  const UserAddScreen({super.key});

  @override
  _UserAddScreenState createState() => _UserAddScreenState();
}

class _UserAddScreenState extends State<UserAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add User')),
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
                  _buildNameField(),
                  const SizedBox(height: 10),
                  _buildEmailField(),
                  const SizedBox(height: 20),
                  _buildAddButton(),
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
      context.pop();
      _showSnackBar(context, 'User added successfully!');
    } else if (state is UserErrorBlocState) {
      _showSnackBar(context, state.message);
    }
  }

  void _userValidationBlocListener(BuildContext context, UserValidationBlocState state) {
    bool wasEmailValid = false;
    bool wasNameValid = false;

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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _buildNameField() {
    return NameFieldWidget(controller: nameController);
  }

  Widget _buildEmailField() {
    return EmailFieldWidget(controller: emailController);
  }

  Widget _buildAddButton() {
    bool isEnabled = true;

    return BlocBuilder<UserValidationBloc, UserValidationBlocState>(
      buildWhen: (previous, current) => current is FormValidationBlocState,
      builder: (context, state) {
        return UserAddButtonWidget(
          isEnabled: true,
          formKey: _formKey,
          nameController: nameController,
          emailController: emailController,
        );
      },
    );
  }
}
