import 'package:flutter/material.dart';
import'package:guidini_app/MapPage.dart';
import 'package:guidini_app/WelcomePage.dart';


class Monument {
  final String imagePath;
  final String title;
  final double rating;
  final String description;

  Monument({
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.description,

  });
}

class MonumentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Historical Monument!',
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
                                color: Colors.grey.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(15.0),
                              ),

                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(

                                  hintText: 'Search your destination here',
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
                              color: Colors.grey,
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
                          "images/img1.jpeg",
                          'Amphitheatre of El Jem',

                          4.5,
                          "This impressive Roman amphitheatre is one of the largest in the world and is a UNESCO World Heritage Site",

                        ),
                        buildListItem(
                          "images/img2.jpeg",
                          'The Okba Ibn Nafaâ Mosque',

                          4.2,
                          "This one of the oldest and most significant mosques in North Africa.",
                        ),
                        buildListItem(
                          "images/img3.jpeg",
                          'Dougga, Tunisie',

                          4.8,
                          "Dougga offers a fascinating glimpse into ancient Roman architecture and civilization",

                        ),
                        buildListItem(
                          "images/img6.jpg",
                          'Carthage',

                          4.3,
                          "Carthage, Tunisia: Key archaeological site, featuring Phoenician and Roman ruins.",
                        ),
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

  Widget buildListItem(String imagePath, String title, double rating, String description) {
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
                  Text(
                    description,
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
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
