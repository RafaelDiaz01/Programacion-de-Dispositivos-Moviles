// Kevin Rafael Díaz López - 25/03/2025
// Mapas en Dart. Un mapa siempre lleva ; al final de las llaves. Un mapa contiene llaves y sus respectivos valores.

void main (){
  
  final Map <String, dynamic> pokemon = { // El <String> es para declarar que las llaves serán de tipo String y el <dynamic> para los valores.
    'name' : 'Ditto',
    'hp' : 100,
    'isAlive' : true,
    'abilities' : <String> ['Impostor']
  };
  
  print(pokemon);
  
  print ('Name: ${ pokemon['name'] }'); // Imprimir unicamente la llave name y su valor.
}