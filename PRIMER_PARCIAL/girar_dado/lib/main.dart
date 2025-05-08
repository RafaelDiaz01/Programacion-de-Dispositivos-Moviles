// Kevin Rafael Díaz López - 08/05/2024
// Aplicación que simula el lanzamiento de un dado, mostrando una animación de giro y un resultado aleatorio.

import 'package:flutter/material.dart';
import 'dart:math'; // Import para generar números aleatorios.
import 'dart:async'; // Para manejar operaciones asíncronas.

// Función principal que inicia la aplicación.
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeDado(), // Establece HomeDado como pantalla inicial.
    );
  }
}

// Widget con estado que contiene la lógica del dado, tiene que ser StatefulWidget.
class HomeDado extends StatefulWidget {
  const HomeDado({super.key}); // Constructor.

  // Crea el estado asociado a este widget.
  @override
  State<HomeDado> createState() {
    return _HomeDadoState();
  }
}

// El guión bajo nos indica que es una clase privada.
class _HomeDadoState extends State<HomeDado> {
  var _rutaDado = 'assets/images/dado3.png'; // Variable para la ruta de la imagen actual.
  var _i = 1; // Variable para hacer la imagen aleatoria.
  var _isAnimited = false; // Bandera para controlar la animación.

  // Función asíncrona para girar el dado.
  // Una función asíncrona es una función que no espera a que una operación se complete antes de continuar ejecutando el código siguiente.
  Future<void> girarDado() async {
    // Si no hay animación en curso
    if (!_isAnimited) {
      _isAnimited = true; // Se activa la bandera de animación.

      // Lista de rutas de las imágenes.
      List<String> listaDados = [
        "assets/images/dado3.png",
        "assets/images/dado6.png",
        "assets/images/dado4.png",
        "assets/images/dado1.png",
        "assets/images/dado2.png",
        "assets/images/dado5.png",
      ];

      // Cada frame de la animación va a durar 200 milisegundos.
      var duracion = Duration(milliseconds: 200);

      // For para recorrer todas las imágenes rápidamente.
      for (var dado in listaDados) {
        setState(() {
          _rutaDado = dado; // Actualizar imagen del dado.
        });
        await Future.delayed(duracion);
      }

      // Función para seleccionar la imagen aleatoria.
      setState(() {
        _i =
            Random().nextInt(6) +
            1; // Con la función Random selecciona un número aleatorio entre 1 y 6.
        _rutaDado = 'assets/images/dado$_i.png'; // Se actualiza rutaDado con la nueva ruta.
      });

      _isAnimited = false; // Se reestablece la bandera de animación.
    }
  }

  // Método build que construye la interfaz de usuario.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Fondo con gradiente radial.
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Color.fromARGB(255, 236, 233, 7)],
            radius: 0.5,
          ),
        ),
        child: Center(
          // Widget center que tiene de hijo una columna, esto para tener los elementos en el centro de la pantalla.
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centrar verticalmente.
            children: [
              // Imagen del dado.
              Image.asset(_rutaDado, width: 220),
              SizedBox(
                height: 50,
              ), // Espaciador para mejorar el estilo de la app.
              // Botón para girar el dado
              ElevatedButton(
                onPressed: girarDado, // Aquí se llama a la función de giro.
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 133, 233, 203),
                  textStyle: TextStyle(fontSize: 25), // Tamaño de texto.
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                ),
                child: Text("Girar Dado"), // Texto del botón.
              ),
            ],
          ),
        ),
      ),
    );
  }
}
