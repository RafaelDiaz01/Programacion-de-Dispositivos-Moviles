import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(MyApp());
}

// Creamos el objeto
class MyApp extends StatelessWidget {
  // Crea el constructor
  const MyApp({super.key});

  // Método del constructor
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeCara());
  }
}

// Creamos la clase HomeDado que será StatefulWidget ya que cambiará de estado debido al movimiento de las imagenes.
class HomeCara extends StatefulWidget {
  const HomeCara({super.key});

  @override
  State<HomeCara> createState() {
    return _HomeCaraState();
  }
}

// _ Significa que es privado.
class _HomeCaraState extends State<HomeCara> {
  var _rutaCara = 'assets/images/comp1.jpeg'; // Variable para ruta de la imagenes. (Las imagenes deben tener un número al final de su nombre para poder hacer la lógica de aleatoridad).
  var _i = 1; // Variable para la lógica de aleatoridad.
  var _isAnimited = false; // Sirve para iniciar el movimiento de las imagenes.

  // Es una función asincrona
  Future<void> girarCara() async {
    if (!_isAnimited) {
      _isAnimited =
          true; // Cambia el estado de la variable a true para indicar que se esta animando.

      // Lista de Strings con la ruta de las imágenes.
      List<String> listaRutas = [
        "assets/images/comp1.jpeg",
        "assets/images/comp2.jpeg",
        "assets/images/comp3.jpeg",
        "assets/images/comp4.jpeg",
        "assets/images/comp5.jpeg",
        "assets/images/comp6.jpeg",
      ];

      // Variable que indica cuando dura la animación de movimiento entre imágenes.
      var duracion = Duration(milliseconds: 200);

      for (var cara in listaRutas) {
        setState(() {
          _rutaCara = cara;
        });
        await Future.delayed(duracion);
      }

      // Aquí se realiza la lógica para mostrar la imagen aleatoria.
      setState(() {
        _i =
            Random().nextInt(6) +
            1; // La función Random asigna un número aleatorio a _i.
        _rutaCara =
            'assets/images/comp$_i.jpeg'; // El número aleatorio se agrega a la ruta de la imagen y se guarda en _rutaCara.
      });
      _isAnimited = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Retorna un Scaffold que es la estructura básica de una pantalla en Flutter.
    return Scaffold(
      // El cuerpo de la pantalla es un Container con un gradiente radial de fondo.
      body: Container(
        decoration: BoxDecoration(
          // Agregamos el BoxDecoration para utilizar el gradiente.
          gradient: RadialGradient(
            // Gradiente que va desde blanco a verde.
            colors: [
              const Color.fromARGB(255, 255, 255, 255),
              Color.fromRGBO(54, 130, 127, 1),
            ],
            radius: 0.4, // Radio del gradiente (50% del tamaño del contenedor)
          ),
        ),
        // Centra todos los elementos hijos
        child: Center(
          // Organiza los elementos en una columna vertical
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centra verticalmente los elementos
            children: [
              // Contenedor para el texto del título
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(
                    255,
                    255,
                    255,
                    1,
                  ), // Container de color blanco.
                  borderRadius: BorderRadius.circular(
                    15,
                  ), // Bordes redondeados.
                ),
                width: 300,
                child: Text(
                  "Alumnos del 603", // Texto del título.
                  style: TextStyle(fontSize: 35),
                  textAlign:
                      TextAlign
                          .center, // Se utiliza para centrar el texto dentro del container.
                ),
              ),
              SizedBox(
                height: 80,
              ), // Espaciador vertical de 80px para darle un mejor estilo a la app.
              // Muestra una imagen cuya ruta está en la variable _rutaCara.
              Image.asset(
                _rutaCara,
                width: 220,
              ), // La imagen tendra un ancho de 220px.

              SizedBox(height: 40), // Espaciador vertical de 40px.
              // Botón elevado que ejecuta la función girarCara al ser presionado.
              ElevatedButton(
                onPressed:
                    girarCara, // Aquí se ejecuta la función al momento de presionar el botón.
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                    255,
                    255,
                    255,
                    255,
                  ), // Fondo blanco
                  textStyle: TextStyle(fontSize: 20), // Tamaño de texto del botón.
                  foregroundColor: const Color.fromARGB(
                    255,
                    0,
                    0,
                    0,
                  ), // Color del texto (negro)
                ),
                child: Text("Girar Foto"), // Texto del botón
              ),
            ],
          ),
        ),
      ),
    );
  }
}
