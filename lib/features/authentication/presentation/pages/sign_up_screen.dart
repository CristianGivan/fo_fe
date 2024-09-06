import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';
import 'package:fo_fe/features/organizer/config/organizer_exports.dart';
import 'package:go_router/go_router.dart';

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
  bool obscurePassword = true;
  IconData iconPassword = CupertinoIcons.eye_fill;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body:
          BlocListener<AuthenticationBlocSignUp, AuthenticationBlocSignUpState>(
        listener: (context, state) {
          if (state is AuthenticationSignUpSuccess) {
            // Navigate to the organizer route on successful sign-up using GoRouter
            GoRouter.of(context).go(OrganizerRouterNames.organizerRoute);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Sign up successful!')),
            );
          } else if (state is AuthenticationSignUpError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: nameController,
                    hintText: 'Name',
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    prefixIcon: const Icon(CupertinoIcons.person_fill),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please fill in this field';
                      } else if (val.length > 30) {
                        return 'Name too long';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      context
                          .read<AuthenticationBlocSignUp>()
                          .add(NameChanged(val));
                    },
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<AuthenticationBlocSignUp,
                      AuthenticationBlocSignUpState>(
                    buildWhen: (previous, current) =>
                        current is EmailValidationState,
                    builder: (context, state) {
                      return MyTextField(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(CupertinoIcons.mail_solid),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please fill in this field';
                          }
                          if (state is EmailValidationState && !state.isValid) {
                            return 'Invalid email format';
                          }
                          return null;
                        },
                        onChanged: (val) {
                          context
                              .read<AuthenticationBlocSignUp>()
                              .add(EmailChanged(val));
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: obscurePassword,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(CupertinoIcons.lock_fill),
                    onChanged: (val) {
                      context
                          .read<AuthenticationBlocSignUp>()
                          .add(PasswordChanged(val));
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                          iconPassword = obscurePassword
                              ? CupertinoIcons.eye_fill
                              : CupertinoIcons.eye_slash_fill;
                        });
                      },
                      icon: Icon(iconPassword),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please fill in this field';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<AuthenticationBlocSignUp,
                      AuthenticationBlocSignUpState>(
                    buildWhen: (previous, current) =>
                        current is PasswordValidationState,
                    builder: (context, state) {
                      if (state is PasswordValidationState) {
                        return Column(
                          children: [
                            _buildPasswordRequirement(
                                "1 uppercase", state.containsUpperCase),
                            _buildPasswordRequirement(
                                "1 lowercase", state.containsLowerCase),
                            _buildPasswordRequirement(
                                "1 number", state.containsNumber),
                            _buildPasswordRequirement("1 special character",
                                state.containsSpecialChar),
                            _buildPasswordRequirement(
                                "8 minimum characters", state.contains8Length),
                          ],
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  BlocBuilder<AuthenticationBlocSignUp,
                      AuthenticationBlocSignUpState>(
                    buildWhen: (previous, current) =>
                        current is FormValidationState ||
                        current is AuthenticationSignUpLoading,
                    builder: (context, state) {
                      bool isFormValid =
                          state is FormValidationState && state.isFormValid;
                      bool isLoading = state is AuthenticationSignUpLoading;
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextButton(
                          onPressed: isFormValid && !isLoading
                              ? () {
                                  context.read<AuthenticationBlocSignUp>().add(
                                        SignUpBlocEvent(
                                          name: nameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ),
                                      );
                                }
                              : null,
                          style: TextButton.styleFrom(
                            elevation: 3.0,
                            backgroundColor: isFormValid
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 5),
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
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordRequirement(String requirement, bool isMet) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Icon(
            isMet ? Icons.check_circle : Icons.circle_outlined,
            color: isMet
                ? Colors.green
                : Theme.of(context).colorScheme.onSurface,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            requirement,
            style: TextStyle(
              color: isMet
                  ? Colors.green
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
