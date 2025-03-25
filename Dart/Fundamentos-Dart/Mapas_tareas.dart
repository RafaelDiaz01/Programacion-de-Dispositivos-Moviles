// Kevin Rafael Díaz López - 25/03/2025
// Tarea de Mapas

final Map <String, dynamic> pokemon = {
    'name' : 'Ditto',
    'hp' : 100,
    'isAlive' : true,
    'abilities' : <String> ['Impostor'],
    'sprites' : {
      1: 'ditto/front.png',
      2: 'ditto/back.png'
    }
  };
  
  print(pokemon);
  
  //Imprimir unicamente la llave name
  print ('Name: ${ pokemon['name'] }');
}