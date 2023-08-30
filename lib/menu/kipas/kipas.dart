import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Kipas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homekipas(),
    );
  }
}


class Homekipas extends StatefulWidget {
  @override
  _mengkipas createState() => _mengkipas();
}
class _mengkipas extends State<Homekipas> {
  bool isFanOn = true; // Untuk melacak status kipas (hidup/mati)

  // Fungsi untuk mengubah status kipas
  void toggleFan() {
    setState(() {
      isFanOn = !isFanOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Status Kipas"),
            Text(
              isFanOn ? 'Kipas Nyala' : 'Kipas Mati',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: toggleFan,
              child: Text(isFanOn ? 'Matikan Kipas' : 'Hidupkan Kipas'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black) 
                ),
                primary: isFanOn? Colors.green : Colors.red,
                onPrimary: Colors.white
              )
            ),
          ],
        ),
      ),
    );
  }
}
