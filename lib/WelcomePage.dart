import 'package:flutter/material.dart';
import 'package:guidini_app/MapPage.dart';
import 'package:guidini_app/RestaurantPage.dart';
import 'package:guidini_app/ChatPage.dart';
import 'package:guidini_app/MonumentPage.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}


class _WelcomePageState extends State<WelcomePage> {
  final double spacingFactor = 0.05; // Adjust this value to set the spacing
  late PageController _pageController;
  int _currentPage = 0;
  List<String> _imageList = [
    'images/ain_draham_winter.jpeg',
    'images/barrdo.jpeg',
    'images/djerba_summer.jpeg',
    'images/el jem.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    Future.delayed(Duration(seconds: 1)).then((_) {
      if (_currentPage < _imageList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      _startAutoScroll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home :Scaffold(
          body: SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text(
              'Welcome To Guidini',
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'inter',
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search your destination here',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Container(
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
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Search By Category',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: 2.0,
                    width: 40.0,
                    color: Colors.blue[900],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {

                    // Handle onPressed for first icon (Icons.nature)
                    // Add your custom logic here
                  },
                  child: _buildCircularIcon(Icons.nature),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Monument()),
                    );
                  },
                  child: _buildCircularIcon(Icons.local_activity_outlined),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RestaurantPage()),
                    );
                  },
                  child: _buildCircularIcon(Icons.food_bank),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Most Visited',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: 2.0,
                    width: 40.0,
                    color: Colors.blue[900],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 120.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                itemCount: _imageList.length,
                itemBuilder: (context, index) {
                  return _buildImageCard(_imageList[index]);
                },
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seasonal Suggestion',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: 2.0,
                    width: 40.0,
                    color: Colors.blue[900],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageCard('images/hamamet.jpg'),
                _buildImageCard('images/sidi-boussaid.jpeg'),
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageCard('images/cha9.jpg'),
                _buildImageCard('images/douga_spring.jpeg'),
              ],
            ),
            SizedBox(height: 30,
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildImageCard('images/sweater.jpg'),
            _buildImageCard('images/borguiba.jpg'),
          ],
        ),
            SizedBox(height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageCard('images/ba9a.jpg'),
                _buildImageCard('images/tgtg.jpg'),
              ],
            ),
      ],
    ),
      ),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage(),),);
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

  Widget _buildCircularIcon(IconData iconData) {

    return Container(
    width: 70.0,
    height: 70.0,
    decoration: BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 4,
    offset: Offset(0, 2),
    ),
    ],
    ),
    child: Icon(
    iconData,
    size: 50.0,
    color: Colors.blue[900],
    ),
    );
  }

  Widget _buildImageCard(String imageName) {
    return Container(
      width: 150.0,
      height: 140.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage('$imageName'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.0),
          ),
        ],
      ),


    );
  }
}