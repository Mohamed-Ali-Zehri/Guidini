import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guidini_app/ForgetPWD.dart';
import 'package:guidini_app/SignupPage.dart';
import 'package:guidini_app/WelcomePage.dart';

class LoginPage extends StatefulWidget {
  @override

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    } catch (e) {
      print('Sign-in failed: $e');
      // Handle sign-in errors here
      // You might want to show an error message to the user
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = screenWidth * 0.76;
    double buttonWidth = inputWidth * 0.76;

    return MaterialApp(

      home: Scaffold(
        backgroundColor: Colors.grey[350],
        body:SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: inputWidth,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Text(
                    'LOGIN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      fontFamily: 'YourSpecialFont',
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: inputWidth,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: inputWidth,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    obscureText: false,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    child: TextButton(
                      child: Text(
                        'Forgot password',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                        );
                        // Handle forgot password logic
                      },
                    ),
                  ),
                ),
                Container(
                  width: buttonWidth,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: signIn,
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              HSLColor.fromAHSL(1, 218, 0.75, 0.31).toColor(),
                              HSLColor.fromAHSL(1, 219, 0.4, 0.52).toColor(),
                            ],
                            stops: [0, 0.5],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  width: buttonWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: HSLColor.fromAHSL(1, 218, 0.75, 0.31).toColor(),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                      // Perform sign-up logic
                    },
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