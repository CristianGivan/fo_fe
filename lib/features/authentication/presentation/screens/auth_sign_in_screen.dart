import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<AuthLogBloc, AuthLogBlocState>(
                builder: (context, state) {
                  if (state is AuthLogLoadingBlocState) {
                    return const CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthLogBloc>().add(
                              AuthLogInBlocEvent(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                      }
                    },
                    child: const Text('Sign In'),
                  );
                },
              ),
              BlocListener<AuthLogBloc, AuthLogBlocState>(
                listener: (context, state) {
                  if (state is AuthLogErrorBlocState) {
                    SnackBarWidget.showAtBottom(
                      context,
                      content: state.errorMessage,
                      backgroundColor: Colors.red,
                    );
                  } else if (state is AuthAuthenticatedBlocState) {
                    context.pushNamed(OrganizerRouterNames.organizerRouteName);
                  }
                },
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
