import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _nameController = TextEditingController();

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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 188, 108, 37),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  // Aquí se puede agregar la lógica para guardar el lugar
                  Navigator.pop(context);
                },
                child: const Text('Guardar Lugar', style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
