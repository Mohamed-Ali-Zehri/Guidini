import 'package:flutter/material.dart';
import 'package:guidini_app/LoginPage.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double inputWidth = MediaQuery.of(context).size.width * 0.8;
    double buttonWidth = inputWidth * 0.8;

    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Column(
        children: <Widget>[
          SizedBox(height: screenHeight * 0.25),
          Container(
            alignment: Alignment.topCenter,
            width: inputWidth,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'RESET PASSWORD',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: HSLColor.fromAHSL(1, 218, 0.75, 0.31).toColor(),
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'YourSpecialFont',
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.1),
          Container(
            width: inputWidth,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
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
              decoration: InputDecoration(
                hintText: 'New Password',
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: buttonWidth,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage()),);
                },
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        HSLColor.fromAHSL(1, 218, 0.75, 0.31).toColor(),
                        HSLColor.fromAHSL(1, 219, 0.4, 0.52).toColor(),
                      ],
                      stops: [0, 0.7],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    alignment: Alignment.center,
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white.withOpacity(1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: buttonWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ElevatedButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: HSLColor.fromAHSL(1, 218, 0.75, 0.31).toColor(),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage()),);
              },
            ),
          ),
        ],
      ),
    );
  }
}