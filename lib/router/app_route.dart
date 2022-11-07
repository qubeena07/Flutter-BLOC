import 'package:bloc_practice/presentation/screens/home_screen.dart';
import 'package:bloc_practice/presentation/screens/second_screen.dart';
import 'package:bloc_practice/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(
                  title: "HomeScreen",
                  color: Colors.blueAccent,
                ));
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
                  title: "SecondScreen",
                  color: Colors.redAccent,
                ));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(
                  title: "ThirdScreen",
                  color: Colors.greenAccent,
                ));
        {}
      default:
        return null;
    }
  }
}
