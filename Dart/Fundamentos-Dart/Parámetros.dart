void main (){

  print(greetPerson(name: 'Kevin', message: 'Hi'));
  
}

// Las {} vuelven a los parametros "opcionales".
// Con required decimos que el parametro siempre debe ser requerido.
String greetPerson({required String name, String message = 'Hola, '} ){

  return '$message $name';
}