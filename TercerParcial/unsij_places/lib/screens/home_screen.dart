import 'package:flutter/material.dart';
import 'package:unsij_places/widgets/places_list.dart';
import 'package:unsij_places/screens/add_place_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unsij_places/providers/place_provider.dart';

class MyHomeScreen extends ConsumerWidget {
  const MyHomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(placesProvider);
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
      body: PlacesList(places: places),
    );
  }
}
