import 'package:flutter/material.dart';
import 'package:guidini_app/LoginPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double inputWidth = 200.0;
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image(
                image: AssetImage('images/logo.png'),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Discover Enjoy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                fontFamily: 'YourSpecialFont',
                color: HSLColor.fromAHSL(1, 218, 0.75, 0.31).toColor(),
                shadows: [
                  Shadow(
                    color: HSLColor.fromAHSL(1, 218, 0.75, 0.31)
                        .toColor()
                        .withOpacity(0.4),
                    offset: Offset(2, 4),
                  )
                ],
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Wherever you want to go',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}