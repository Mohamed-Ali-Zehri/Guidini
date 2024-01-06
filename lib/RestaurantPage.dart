import 'package:flutter/material.dart';
import 'package:guidini_app/WelcomePage.dart';
import 'package:guidini_app/MapPage.dart';
import 'package:guidini_app/ChatPage.dart';



class Restaurant {
  final String imagePath;
  final String title;
  final String description;
  final double rating;
  final String phoneNumber;
  final String openingHours;
  final String closingHours;

  Restaurant({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.rating,
    required this.phoneNumber,
    required this.openingHours,
    required this.closingHours,
  });
}

class RestaurantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Taste Explorer!',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  children: [

                  FractionallySizedBox(
                  widthFactor: 0.9, // Set the width to 80% of the screen width
                  alignment: Alignment.center,
                  child:Row(
                      children: [
                        Expanded(
                          child: Container(

                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15.0),
                            ),

                            child: TextField(
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(

                                hintText: '      Search your destination here',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () {
                              // Perform search logic
                            },
                            icon: Icon(Icons.search),
                            iconSize: 30,
                            color: Colors.blue[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                    SizedBox(height: 30,),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        buildListItem(
                          'images/jeld.jpg',
                          'Dar El Jeld Restaurant',

                          4.5,
                          '+216 71 234 567',
                          '11:00 AM',
                          '10:00 PM',
                        ),
                        buildListItem(
                          'images/mdina.jpg',
                          'La medina',

                          4.2,
                          '+216 98 765 432',
                          '10:30 AM',
                          '09:30 PM',
                        ),
                        buildListItem(
                          'images/fal.jpg',
                          'La Falaise',

                          4.8,
                          '+216 50 987 654',
                          '12:00 PM',
                          '11:00 PM',
                        ),
                        buildListItem(
                          'images/cont.jpg',
                          'Dar Belhaj',

                          4.3,
                          '+216 71 111 222',
                          '08:00 AM',
                          '09:00 PM',
                        ),
                        buildListItem(
                          'images/jcc.jpg',
                          'Le boudoir Sousse',

                          4.6,
                          '+216 23 441 252',
                          '09:00 AM',
                          '10:00 PM',
                        ),
                        buildListItem(
                          'images/ast.jpg',
                          "L'Astragale",

                          4.3,
                          '+216 71 785 080',
                          '10:30 AM',
                          '09:00 PM',
                        ),
                        buildListItem(
                          'images/alo.jpg',
                          'El Ali',

                          4.1,
                          '+216 72 236 842',
                          '08:30 AM',
                          '10:00 PM',)

                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomePage()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.map),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapPage()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.maps_ugc_outlined),
                onPressed: () {

                },
              ),
              IconButton(
                icon: Icon(Icons.accessibility),
                onPressed: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListItem(String imagePath, String title, double rating, String phoneNumber, String openingHours, String closingHours) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Phone: $phoneNumber'),
                  Text('Opening Hours: $openingHours - Closing Hours: $closingHours'),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: rating >= 1.0 ? Color.fromARGB(255, 236, 213, 0) : Colors.grey,
                      ),
                      Icon(
                        Icons.star,
                        color: rating >= 2.0 ? Color.fromARGB(255, 236, 213, 0): Colors.grey,
                      ),
                      Icon(
                        Icons.star,
                        color: rating >= 3.0 ? Color.fromARGB(255, 236, 213, 0) : Colors.grey,
                      ),
                      Icon(
                        Icons.star,
                        color: rating >= 4.0 ? Color.fromARGB(255, 236, 213, 0) : Colors.grey,
                      ),
                      Icon(
                        Icons.star,
                        color: rating >= 5.0 ? Color.fromARGB(255, 236, 213, 0) : Colors.grey,
                      ),
                      SizedBox(width: 4),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}