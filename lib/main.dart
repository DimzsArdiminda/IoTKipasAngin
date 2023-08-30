import 'package:flutter/material.dart';
import 'package:iot_with_me/menu/kipas/kipas.dart';
import 'package:iot_with_me/menu/map/map.dart';
import 'package:iot_with_me/menu/weather/Weather.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  runApp(MenuUtama());
}

class MenuUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IoTKipas(),
    );
  }
}

class IoTKipas extends StatefulWidget {
  @override
  _IotKipasPertama createState() => _IotKipasPertama();
}

class _IotKipasPertama extends State<IoTKipas> {
  @override
  Widget build(BuildContext context) {
    
    // POKOK
    return DefaultTabController(
    initialIndex: 1,
    length: 3,
    child: Scaffold(
    appBar: AppBar(
      title: Text("Dimas Ardiminda"),
      backgroundColor: Colors.blueGrey[900],
      bottom: const TabBar(
        tabs:<Widget>[

          // tab 1
          Tab(
            icon: Icon(Icons.ac_unit_sharp),
          ),
          // tab 2
          Tab(
            icon: Icon(Icons.mode_standby_rounded),
          ),
          // tab 3
          Tab(
            icon: Icon(Icons.map_rounded),
          ),
        ]
        ),
      ),
      body:TabBarView(
        children:<Widget>[
            WeatherPage(),
            Kipas(),
            MapWithTime(),
        ]) ,
    ),
    //
    );
  }
}
