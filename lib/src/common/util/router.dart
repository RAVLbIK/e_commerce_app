import 'package:e_commerce_app/src/feature/widget/auth/registration.dart';
import 'package:e_commerce_app/src/feature/widget/auth/sign_in.dart';
import 'package:e_commerce_app/src/feature/widget/greetings/prelogin_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignInScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignInScreen(),
      );
    case PreloginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PreloginScreen(),
      );
    case RegisterScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RegisterScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
