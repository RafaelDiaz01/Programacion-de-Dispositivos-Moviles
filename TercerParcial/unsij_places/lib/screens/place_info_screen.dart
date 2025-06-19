import 'package:flutter/material.dart';
import 'package:unsij_places/domain/place.dart';

class PlaceInfoScreen extends StatelessWidget {
  const PlaceInfoScreen({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
        backgroundColor: Color.fromARGB(255, 188, 108, 37),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Información del Lugar',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text('Nombre: ${place.name}', style: TextStyle(fontSize: 18)),
              // Aquí puedes agregar más información del lugar si es necesario
            ],
          ),
        ),
      ),
    );
  }
}
