import 'package:flutter/material.dart';
import 'package:fo_fe/home_page.dart';
import 'package:fo_fe/screens/home_page_screen.dart';
import 'package:fo_fe/screens/login_email_password_screen.dart';
import 'package:fo_fe/screens/login_screen.dart';
import 'package:fo_fe/screens/other_for_test.dart';
import 'package:fo_fe/screens/phone_screen.dart';
import 'package:fo_fe/screens/signup_email_password_screen.dart';
import 'package:fo_fe/widgets/custom_navigatio_bar.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;
  final _homeIcon = Icons.home;

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back to the previous page when the button is pressed
              Navigator.pop(context);
            },
          ),
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
        body: HomePage(
          themeMode: _themeMode,
        ),
        bottomNavigationBar: Padding(
            padding: MediaQuery.of(context)
                .viewInsets, // Adjust the padding as needed
            child: CustomNavigationBar(
              items: [
                CustomNavigationBarItem(
                  icon: Icons.edit,
                  label: 'Edit',
                ),
                CustomNavigationBarItem(
                  icon: Icons.settings,
                  label: 'Settings',
                ),
                CustomNavigationBarItem(
                  icon: Icons.link,
                  label: 'Link',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                  // print(_selectedIndex);
                });
              },
            )),
      ),
      // initialRoute: '/', // Specify the initial route
      routes: {
        // '/': (context) => const HomePageScreen(), // Define the initial route
        '/home': (context) => const HomePageScreen(), // Define the login route
        // LoginScreen.routeName: (context) => const LoginScreen(),
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
  // var navigationBar =
}
