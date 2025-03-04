# Kevin Rafael Díaz López - 04/03/2025
# Examen diagnóstico.

# Códigos para dar color al título.
GREEN = "\033[32m"  # Define el color verde para el texto.
RED = "\033[31m"  # Define el color rojo para el texto.
RESET = "\033[0m"  # Define el color de reinicio para volver al color original.

# Título del programa.
print(f"\n\t{GREEN}|EXAMEN DIAGNOSTICO|{RESET}")  # Imprime el título del programa en color verde.
print()  # Imprime una línea en blanco.

# Diccionario que contiene cada carácter y el número de pulsaciones necesarias.
teclado = {
    '1': 1,
    '2': 1, 'a': 2, 'b': 3, 'c': 4,
    '3': 1, 'd': 2, 'e': 3, 'f': 4,
    '4': 1, 'g': 2, 'h': 3, 'i': 4,
    '5': 1, 'j': 2, 'k': 3, 'l': 4,
    '6': 1, 'm': 2, 'n': 3, 'o': 4,
    '7': 1, 'p': 2, 'q': 3, 'r': 4, 's': 5,
    '8': 1, 't': 2, 'u': 3, 'v': 4,
    '9': 1, 'w': 2, 'x': 3, 'y': 4, 'z': 5,
    '*': 1,
    '0': 1,
    '#': 1
}

palabra = input("\nIngrese una palabra: ") # Solicitar al usuario que ingrese una palabra.

contador = 0 # Inicializar el contador de pulsaciones.

# Iterar sobre cada letra de la palabra ingresada.
for letra in palabra:
    if letra in teclado:  # Verificar si la letra está en el diccionario.
        contador = contador + teclado[letra]  # Sumar las pulsaciones correspondientes al contador.

# Imprimir el total de pulsaciones necesarias.
print(f"Pulsaciones => {contador}")