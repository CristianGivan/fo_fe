import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: kToolbarHeight),
                TabBar(
                  controller: tabController,
                  unselectedLabelColor: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5),
                  labelColor: Theme.of(context).colorScheme.onBackground,
                  tabs: const [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      BlocProvider(
                        create: (context) => AuthenticationBlocSession(
                          autoLoginUseCase: context.read<AutoLoginUseCase>(),
                          getLoggedInUserIdUseCase:
                              context.read<GetLoggedInUserIdUseCase>(),
                          switchUserUseCase: context.read<SwitchUserUseCase>(),
                        ),
                        child: BlocProvider(
                          create: (context) => AuthenticationBlocToken(
                            logoutUseCase: context.read<LogoutUseCase>(),
                            refreshTokenUseCase:
                                context.read<RefreshTokenUseCase>(),
                          ),
                          child: const SignInScreen(),
                        ),
                      ),
                      BlocProvider(
                        create: (context) => AuthenticationBlocSignUp(
                          signUpUseCase: context.read<SignUpUseCase>(),
                        ),
                        child: const SignUpScreen(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
