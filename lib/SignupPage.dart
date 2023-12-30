import 'package:flutter/material.dart';
import 'package:guidini_app/LoginPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isConfirmPasswordValid = true;

  void signUp() {
    String name = nameController.text;
    String surname = surnameController.text;
    String address = addressController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (name.isNotEmpty && surname.isNotEmpty && address.isNotEmpty && password.isNotEmpty && password == confirmPassword) {
      // Perform sign-up logic

      // Navigate to home page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      // Show error message alert
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please ensure all fields are filled correctly.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
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
                    controller: nameController,
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
                    controller: surnameController,
                    decoration: InputDecoration(
                      hintText: 'Surname',
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
                    controller: addressController,
                    decoration: InputDecoration(
                      hintText: 'Address',
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
                    controller: passwordController,
                    obscureText: true,
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
                    controller: confirmPasswordController,
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