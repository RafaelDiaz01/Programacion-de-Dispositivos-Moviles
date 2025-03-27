// Kevin Rafael Díaz López - 27/03/2025
// Override en Dart.

void main (){

  final Hero increibles = new Hero('Mr.Increíle', 'Superfuerza'); // Llamada al constructor
  print('\nSuperheroes');
  print ('Nombre: ${increibles.name}'); // Imprime el nombre del heroe.
  print ('Poder: ${increibles.power}\n'); // Imprime el poder del heroe.

  final Villain sindrome = new Villain(name: 'Síndrome');
  print('Villanos');
  print ('Nombre del villano: ${sindrome.name}');
  print('Poder: ${sindrome.power}\n');

  print(sindrome);
}

// Clase 
class Hero {
  String name = '';
  String power = '';

  Hero( String pName, String pPower){
    this.name = pName;
    this.power = pPower;
  }
}

// Clase de villanos
class Villain {
  String name ;
  String power ;

  Villain( {
    required this. name, 
    this.power = 'Inteligencia'});

  @override // Sobreescribe el comportamiento nativo del toString.
  String toString(){
    return '$name - $power';
  }
}