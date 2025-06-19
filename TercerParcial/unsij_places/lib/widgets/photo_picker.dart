import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart'; // Importa el paquete image_picker para tomar fotos.

class PhotoPicker extends StatefulWidget {
  const PhotoPicker({super.key});

  @override
  State<PhotoPicker> createState() => _PhotoPickerState();
}

class _PhotoPickerState extends State<PhotoPicker> {
  File? _photo;

  Future<void> _takePhoto() async {
    final imagePicker = ImagePicker();
    final pickedPhoto = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    ); // Configura la calidad de la imagen.
    setState(() {
      _photo = pickedPhoto != null ? File(pickedPhoto.path) : null;
    });
  } // Función asincrona para tomar una foto.

  @override
  Widget build(BuildContext context) {
    Widget previewPhoto = ElevatedButton.icon(
      onPressed: _takePhoto,
      label: Text("Tomar Foto"),
      icon: Icon(Icons.camera_alt_rounded),
    );
    if (_photo != null) {
      previewPhoto = GestureDetector(
        onTap: _takePhoto, // Permite tomar una nueva foto al tocar la imagen.
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.file(
            _photo!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
          ),
        ),
      ); // Si hay una foto, muestra la imagen.
    }
    return Container(
      margin: const EdgeInsets.all(50),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      height: 400,
      alignment: Alignment.center,
      child: previewPhoto,
    );
  }
}
