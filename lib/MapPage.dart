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
    target: LatLng(36.8065, 10.1815),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Map App')),
        body: Column(
          children: [
            _searchBar(),
            Expanded(
              child: GoogleMap(
                mapType: _currentMapType,
                markers: _markers,
                initialCameraPosition: _initialCameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _toggleMapType,
          tooltip: 'Toggle Map Type',
          child: Icon(Icons.layers),
        ),
        bottomNavigationBar: _buildBottomAppBar(context),
      ),
    );
  }

  Widget _searchBar() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _searchController,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(hintText: 'Search by City'),
            onFieldSubmitted: (value) => _onSearchSubmitted(value),
          ),
        ),
        IconButton(
          onPressed: () => _onSearchSubmitted(_searchController.text),
          icon: Icon(Icons.search),
        ),
      ],
    );
  }

  Future<void> _onSearchSubmitted(String value) async {
    try {
      var placeDetails = await LocationServices().getPlace(value);
      if (placeDetails.isNotEmpty) {
        _updateMapLocation(placeDetails);
      } else {
        print("No results found or there was an error");
      }
    } catch (e) {
      print('Error fetching place data: $e');
    }
  }

  void _updateMapLocation(Map<String, dynamic> placeDetails) {
    final double lat = placeDetails['geometry']['location']['lat'];
    final double lng = placeDetails['geometry']['location']['lng'];
    final LatLng newLocation = LatLng(lat, lng);

    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId(newLocation.toString()),
          position: newLocation,
          infoWindow: InfoWindow(
            title: placeDetails['name'],
            snippet: placeDetails['formatted_address'],
          ),
        ),
      );

      _controller.future.then((controller) => controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: newLocation, zoom: 15),
        ),
      ));
    });
  }

  void _toggleMapType() {
    setState(() {
      _currentMapType =
      _currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
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
      'YOUR_GOOGLE_MAPS_API_KEY'; // Replace with your actual API key

  // Utility method for API call
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
