// Kevin Rafael Díaz López - 27/03/2025
// Name constructors en Dart (ej: para respuestas http).

void main (){

  final Map <String, dynamic> rawJson = {
    'name' : 'Batman',
    'power' : 'Money',
    'car' : 'Batimovil'   
  };

  // Llamamos a nuestro constructor nombrado.
  final batman = Hero.fromJson(rawJson);

  print('Personaje: $batman');
  
}

class Hero {
  String name;
  String power;
  String car;

  Hero({
    required this.name,
    required this.power,
    required this.car
  });

  // Nombramos el constructor
  Hero.fromJson ( Map <String,dynamic> json)
    : name = json ['name'] ?? 'No name found',
      power = json ['power'] ?? 'No power found',
      car = json ['car'] ?? 'No car found';


  // Sobreescribir el método toString para imprimir los datos en consola.
  @override
  String toString() {
    return '$name, $power, $car'; // Se usa un ternario para verificar si esta vivo o o.
  }
}