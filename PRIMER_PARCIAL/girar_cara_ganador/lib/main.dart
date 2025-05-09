// Kevin Rafael Díaz López - 08/05/2024
// Programa que elige un ganador de un sorteo entre los alumnos del grupo 603.

import 'package:flutter/material.dart';
import 'dart:math'; // Para generación de números aleatorios
import 'dart:async'; // Para operaciones asíncronas

// Función principal que inicia la aplicación.
void main() {
  runApp(MyApp()); // Ejecuta el widget MyApp
}

// Widget principal de la aplicación que es de tipo Stateless.
class MyApp extends StatelessWidget {
  // Constructor con clave opcional
  const MyApp({super.key});

  // Método build requerido para widgets Stateless.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: HomeCara(), // Establece HomeCara como pantalla inicial
    );
  }
}

// Como vamos a cambiar de estado, se necesita utilizar Stateful.
class HomeCara extends StatefulWidget {
  // Constructor.
  const HomeCara({super.key});

  // Se crea el estado mutable para este widget
  @override
  State<HomeCara> createState() {
    return _HomeCaraState();
  }
}

// Clase privada para HomeCara.
class _HomeCaraState extends State<HomeCara> {

  var _rutaCara = 'assets/images/comp1.jpeg'; // Ruta de la imagen inicial.
  var _i = 1; // Variable para almacenar el número aleatorio.
  String _ganador = ''; // String para guardar el nombre del alumno ganador.
  
  // Bandera para controlar si la animación está en curso.
  var _isAnimited = false;

  // Lista de nombres.
  final List<String> _alumnos = [
    'Albert Alexis',
    'Amelia Mendoza',
    'Diana Belen',
    'Rosendo Eden',
    'Elton Yael',
    'Sergio Elías',
  ];

  // Función asíncrona para animar y seleccionar ganador.
  Future<void> girarCara() async {
    // Solo ejecuta si no hay animación en curso.
    if (!_isAnimited) {
      _isAnimited = true; // Activamos la bandera de animación.

      // Lista de rutas de imágenes.
      List<String> listaRutas = [
        "assets/images/comp1.jpeg",
        "assets/images/comp2.jpeg",
        "assets/images/comp3.jpeg",
        "assets/images/comp4.jpeg",
        "assets/images/comp5.jpeg",
        "assets/images/comp6.jpeg",
      ];

      // Duración de cada frame de la animación
      var duracion = Duration(milliseconds: 100); // Le puse 100ms para que se vea más rápido.

      // Bucle para la animación.
      for (var cara in listaRutas) {
        setState(() {
          _rutaCara = cara; // Actualiza la imagen mostrada
        });
        await Future.delayed(duracion); // Espera antes del siguiente frame.
      }

      // Aquí se hace la selección final aleatoria.
      setState(() {
        _i = Random().nextInt(6) + 1; // Número aleatorio 1-6
        _rutaCara = 'assets/images/comp$_i.jpeg'; // Asigna la imagen aleatoria.
        _ganador = _alumnos[_i - 1]; // Como las imagenes estan en el mismo orden que la lista de alumnos, pues solo necesitamos ocupar _i.
      });
      _isAnimited = false; // Desactiva bandera de animación
    }
  }

  // Método build para construir la interfaz.
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              const Color.fromARGB(255, 255, 255, 255), 
              Color.fromRGBO(54, 130, 127, 1),
            ],
            radius: 0.4, // Tamaño del gradiente.
          ),
        ),
        // Contenido centrado
        child: Center(
          // Columna de elementos
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrado vertical
            children: [
              // Contenedor para el título.
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(15), // Bordes redondeados.
                ),
                width: 300, // Ancho fijo para el contenedor del título.
                child: Text(
                  "Alumnos del 603", // Texto del título
                  style: TextStyle(fontSize: 35), // Tamaño de fuente.
                  textAlign: TextAlign.center, // Texto centrado.
                ),
              ),
              SizedBox(height: 80), // Espaciador para separar el título de la imagen.
              
              // Widget de imagen (muestra la imagen actual).
              Image.asset(
                _rutaCara, // Ruta de la imagen.
                width: 220,
              ),

              SizedBox(height: 40), // Espaciador.
              
              // Contenedor del texto del ganador.
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 10), 
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 350,
                child: Text(
                  "Ganador: $_ganador", // Muestra nombre del ganador.
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center, // Texto centrado.
                ),
              ),
              SizedBox(height: 20), // Espaciador.
              
              // Botón para iniciar el sorteo.
              ElevatedButton.icon(
                icon: Icon(Icons.play_circle_sharp), // Ícono de play
                onPressed: girarCara, // Al presionar, llama a girarCara.
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  textStyle: TextStyle(fontSize: 20),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                ),
                label: Text("Girar Foto"), // Texto del botón
              ),
            ],
          ),
        ),
      ),
    );
  }
}