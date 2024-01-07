import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:guidini_app/WelcomePage.dart';
import 'package:guidini_app/ChatPage.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchController = TextEditingController();
  Set<Marker> _markers = {};
  MapType _currentMapType = MapType.normal;

  static final CameraPosition _initialCameraPosition = CameraPosition(
    target:LatLng(36.8069, 10.1839),
    zoom: 14.4746,
  );

  static final Marker _googlePlexMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Google Plex'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(36.8065, 10.1815),
  );

  static final CameraPosition _kLake = CameraPosition(
    bearing: 192.83349,
    target: LatLng(36.8069, 10.1839),
    tilt: 59.44071769,
    zoom: 19.151926,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _searchController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(hintText: 'Search by City'),
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              IconButton(
                onPressed: () async {
                  var place = await LocationServices().getPlace(_searchController.text);
                  _goToPlace(place, _searchController.text); // Pass the place object and place name
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                icon: Icon(Icons.layers),
                onPressed: () {
                  _toggleMapType();
                },
              ),
            ],
          ),
          Expanded(
            child: GoogleMap(
              mapType: _currentMapType,
              markers: {
                _googlePlexMarker,
              },
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
      bottomNavigationBar: _buildBottomAppBar(context),
    );

  }
  Map<String, dynamic> MyPlaces = {
    'mahdia': LatLng(35.5037, 11.0569),
    'sousse': LatLng(35.8288, 10.6405),
    'tozeur': LatLng(33.9308, 8.1332),
  };
  Future<void> _goToPlace(Map<String, dynamic> place, String placeName) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(33.9308, 8.1332), // Use the correct place name as the key
          zoom: 12,
        ),
      ),
    );
  }


  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
  void _toggleMapType() {
    setState(() {
      _currentMapType = (_currentMapType == MapType.normal)
          ? MapType.satellite
          : MapType.normal;
    });
  }
  Widget _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(Icons.home, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WelcomePage()),
            );
          }),
          _buildBottomNavItem(Icons.map, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MapPage()),
            );
          }),
          _buildBottomNavItem(Icons.maps_ugc_outlined, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatPage()),
            );
          }),
          _buildBottomNavItem(Icons.accessibility, () {
            // Add your functionality here
          }),
        ],
      ),
    );
  }




  Widget _buildBottomNavItem(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}

class LocationServices {
  final String key =
      'AAIzaSyAOVYRIgupAurZup5y1PRh8Ismb1A3lLao'; // Replace with your actual API key

  Future<dynamic> _getApiResponse(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return convert.jsonDecode(response.body);
      } else {
        print('Server error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }

  Future<String> getPlaceId(String input) async {
    final String encodedInput = Uri.encodeComponent(input);
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$encodedInput&inputtype=textquery&key=$key';

    var json = await _getApiResponse(url);
    if (json != null) {
      var placeId = json['candidates'][0]['place_id'] as String;
      print(placeId);
      return placeId;
    } else {
      return 'Error';
    }
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    if (placeId == 'Error') {
      return {};
    }

    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';

    var json = await _getApiResponse(url);
    if (json != null) {
      var results = json['result'] as Map<String, dynamic>;
      print(results);
      return results;
    } else {
      return {};
    }
  }
}

