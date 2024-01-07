import 'package:flutter/material.dart';
import 'package:guidini_app/WelcomePage.dart';
import 'package:guidini_app/ChatPage.dart';
import 'package:guidini_app/MapPage.dart';

class User {
  String userName;
  String profilePicture;

  User({
    required this.userName,
    required this.profilePicture,
  });
}

class Site {
  String name;
  String image;
  String description;
  bool isLiked;

  Site({
    required this.name,
    required this.image,
    required this.description,
    this.isLiked = false,
  });
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User user = User(
    userName: 'John Doe',
    profilePicture: 'assets/jhon.jpg', // Replace with the path to the actual image
  );

  final List<Site> favoriteSites = [
    Site(
      name: 'Tourist Spot 1',
      image: 'assets/sbs.jpg', // Replace with the path to the actual image
      description: 'A wonderful tourist spot with amazing views.',
    ),
    Site(
      name: 'Tourist Spot 2',
      image: 'assets/jam.jpg', // Replace with the path to the actual image
      description: 'Explore the beauty of this historical site.',
    ),
    // Add more sites as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox.shrink(), // Remove the title from the top left
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.edit, size: 30.0, color: Colors.black),
                onPressed: () {
                  // Navigate to the edit page for username, email, and password
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditEmailPasswordPage(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to the page for changing the profile picture
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeProfilePicturePage(),
                  ),
                );
              },
              child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(user.profilePicture),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(Icons.camera_alt),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            // Display favorite sites
            for (var site in favoriteSites) buildFavoriteSiteCard(site),
          ],
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
                  MaterialPageRoute(builder: (context) => ChatPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.accessibility),
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
    );
  }

  Widget buildFavoriteSiteCard(Site site) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 5.0,
        child: ListTile(
          leading: Image.asset(
            site.image,
            width: 70.0,
            height: 70.0,
            fit: BoxFit.cover,
          ),
          title: Text(site.name),
          subtitle: Text(site.description),
          trailing: GestureDetector(
            onTap: () {
              setState(() {
                // Toggle the liked status
                site.isLiked = !site.isLiked;
              });
            },
            child: Icon(
              site.isLiked ? Icons.favorite : Icons.favorite_border,
              color: site.isLiked ? Colors.red : null,
            ),
          ),
        ),
      ),
    );
  }
}

class EditEmailPasswordPage extends StatefulWidget {
  @override
  _EditEmailPasswordPageState createState() => _EditEmailPasswordPageState();
}

class _EditEmailPasswordPageState extends State<EditEmailPasswordPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Username, Email, and Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'New Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'New Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Add functionality to save username, email, and password
                print('Username: ${usernameController.text}');
                print('Email: ${emailController.text}');
                print('Password: ${passwordController.text}');
                // You can add logic here to save the new username, email, and password
                Navigator.pop(context); // Close the edit page after saving
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class ChangeProfilePicturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Profile Picture'),
      ),
      body: Center(
        child: Text('This is where you can change your profile picture.'),
      ),
    );
  }
}