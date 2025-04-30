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
    return MaterialApp(home: HomeDado());
  }
}

class HomeDado extends StatefulWidget {
  const HomeDado({super.key});

  @override
  State<HomeDado> createState() {
    return _HomeDadoState();
  }
}

// _ Significa que es privado.
class _HomeDadoState extends State<HomeDado> {
  var _rutaDado = 'assets/images/comp1.jpeg';
  var _i = 1;
  var _isAnimited = false;

  // Es una función asincrona
  Future<void> girarDado() async {
    if (!_isAnimited) {
      _isAnimited = true;

      List<String> listaDados = [
        "assets/images/comp1.jpeg",
        "assets/images/comp2.jpeg",
        "assets/images/comp3.jpeg",
        "assets/images/comp4.jpeg",
        "assets/images/comp5.jpeg",
        "assets/images/comp6.jpeg"
      ];

      var duracion = Duration(milliseconds: 200);

      for (var dado in listaDados) {
        setState(() {
        _rutaDado = dado;
        });
        await Future.delayed(duracion);
      }

      //await Future.delayed(Duration(microseconds: 4000));

      setState(() {
        _i = Random().nextInt(6) + 1;
        _rutaDado = 'assets/images/comp$_i.jpeg';
      });
      _isAnimited = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Color.fromARGB(255, 236, 233, 7)],
            radius: 1.1,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(_rutaDado, width: 220),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: girarDado,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 250, 225, 4),
                  textStyle: TextStyle(fontSize: 20),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: Text("Girar Foto"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
