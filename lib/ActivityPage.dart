import 'package:flutter/material.dart';
import 'package:guidini_app/MapPage.dart';
import 'package:guidini_app/WelcomePage.dart';

class Activity {
  final String imagePath;
  final String title;
  final double rating;
  final String description;

  Activity({
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.description,
  });
}

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  List<Activity> activities = [
    Activity(
      imagePath: "images/kayak.jpg",
      title: 'Sunset Kayak & Tour Immersif',
      rating: 4.5,
      description: "Exploration en kayak le long des côtes pittoresques de Bizerte.",
    ),
    Activity(
      imagePath: "images/bateau.jpg",
      title: 'Excursion Bateau Pirate',
      rating: 4.2,
      description: "Explorez les eaux de Sousse avec l'excursion en bateau pirate.",
    ),
    Activity(
      imagePath: "images/parachute.jpeg",
      title: 'Parachute Ascensionnel',
      rating: 4.8,
      description: "Adrénaline et vue panoramique à Djerba : Parachute Ascensionnel inoubliable.",
    ),
    Activity(
      imagePath: "images/jet_ski.jpeg",
      title: 'Jet Ski',
      rating: 4.3,
      description: "Explorez les eaux cristallines de Djerba avec l'excitation et la vitesse du jet ski.",
    ),
    // Add more activities
  ];

  List<Activity> filteredActivities = [];

  @override
  void initState() {
    super.initState();
    // Initialize filteredActivities with all activities
    filteredActivities = activities;
  }

  void _filterActivities(String query) {
    setState(() {
      filteredActivities = activities
          .where((activity) =>
      activity.title.toLowerCase().contains(query.toLowerCase()) ||
          activity.description.toLowerCase().contains(query.toLowerCase()))
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
            'Activity To Do!',
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
                                color: Colors.grey.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: TextField(
                                textAlign: TextAlign.center,
                                onChanged: (query) {
                                  _filterActivities(query);
                                },
                                decoration: InputDecoration(
                                  hintText: 'Search your activity here',
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
                      itemCount: filteredActivities.length,
                      itemBuilder: (context, index) {
                        return buildListItem(
                          filteredActivities[index].imagePath,
                          filteredActivities[index].title,
                          filteredActivities[index].rating,
                          filteredActivities[index].description,
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
                onPressed: () {
                  // Handle onPressed for the third icon
                },
              ),
              IconButton(
                icon: Icon(Icons.accessibility),
                onPressed: () {
                  // Handle onPressed for the fourth icon
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
                        color: rating >= 2.0 ? Color.fromARGB(255, 236, 213, 0) : Colors.grey,
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
