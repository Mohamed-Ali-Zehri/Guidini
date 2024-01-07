import 'package:flutter/material.dart';

class ActivityDetailsPage extends StatelessWidget {

  final String activityTitle = "Le Sud Tunisien entre Oasis et Montagne";
  final String duration = "3 jours";
  final String price = "À partir de 550,00€ par adulte";
  final String age = "Âges : 0-80";
  final String schedule = "Horaire de début : vérifier la disponibilité";
  final String guide = "Guide en direct : arabe, Anglais, Français";
  final String description =
      "Découvrez le désert tunisien en 3 jours, passant par Kairouan, Tozeur, les oasis de montagne Chbika et Tamaghza, Chott el-Jerid, Douz, Matmata, et l'amphithéâtre romain d'El Jem. Bienvenue au Sahara !";

  // New list of images
  final List<String> additionalImages = [

    "2.jpg",
    "3.jpg",
    "4.jpg",
    "5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('1.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: IconButton(
                      icon: Icon(Icons.favorite_border, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activityTitle,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 14),
                    Text(
                      description,
                      style: TextStyle(fontSize: 13, color: Color(0xFF383838)),
                    ),
                    SizedBox(height: 7),
                    Text(
                      price,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),

                    SizedBox(height: 15),
                    Divider(
                      color: Colors.grey[300],
                      height: 1,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'À propos',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),

                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.person, size: 20),
                        SizedBox(width: 6),
                        Text(age),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.timer, size: 20),
                        SizedBox(width: 6),
                        Text(duration),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.schedule, size: 20),
                        SizedBox(width: 6),
                        Text(schedule),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.language, size: 20),
                        SizedBox(width: 6),
                        Text(guide),
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(
                      color: Colors.grey[300],
                      height: 1,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'More pictures',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: additionalImages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 8),
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(additionalImages[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
