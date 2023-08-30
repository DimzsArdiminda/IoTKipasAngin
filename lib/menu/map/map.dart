import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapWithTime extends StatefulWidget {
  @override
  _MapWithTimeState createState() => _MapWithTimeState();
}

class _MapWithTimeState extends State<MapWithTime> {
  LocationData? userLocation;
  GoogleMapController? mapController; // Menggunakan tipe nullable GoogleMapController

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    final location = Location();
    try {
      userLocation = await location.getLocation();
      setState(() {});
    } catch (e) {
      print("Error getting user location: $e");
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    // Lakukan tindakan yang melibatkan peta setelah peta selesai dibuat
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          if (userLocation != null)
            Container(
              height: 200,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(userLocation!.latitude ?? 0, userLocation!.longitude ?? 0),
                  zoom: 14.0,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Column(
              children: <Widget>[
                Text(
                  "Current Time",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "${DateTime.now().hour}:${DateTime.now().minute}",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                if (userLocation != null)
                  Text(
                    "Location: ${userLocation!.latitude}, ${userLocation!.longitude}",
                    style: TextStyle(fontSize: 18),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

