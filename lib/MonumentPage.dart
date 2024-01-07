import 'package:flutter/material.dart';
import 'package:guidini_app/MapPage.dart';
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

class MonumentPage extends StatefulWidget {
  @override
  _MonumentPageState createState() => _MonumentPageState();
}

class _MonumentPageState extends State<MonumentPage> {
  List<Monument> monuments = [
    Monument(
      imagePath: "images/img1.jpeg",
      title: 'Amphitheatre of El Jem',
      rating: 4.5,
      description: "This impressive Roman amphitheatre is one of the largest in the world and is a UNESCO World Heritage Site",
    ),
    Monument(
      imagePath: "images/img2.jpeg",
      title: 'The Okba Ibn Nafaâ Mosque',
      rating: 4.2,
      description: "This one of the oldest and most significant mosques in North Africa.",
    ),
    Monument(
      imagePath: "images/img3.jpeg",
      title: 'Dougga, Tunisie',
      rating: 4.8,
      description: "Dougga offers a fascinating glimpse into ancient Roman architecture and civilization",
    ),
    Monument(
      imagePath: "images/img6.jpg",
      title: 'Carthage',
      rating: 4.3,
      description: "Carthage, Tunisia: Key archaeological site, featuring Phoenician and Roman ruins.",
    ),
    // Add more monuments
  ];

  List<Monument> filteredMonuments = [];

  @override
  void initState() {
    super.initState();
    // Initialize filteredMonuments with all monuments
    filteredMonuments = monuments;
  }

  void _filterMonuments(String query) {
    setState(() {
      filteredMonuments = monuments
          .where((monument) =>
      monument.title.toLowerCase().contains(query.toLowerCase()) ||
          monument.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

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
                      widthFactor: 0.9,
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: TextField(
                                textAlign: TextAlign.left,
                                onChanged: (query) {
                                  _filterMonuments(query);
                                },
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
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: filteredMonuments.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigate to the detail page for the selected monument
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MonumentDetailPage(
                                  monument: filteredMonuments[index],
                                ),
                              ),
                            );
                          },
                          child: buildListItem(
                            filteredMonuments[index].imagePath,
                            filteredMonuments[index].title,
                            filteredMonuments[index].rating,
                            filteredMonuments[index].description,
                          ),
                        );
                      },
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
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.accessibility),
                onPressed: () {},
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

class MonumentDetailPage extends StatelessWidget {
  final Monument monument;

  MonumentDetailPage({required this.monument});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(monument.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              monument.imagePath,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              monument.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: monument.rating >= 1.0 ? Color.fromARGB(255, 236, 213, 0) : Colors.grey,
                ),
                Icon(
                  Icons.star,
                  color: monument.rating >= 2.0 ? Color.fromARGB(255, 236, 213, 0): Colors.grey,
                ),
                Icon(
                  Icons.star,
                  color: monument.rating >= 3.0 ? Color.fromARGB(255, 236, 213, 0) : Colors.grey,
                ),
                Icon(
                  Icons.star,
                  color: monument.rating >= 4.0 ? Color.fromARGB(255, 236, 213, 0) : Colors.grey,
                ),
                Icon(
                  Icons.star,
                  color: monument.rating >= 5.0 ? Color.fromARGB(255, 236, 213, 0) : Colors.grey,
                ),
                SizedBox(width: 4),
              ],
            ),
            SizedBox(height: 8),
            Text(
              monument.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
