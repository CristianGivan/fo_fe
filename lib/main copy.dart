import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'package:fo_fe/screens/login_email_password_screen.dart';
import 'package:fo_fe/screens/login_screen.dart';
import 'package:fo_fe/screens/phone_screen.dart';
import 'package:fo_fe/screens/signup_email_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // todo is this neede to have routes define here? or go back how it wos at the begining I see the benner

    return MaterialApp(
      initialRoute: '/', // Specify the initial route
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MyHomePage(), // Define the initial route
        '/home': (context) => const MyHomePage(), // Define the login route
        // LoginScreen.routeName: (context) => const LoginScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeMode _themeMode = ThemeMode.dark;
  final _homeIcon = Icons.home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Log in Page'),
          actions: [
            IconButton(
              icon: Icon(_homeIcon),
              onPressed: () {
                // Navigate to the login page when the button is pressed
                Navigator.pushNamed(context, '/home');
              },
            ),
            IconButton(
              icon: Icon(_themeModeIcon),
              onPressed: _toggleThemeMode,
            ),
          ],
        ),
        body: Center(
          child: LogIn(
            themeMode: _themeMode,
            themeModeIcon: _themeModeIcon,
          ),
        ),
      ),
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
      },
    );
  }

  IconData get _themeModeIcon {
    switch (_themeMode) {
      case ThemeMode.light:
        return Icons.brightness_low;
      case ThemeMode.dark:
        return Icons.brightness_3;
      case ThemeMode.system:
      default:
        return Icons.brightness_auto;
    }
  }

  void _toggleThemeMode() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : _themeMode == ThemeMode.system
              ? ThemeMode.light
              : ThemeMode.system;
    });
  }
}

class LogIn extends StatelessWidget {
  final ThemeMode themeMode;
  final IconData themeModeIcon;

  const LogIn({required this.themeMode, required this.themeModeIcon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        EmailPasswordSignup.routeName: (context) => const EmailPasswordSignup(),
        EmailPasswordLogin.routeName: (context) => const EmailPasswordLogin(),
        PhoneScreen.routeName: (context) => const PhoneScreen(),
      },
    );
  }
}
