import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool isConfirmPasswordValid = true;

  Future signUp() async {

     Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );

    // Use _emailController and _passwordController for Firebase authentication
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());

    }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  }
bool passwordConfirmed() {
  if (_passwordController.text.trim() == _confirmPasswordController.text.trim()) {
    return true;
  } else {
    return false;
  }
}

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = screenWidth * 0.8;
    double buttonWidth = inputWidth * 0.8;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[350],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: inputWidth,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                  child: Text(
                    'SIGN UP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: HSLColor.fromAHSL(1, 218, 0.75, 0.31).toColor(),
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
                    decoration: InputDecoration(
                      hintText: 'Name',
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
                    decoration: InputDecoration(
                      hintText: 'Surname',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: signUp,
                  child: Container(
                    width: inputWidth,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Address',
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: inputWidth,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Choose Password',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: inputWidth,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: buttonWidth,
                  child: ElevatedButton(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: HSLColor.fromAHSL(1, 218, 0.75, 0.31).toColor(),
                      ),
                    ),
                    onPressed: signUp,
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
