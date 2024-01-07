import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:guidini_app/Auth.dart';

import 'ForgetPWD.dart';
import 'HomePage.dart';
import 'LoginPage.dart';
import 'MapPage.dart';
import 'RestaurantPage.dart';
import 'SignupPage.dart';
import 'WelcomePage.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/auth': (context) => Auth(),
        '/welcome': (context) => WelcomePage(),
        '/login/forget': (context) => ForgotPasswordPage(),
        '/signup': (context) => SignUpPage(),
        '/login/pagehome/map': (context) => MapPage(),
        '/login/home/Restaurant': (context) => RestaurantPage(),
      },
      home:  HomePage(), // Set the initial home page
    );
  }
}


Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}