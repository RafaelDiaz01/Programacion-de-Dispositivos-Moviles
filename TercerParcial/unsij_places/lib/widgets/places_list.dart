import 'package:flutter/material.dart';
import 'package:unsij_places/domain/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Color.fromARGB(255, 255, 255, 255),
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    Text(
                      'Todavía no se han agregado lugares',
                      style: TextStyle(
                        fontSize: 30,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    Icon(
                      Icons.photo_size_select_actual_rounded,
                      size: 30,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text("Agregar Lugar"),
              icon: Icon(Icons.add_box_rounded),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemBuilder:
          (context, index) => ListTile(title: Text(places[index].name), hoverColor: Colors.amber,),
      itemCount: places.length,
    );
  }
}
