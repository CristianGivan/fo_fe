import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool _wasEmailValid = false;
  bool _wasNameValid = false;
  bool _wasPasswordValid = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void _userBlocListener(BuildContext context, UserBlocState state) {
    if (state is UserSuccessBlocState) {
      // Navigate to the organizer route on successful sign-up using GoRouter
      GoRouter.of(context).go(OrganizerRouterNames.organizerRouteName);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign up successful!')),
      );
    } else if (state is UserErrorBlocState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  }

  void _userValidationBlocListener(BuildContext context, UserValidationBlocState state) {
    if (state is EmailValidationBlocState) {
      if (_wasEmailValid && !state.isValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email format')),
        );
      }
      _wasEmailValid = state.isValid;
    } else if (state is NameValidationBlocState) {
      if (_wasNameValid && !state.isValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid name')),
        );
      }
      _wasNameValid = state.isValid;
    } else if (state is PasswordValidationBlocState) {
      if (_wasPasswordValid && !state.isValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid password')),
        );
      }
      _wasPasswordValid = state.isValid;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserBlocState>(
            listener: _userBlocListener,
          ),
          BlocListener<UserValidationBloc, UserValidationBlocState>(
            listener: _userValidationBlocListener,
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  NameFieldWidget(
                    controller: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  const SizedBox(height: 10),
                  EmailFieldWidget(
                    controller: emailController,
                    nameController: nameController,
                    passwordController: passwordController,
                  ),
                  const SizedBox(height: 10),
                  PasswordFieldWidget(
                    controller: passwordController,
                    emailController: emailController,
                    nameController: nameController,
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<UserValidationBloc, UserValidationBlocState>(
                    buildWhen: (previous, current) => current is PasswordValidationBlocState,
                    builder: (context, state) {
                      if (state is PasswordValidationBlocState) {
                        return PasswordRequirements(state: state);
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  SignUpButtonWidget(
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
