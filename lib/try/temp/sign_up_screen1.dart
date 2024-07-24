import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';
import 'package:get_it/get_it.dart';

class SignUpScreen1 extends StatefulWidget {
  @override
  _SignUpScreen1State createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: BlocProvider(
        create: (_) => AuthenticationBlocSignUp(
          signUpUseCase: GetIt.instance<SignUpUseCase>(),
        ),
        child: BlocListener<AuthenticationBlocSignUp,
            AuthenticationBlocSignUpState>(
          listener: (context, state) {
            if (state is AuthenticationSignUpError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is AuthenticationSignUpSuccess) {
              Navigator.pop(context);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  BlocBuilder<AuthenticationBlocSignUp,
                      AuthenticationBlocSignUpState>(
                    builder: (context, state) {
                      if (state is AuthenticationSignUpLoading) {
                        return CircularProgressIndicator();
                      }
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthenticationBlocSignUp>().add(
                                  SignUpBlocEvent(
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          }
                        },
                        child: Text('Sign Up'),
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
}
