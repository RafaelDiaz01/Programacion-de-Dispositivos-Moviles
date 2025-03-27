// Kevin Rafael Díaz López - 27/03/2025
// Clases y constructores en Dart. 

void main (){

  final Hero increibles = new Hero('Mr.Increíle', 'Superfuerza'); // Llamada al constructor
  print('\nSuperheroes');
  print ('Nombre: ${increibles.name}'); // Imprime el nombre del heroe.
  print ('Poder: ${increibles.power}\n'); // Imprime el poder del heroe.

  final Villain sindrome = new Villain('Síndrome', 'Inteligencia');
  print('Villanos');
  print ('Nombre del villano: ${sindrome.name}');
  print('Poder: ${sindrome.power}');
}

// Clase 
class Hero {
  String name = ''; // Instancia de la clase heroe.
  String power = '';

  // El constructor debe tener el mismo nombre de la clase.
  Hero( String pName, String pPower){
    this.name = pName; // El this es opcional.
    this.power = pPower;
  }

  /* Otra forma de inicializar un constructor (Inicialización controlada).
  Hero( String pName, String pPower)
    : name = pName
      power = pPower;
  */
}

// Clase de villanos
class Villain {
  String name ;
  String power ;

  Villain( this. name, this.power); // Otra forma de inicializar un constructor.
}