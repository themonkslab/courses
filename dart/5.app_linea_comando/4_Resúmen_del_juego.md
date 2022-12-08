# Resumen del juego

En esta sección vamos a crear una versión para _command line_ (o línea de comando) del clásico 'Piedra, papel, tijera'.

El juego consiste en elegir entre esos tres elementos y las reglas son:

- Piedra vence a tijera.
- Tijera vence a papel.
- Papel vence a piedra.

Vamos a implementar este juego de forma que cada uno de ustedes enfrente a la computadora. El programa les preguntará qué juegan, la computadora hará su movimiento y luego se determina el resultado.

Aprenderemos cómo obtener _input_ desde la consola y cómo elegir números aleatorios o _random numbers_. Abajo, los _requirements_:

## 💪 Piedra, papel y tijeras

__Requirement__: crear una herramienta en la línea de comando que pueda jugar piedra, papel y tijera.

1. Al inicializar, el juego tiene que mostrar un _prompt_ o entrada como la siguiente: `Rock, paper or scissors? (r/p/s). --Use 'q' to end the game.`.
2. Debe leer ese _input_ y utilizarlo de la siguiente manera:
    - Si ingresó 'r', 'p', o 's', la entrada fue válida.
    - Si ingresó 'q', debe salir del programa.
    - Si ingresó cualquier otra cosa, mostrar 'Invalid input' y pedir nuevamente por otra.
3. Luego de que el usuario ingresó un movimiento y fue válido, se genera otro movimiento de forma aleatoria o _random_.
4. Se compara según las reglas del juego.
5. Se enuncia el resultado.
6. El programa se repite hasta que el usuario quita el programa.
