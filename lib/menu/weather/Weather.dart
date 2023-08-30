import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding; // Alias for the geocoding package
import 'package:iot_with_me/menu/weather/client.dart';
import 'package:iot_with_me/menu/weather/model.dart';
import 'package:location/location.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherModel? weather;
  LocationData? userLocation;
  String locationName = '';

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
    _getUserLocation();
  }

  Future<void> _fetchWeatherData() async {
    weather = await WeatherApiClient().request();
    setState(() {});
  }

  Future<void> _getUserLocation() async {
    Location location = Location(); // Instantiate the Location class
    try {
      userLocation = await location.getLocation();
      await _getLocationName(); // Await the _getLocationName function
      setState(() {});
    } catch (e) {
      print("Error getting user location: $e");
    }
  }

  Future<void> _getLocationName() async {
    if (userLocation != null) {
      List<geocoding.Placemark> placemarks = await geocoding.placemarkFromCoordinates( // Use the alias
        userLocation!.latitude!,
        userLocation!.longitude!,
      );
      if (placemarks.isNotEmpty) {
        locationName = placemarks[0].name ?? '';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Suhu saat ini",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Icon(
              Icons.wb_sunny_rounded,
              size: 100,
              color: Colors.yellow,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${weather?.currentWeather["temperature"] != null ? weather!.currentWeather["temperature"] : 0}°C",
              style: TextStyle(fontSize: 24),
            ),
            if (userLocation != null)
              Text(
                "anda berada di $locationName",
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}

