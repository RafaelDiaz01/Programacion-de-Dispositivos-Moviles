// Kevin Rafael Díaz López - 26/03/2025
// List, iterables y sets.
void main (){

  final numbers = [1,2,3,4,5,5,5,6,7,8,9,9,10];

  print('List original: $numbers'); // Imprime la lista original.
  print('Length: ${numbers.length}'); // Imprime la longitud de la lista.
  print('Index 0: ${numbers[0]}'); // Imprime el primer elemento de la lista.
  print('Last: ${numbers.last}'); // Imprimer el último carácter usando una manera más descriptiva.
  print('Reversed: ${numbers.reversed} \n'); // Imprime la lista revertida.

  final reversedNumbers = numbers.reversed; // Ya no es un listado, ahora es un iterable.
  print('Iterable: $reversedNumbers');
  print('List: ${reversedNumbers.toList()}'); // Imprime de regreso la lista. Obtiene del iterable la lista original.
  print('Set: ${reversedNumbers.toSet()} \n'); // Un set contiene elementos únicos (ej: los números no se repiten).

  final numbersGreatherThat5 = numbers.where ((num) {
    return num > 5; // Esto regresa un booleano (true).
  });

  print('>5 Iterable: $numbersGreatherThat5');
  print('>5 Set: ${numbersGreatherThat5.toSet() }');

}