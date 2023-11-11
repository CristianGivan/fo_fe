import 'package:flutter/material.dart';
import 'package:fo_fe/features/home/presentation/screens/home_screen.dart';
import 'package:fo_fe/features/feature1/presentation/screens/second_screen.dart';
import 'package:fo_fe/features/feature1/presentation/screens/third_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomePage(
            title: "Home Screen",
            colorWidget: Colors.blue,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
            title: "Second Screen",
            colorWidget: Colors.green,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
            title: "Third Screen",
            colorWidget: Colors.yellow,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(
            title: "Home Screen",
            colorWidget: Colors.red,
          ),
        );
    }
  }
}
