import 'package:flutter/material.dart';
import 'package:unsij_places/domain/place.dart';
import 'package:unsij_places/widgets/places_list.dart';
import 'package:unsij_places/screens/add_place_screen.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 188, 108, 37),
        title: Text("Lugares", style: TextStyle(fontSize: 30)),
        actions: [
          IconButton.outlined(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => AddPlaceScreen()));
            },
            icon: Icon(Icons.add_a_photo_rounded),
          ),
        ],
      ),
      body: PlacesList(
        places: [
          Place(name: "Laboratorio Redes"),
          Place(name: "Cafetería"),
          Place(name: "Biblioteca"),
        ],
      ),
    );
  }
}
