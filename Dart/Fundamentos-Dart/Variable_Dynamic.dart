// Kevin Rafael Díaz López - 25/03/2025
// En una variable dynamic, el tipo puede cambiar cuando se use esta misma variable declarada con otros tipos de datos.
// Debemos de tener cuidado al usar este tipo de variables.

void main (){
  dynamic errorMessage = 'Hola'; // String
  errorMessage = true; // Booleano
  errorMessage = [1,2,3]; // Lista
  errorMessage = () => true; // Función que devuelve un booleano
  errorMessage = null; // Nulo

  print(errorMessage);
}