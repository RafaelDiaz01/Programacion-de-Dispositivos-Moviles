// Kevin Rafael Díaz López - 26/03/2025
// Uso de funciones en Dart.
void main() {

  print(greetEveryone()); // Imprime la cadena que regresa la función.
  print(greetEveryone2()); // Imprime la función de flecha.
  print('Suma: ${addTwoNumbers(3, 4)}'); // Imprime la función de suma.
  print('Resta: ${restarDosNumeros(10, 9)}'); // Imprime la función de flecha para restar dos números.


}

// Función que regresa una cadena.
String greetEveryone() {
  return 'Hola a todos!';
}

// Función de flecha
String greetEveryone2() => 'Hello';

// Función para sumar 2 números.
int addTwoNumbers (int a, int b){
  return a + b;
}

// Función de felcha para restar 2 números.
int restarDosNumeros (int a, int b) => a - b;