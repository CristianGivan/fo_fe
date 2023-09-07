import 'package:flutter/material.dart';
import 'package:fo_fe/screens/login_email_password_screen.dart';
import 'package:fo_fe/screens/login_screen.dart';
import 'package:fo_fe/screens/phone_screen.dart';
import 'package:fo_fe/screens/signup_email_password_screen.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.blueGrey,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 18, color: Colors.white70),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.blueGrey,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey)
      .copyWith(brightness: Brightness.dark),
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // todo is this neede to have routes define here? or go back how it wos at the begining I see the benner

    return MaterialApp(
      initialRoute: '/', // Specify the initial route
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => MyHomePage(), // Define the initial route
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
  final _loginIcon = Icons.login;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Log in Page'),
          actions: [
            IconButton(
              icon: Icon(_loginIcon),
              onPressed: _toggleThemeMode,
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
