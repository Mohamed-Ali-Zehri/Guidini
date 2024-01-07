import 'package:flutter/material.dart';

class HamPage extends StatefulWidget {
  @override
  _HamPageState createState() => _HamPageState();
}

class _HamPageState extends State<HamPage> {
  final String imagePath = 'images/hammemet.jpg'; // Replace with your actual image path
  final String description =
      'Hammamet, a coastal resort town in Tunisia, beckons with its sandy beaches, historic Medina, and vibrant markets. Renowned for its laid-back atmosphere and azure waters, Hammamet offers a delightful blend of cultural richness and seaside tranquility.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
