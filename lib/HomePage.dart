import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guidini_app/LoginPage.dart'; // Import your login page file

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            color: Colors.red.shade50,
            child: Image.asset(
              "images/img0.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: height * 0.32,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "DISCOVER & ENJOY",
                    style: GoogleFonts.lexend(
                      fontSize: width * 0.048,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue[900],
                    ),
                  ),
                  Text(
                    "Wherever you want to go",
                    style: GoogleFonts.lexend(
                      fontSize: width * 0.028,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: height * 0.02,),
                  InkWell(
                    onTap: () {
                      // Navigate to the login page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(), // Replace LoginPage with your actual login page
                        ),
                      );
                    },
                    child: Container(
                      height: height * 0.065,
                      width: width * 0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue[900],
                      ),
                      child: Center(
                        child: Text(
                          "Start",
                          style: GoogleFonts.lexend(
                            color: Colors.white,
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
