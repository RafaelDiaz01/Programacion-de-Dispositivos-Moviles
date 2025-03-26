// Kevin Rafael Díaz López - 25/03/2025
// Tarea de Mapas.

void main() {
  final Map<String, dynamic> pokemon = {
    'name': 'Ditto',
    'hp': 100,
    'isAlive': true,
    'abilities': <String>['Impostor'],
    'sprites': {1: 'ditto/front.png', 2: 'ditto/back.png'},
  };

  // De los sprites, imprimir primero el back y luego el front.
  print('Back: ${pokemon['sprites'] [2]}');
  print('Front: ${pokemon['sprites'] [1]}');
}
