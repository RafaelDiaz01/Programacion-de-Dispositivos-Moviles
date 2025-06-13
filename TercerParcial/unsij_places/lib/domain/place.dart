// Kevin Rafael Díaz López - 04/07/2025
// Se instaló el paquete uuid para generar identificadores únicos.

import 'package:uuid/uuid.dart';

// Objeto constante
// uuid es un objeto de la clase Uuid que se utiliza para generar identificadores únicos.
const uuid = Uuid();

class Place {
  // Constructor que recibe un nombre y genera un ID único
  // El ID se genera utilizando la librería uuid para asegurar que cada lugar tenga un identificador único.
  Place({required this.name}) : id = uuid.v4(); // Genera un ID único al crear una instancia de Place.
  final String id;
  final String name;
}
