import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:guidini_app/ChatPage.dart';
import 'package:guidini_app/WelcomePage.dart';
import 'package:guidini_app/MapPage.dart';



class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Center(child: Text('User Profile', style: TextStyle(color: Colors.white))),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: UserProfile(),
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
                icon: Icon(Icons.chat),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),

    );
  }
}

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final ImagePicker _picker = ImagePicker();
  String _avatarImagePath =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Man_Silhouette.png/220px-Man_Silhouette.png';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://media.istockphoto.com/id/889535070/vector/blur-gradient-sky-background.jpg?s=612x612&w=0&k=20&c=72ar3C7XKBjp7lLxdwiKNwFRmMslvm2e3G0MBvwGCsk='),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Ink(
                      decoration: ShapeDecoration(
                        color: Colors.transparent,
                        shape: CircleBorder(),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.settings, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // User Circle
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(_avatarImagePath),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 8,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            border: Border.all(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -3,
                        right: -3,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          padding: EdgeInsets.all(3.0),
                          child: Center(
                            child: IconButton(
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                                size: 12,
                              ),
                              onPressed: () async {
                                // Open image picker when the camera icon is clicked
                                final XFile? pickedImage =
                                await _picker.pickImage(source: ImageSource.gallery);
                                if (pickedImage != null) {
                                  // Handle the selected image
                                  _updateAvatar(pickedImage.path);
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Alex',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  'Global Adventurer',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '100   ',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    Text(
                      'followers',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                    Container(
                      height: 20,
                      width: 1,
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                    ),
                    Text(
                      '102   ',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    Text(
                      'following',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Adding the recently visited places title
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Places Recently Visited',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Adding the recent places cards
          _buildRecentPlacesCard(
            'Amphitheatre of El Jem',
            'This impressive Roman amphitheatre is one of the largest in the world and is a UNESCO World Heritage Site',
            'https://media.routard.com/image/04/8/pt13857.1226048.w430.jpg',
          ),
          _buildRecentPlacesCard(
            'The Okba Ibn Nafaâ Mosque',
            'This one of the oldest and most significant mosques in North Africa, bearing witness to Islamic history and architecture.',
            'https://cdn2.webmanagercenter.com/wmc/wp-content/uploads/2023/08/okbaibnnaffa-kairouan.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildRecentPlacesCard(String placeName, String description, String imageUrl) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    placeName,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateAvatar(String imagePath) {
    setState(() {
      _avatarImagePath = imagePath;
    });
  }
}