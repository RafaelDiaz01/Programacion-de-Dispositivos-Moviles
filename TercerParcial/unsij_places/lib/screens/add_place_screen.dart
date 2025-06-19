import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unsij_places/providers/place_provider.dart';
import 'package:unsij_places/domain/place.dart';
import 'package:unsij_places/widgets/photo_picker.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _nameController = TextEditingController();

  void _addToPlaces() {
    final enteredName = _nameController.text;
    if (enteredName.isNotEmpty) {
      Place newPlace = Place(name: enteredName);
      ref.read(placesProvider.notifier).addPlace(newPlace);
      Navigator.of(context).pop(); // Cierra la pantalla de agregar lugar
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Nuevo Lugar'),
        backgroundColor: Color.fromARGB(255, 188, 108, 37),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(50)),
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Nombre del Lugar',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    // Aquí se puede agregar la lógica para manejar el cambio de texto
                  },
                  controller: _nameController,
                ),
              ),
              const SizedBox(height: 20),
              PhotoPicker(), // Widget para seleccionar o tomar una foto
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 188, 108, 37),
                  foregroundColor: Colors.white,
                ),
                onPressed: _addToPlaces,
                child: const Text(
                  'Guardar Lugar',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
