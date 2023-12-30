import 'package:flutter/material.dart';
import 'WelcomePage.dart';
import 'LoginPage.dart';
import 'SignupPage.dart';
import 'HomePage.dart';
import 'ForgetPWD.dart';
import 'RestaurantPage.dart';
import 'MapPage.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/home': (context) => WelcomePage(),
        '/login/forget': (context) => ForgotPasswordPage(),
        '/signup': (context) => SignUpPage(),
        '/' : (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/map': (context) => MapPage(),
        '/Restaurant': (context) => RestaurantPage(),





      },
    );
  }
}

void main() {
  runApp(MyApp());
}
