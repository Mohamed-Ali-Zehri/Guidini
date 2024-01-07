import 'package:flutter/material.dart';


class RestaurantDetailsPage extends StatelessWidget {
  final String restaurantName = "El Ali";
  final String openingHours = "7:30 AM - 3:00 PM";
  final String phoneNumber = "+216 55 559 357";
  final String address = "45 Bis Jemaa Zitouna Street, La Medina, Tunis 1006, Tunisia.";
  final String cuisine = "Cuisine Raffinée et recherchée dans le patrimoine culinaire tunisien. Plats authentiques, revisités et inventés par le Chef Taieb Bouhadra originaire de la Médina de Tunis, présentant dans sa carte les mets tunisois.";
  final String features = "Fruits de mer et poisson, Européenne, Tunisienne, Arabe " ;
  final double rating = 4.7;
  final String description =
      "Végétariens bienvenus, Choix végétaliens, Halal";

  final List<String> categories = ["Entrées", "Plats principaux", "Desserts"];
  final List<Map<String, dynamic>> dishes = [
    {"name": "Couscous", "image": "couscous.jpg", "price": "15 DT"},
    {"name": "Brik", "image": "brik.jpg", "price": "5 DT"},
    // Ajoutez d'autres plats de la même manière
  ];

  // New list of images
  final List<String> additionalImages = [
    "1.jpg",
    "2.jpg",
    "3.jpg","5.jpg","6.jpg","7.jpg","8.jpg",
    "vue.jpg",
    "salle.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('restau.jpg'),
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
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(17),
                topRight: Radius.circular(17),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        restaurantName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xFF1847A2),
                            size: 21,
                          ),
                          Text(
                            ' $rating',
                            style: TextStyle(
                              color: Color(0xFF1847A2),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Color(0xFF383838), size: 17),
                      SizedBox(width: 7),
                      Text(
                        address,
                        style: TextStyle(fontSize: 13, color: Color(0xFF383838)),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.watch_later, color: Color(0xFF383838), size: 14),
                      SizedBox(width: 8),
                      Text(
                        "Opening Hours:",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF383838),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        openingHours,
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF383838),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 13),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Color(0xFF383838), size: 15),
                      SizedBox(width: 6),
                      Text(
                        phoneNumber,
                        style: TextStyle(fontSize: 13, color: Color(0xFF383838)),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  Divider(
                    color: Colors.grey[300],
                    height: 1,
                  ),
                  SizedBox(height: 7),
                  Text(
                    cuisine,
                    style: TextStyle(fontSize: 13, color: Color(0xFF383838)),
                  ),
                  SizedBox(height: 4),
                  Text(
                    features,
                    style: TextStyle(fontSize: 13, color: Color(0xFF383838)),
                  ),
                  SizedBox(height: 14),
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
          ),
        ],
      ),
    );
  }
}
