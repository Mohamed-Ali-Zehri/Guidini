import 'package:flutter/material.dart';
import 'package:guidini_app/WelcomePage.dart';
import 'package:guidini_app/MapPage.dart';
import 'package:guidini_app/ChatPage.dart';



class Restaurant {
  final String imagePath;
  final String title;
  final double rating;
  final String phoneNumber;
  final String openingHours;
  final String closingHours;

  Restaurant({
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.phoneNumber,
    required this.openingHours,
    required this.closingHours,
  });
}

class RestaurantPage extends StatefulWidget {
  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  List<Restaurant> restaurants = [
    Restaurant(
      imagePath: 'images/jeld.jpg',
      title: 'Dar El Jeld Restaurant',
      rating: 4.5,
      phoneNumber: '+216 71 234 567',
      openingHours: '11:00 AM',
      closingHours: '10:00 PM',
    ),
    Restaurant(
      imagePath: 'images/mdina.jpg',
      title: 'La medina',
      rating: 4.5,
      phoneNumber: '+216 98 765 432',
      openingHours: '10:30 AM AM',
      closingHours: '09:30 PM',
    ),
    Restaurant(
      imagePath: 'images/fal.jpg',
      title: 'La Falaise',
      rating: 4.8,
      phoneNumber: '+216 50 987 654',
      openingHours: '12:00 AM',
      closingHours: '11:00 PM',
    ),
    Restaurant(
      imagePath:'images/cont.jpg',
      title:'Dar Belhaj',
      rating: 4.3,
      phoneNumber:'+216 71 111 222',
      openingHours: '08:00 AM',
      closingHours: '09:00 PM',
    ),
    // Add more activities
  ];
  List<Restaurant> filteredRestaurants = [];

  @override
  void initState() {
    super.initState();
    // Initialize filteredActivities with all activities
    filteredRestaurants = restaurants;
  }

  void _filterRestaurants(String query) {
    setState(() {
      filteredRestaurants = restaurants
          .where((restaurant) =>
      restaurant.title.toLowerCase().contains(query.toLowerCase()) ||
          restaurant.phoneNumber.toLowerCase().contains(query.toLowerCase()))
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
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(15.0),
                            ),

                            child: TextField(
                              textAlign: TextAlign.left,
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
                      itemCount: filteredRestaurants.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigate to the detail page for the selected monument
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RestaurantDetailPage(
                                  restaurant: filteredRestaurants[index],
                                ),
                              ),
                            );
                          },
                          child: buildListItem(
                            filteredRestaurants[index].imagePath,
                            filteredRestaurants[index].title,
                            filteredRestaurants[index].rating,
                            filteredRestaurants[index].phoneNumber,
                            filteredRestaurants[index].openingHours,
                            filteredRestaurants[index].closingHours,
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
class RestaurantDetailPage extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantDetailPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              restaurant.imagePath,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              restaurant.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: restaurant.rating >= 1.0 ? Color.fromARGB(255, 236, 213, 0) : Colors.grey,
                ),
                Icon(
                  Icons.star,
                  color: restaurant.rating >= 2.0 ? Color.fromARGB(255, 236, 213, 0): Colors.grey,
                ),
                Icon(
                  Icons.star,
                  color: restaurant.rating >= 3.0 ? Color.fromARGB(255, 236, 213, 0) : Colors.grey,
                ),
                Icon(
                  Icons.star,
                  color: restaurant.rating >= 4.0 ? Color.fromARGB(255, 236, 213, 0) : Colors.grey,
                ),

                SizedBox(width: 4),
              ],
            ),
            SizedBox(height: 8),
            Text(
              restaurant.phoneNumber,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              restaurant.openingHours,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              restaurant.closingHours,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
