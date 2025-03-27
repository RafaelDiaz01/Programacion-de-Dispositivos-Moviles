// Kevin Rafael Díaz López - 27/03/2025
// Parámetros en Dart.
void main (){

  print(greetPerson(name: 'Kevin', message: 'Hi')); // Imprime en consola.
  
}

// Las {} vuelven a los parametros "opcionales".
// Con required decimos que el parametro siempre debe ser requerido.
String greetPerson({required String name, String message = 'Hola, '} ){

  return '$message $name';
}