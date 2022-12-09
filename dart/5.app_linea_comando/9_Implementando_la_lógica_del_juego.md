# Implementando la lógica del juego

Ya tenemos listo nuestro _loop_ y es hora de implementar el resto de la lógica.

Según nuestro _pseudo code_ y si seguimos el orden propuesto, deberíamos implementar el movimiento _random_ de la computadora. Sabemos que tenemos tres movimientos posibles. 🤔 Qué _feature_ de Dart podríamos utilizar para representarlos?

```dart
import 'dart:io';

enum Move { rock, paper, scissors } // Noten que no ponemos _trailing comma_
                                    // ya que es más fácil leerlo en una línea

void main() {
  while (true) {
    stdout.write('Rock, paper or scissors? (r/p/s): ');
    final userInput = stdin.readLineSync();
    if (userInput == 'r' || userInput == 'p' || userInput == 's') {
      print('Selected: $userInput');
    } else if (userInput == 'q') {
      print('I hope you enjoyed the game! 😃');
      break;
    } else {
      print('Invalid input! 😳');
    }
  }
}
```

Ya tenemos nuestro _enum_ pero antes de implementar el movimiento aleatorio de la computadora, tendríamos que asignar correctamente el _input_ del usuario:

```dart
import 'dart:io';

enum Move { rock, paper, scissors } // Noten que no ponemos _trailing comma_
                                    // ya que es más fácil leerlo en una línea

void main() {
  while (true) {
    stdout.write('Rock, paper or scissors? (r/p/s): ');
    final userInput = stdin.readLineSync();
    if (userInput == 'r' || userInput == 'p' || userInput == 's') {
      var playerMove;
      if (userInput == 'r') {
        playerMove = Move.rock;
      } else if (userInput == 'p') {
        playerMove = Move.paper;
      } else {
        playerMove = Move.scissors;
      }
      print('Selected: $input');
    } else if (userInput == 'q') {
      print('I hope you enjoyed the game! 😃');
      break;
    } else {
      print('Invalid input! 😳');
    }
  }
}
```

Ya creamos nuestra variable `playerMove` sin inicialización por lo que su valor inicial es nulo sin embargo, __gracias a utilizar un _enum_ sabemos que solamente contamos con esas tres posibilidades__ y para el final de los condicionales (`if`, `if else` y `else`), dicha variable va a estar inicializada.

Ahora sí tenemos que implementar el movimiento de la computadora y para ello, utilizaremos un _random number generator_ o generador de números aleatorios. Lo podemos hacer con otra librería!

Justo en la primer línea luego y dentro del `main`, creamos la variable `final rng` y le asignamos un valor de `Random()`. Van a ver que Dart les dice que no conoce dicho nombre pero ustedes ya saben qué hacer! `Cmd/ctrl + .` (llamada _magic wand_ o varita mágica) y elijan importar `dart:math`. También, recuerden que pueden ver la documentación haciendo _hover_ (situando el cursor arriba) no solo de la librería sino también de ese método específico:

![_Random number generator_](https://raw.githubusercontent.com/themonkslab/courses/blob/main/dart/5.app_linea_comando/5.9.1_random_number_generator.gif)

Ya tenemos nuestro generador de número aleatorio y ahora vamos a utilizarlo creando la variable para el número aleatorio (`final randomNumber`) y haciendo uso del generador para asignarle su valor (`rng.nextInt(3)`). Pueden observar tres cosas:

1. Pueden ver por adelantado la documentación del método cuando van recorriendo la lista. Dicho método va a crear un número aleatorio entre un mínimo incluido y un máximo no incluido.
2. Ustedes dirán 'si son tres los movimientos posibles, por qué el máximo es 3 siendo que no lo incluye y el mínimo es 0'? Porque vamos a trabajar con listas (que ya veremos en el próximo capítulo en detalle) y dichas listas cuentan sus elementos empezando por cero, y se los asignan de forma implícita para que podamos llamarlos por dicho valor (_index_).
3. Pueden ingresar dentro de la documentación con `cmd/ctrl + click`. Es algo súper útil para entender cómo funciona ese método o librería y aprender mucho más. Dart y Flutter tienen una de las mejores documentaciones por lo que anímense a meterse dentro!

![Creando número aleatorio](https://raw.githubusercontent.com/themonkslab/courses/blob/main/dart/5.app_linea_comando/5.9.2_creando_numero_aleatorio.gif)

Ahora, teniendo en cuenta lo aprendido en al punto dos anterior, vamos a implementar el movimiento de la computadora. Como dijimos, vamos a utilizar una lista. Qué lista? La que sale de llamar a nuestro _enum_ y accediendo a sus valores. Así: `Move.values`. Allí tenemos la lista pero queremos acceder a alguno de sus tres posibles movimientos y para ello, basta con abrir `[ ]` que es la forma de acceder a los valores mediante _index_  de una lista y ponemos allí dentro el número _random_ que generamos: `More.values[randomNumber];`. Todo junto se vería así:

```dart
import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors } // Noten que no ponemos _trailing comma_
// ya que es más fácil leerlo en una línea

void main() {
  final rng = Random();

  while (true) {
    stdout.write('Rock, paper or scissors? (r/p/s): ');
    final userInput = stdin.readLineSync();
    if (userInput == 'r' || userInput == 'p' || userInput == 's') {
      var playerMove;
      if (userInput == 'r') {
        playerMove = Move.rock;
      } else if (userInput == 'p') {
        playerMove = Move.paper;
      } else {
        playerMove = Move.scissors;
      }
      final randomNumber = rng.nextInt(3);
      final computerMove = Move.values[randomNumber];
      print('Selected: $userInput');
    } else if (userInput == 'q') {
      print('I hope you enjoyed the game! 😃');
      break;
    } else {
      print('Invalid input! 😳');
    }
  }
}
```

Y como ahora tenemos dos movimientos de la misma clase (`userMove` y `computerMove`, ambos del _enum Move_), podemos compararlos y determinar el resto de la lógica. Vamos a empezar con los posibles casos en los que el usuario podría ganar o empatar y luego, con un `else` los que pierde.

```dart
import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors } // Noten que no ponemos _trailing comma_
// ya que es más fácil leerlo en una línea

void main() {
  final rng = Random();

  while (true) {
    stdout.write('Rock, paper or scissors? (r/p/s): ');
    final userInput = stdin.readLineSync();
    if (userInput == 'r' || userInput == 'p' || userInput == 's') {
      var playerMove;
      if (userInput == 'r') {
        playerMove = Move.rock;
      } else if (userInput == 'p') {
        playerMove = Move.paper;
      } else {
        playerMove = Move.scissors;
      }
      final randomNumber = rng.nextInt(3);
      final computerMove = Move.values[randomNumber];
      if (playerMove == computerMove) {
        print('It\'s a draw 😄');
      } else if (playerMove == Move.rock && computerMove == Move.scissors ||
          playerMove == Move.paper && computerMove == Move.rock ||
          playerMove == Move.scissors && computerMove == Move.paper) {
        print('You win!!! 🥳');
      } else {
        print('You lose 😭');
      }
    } else if (userInput == 'q') {
      print('I hope you enjoyed the game! 😃');
      break;
    } else {
      print('Invalid input! 😳');
    }
  }
}
```

Ya tienen su primer juego! Ahora, le podemos hacer algunos ajustes: ya que eliminamos el `print('Selected...`), podríamos incluir que nos diga qué eligió el usuario y qué la computadora además de unas líneas para que nuestro juego se vuelva más entendible y daríamos por finalizado nuestro juego:

```dart
import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors } // Noten que no ponemos _trailing comma_
// ya que es más fácil leerlo en una línea

void main() {
  final rng = Random();

  while (true) {
    print('-----------------------------------');
    stdout.write('Rock, paper or scissors? (r/p/s): ');
    final userInput = stdin.readLineSync();
    if (userInput == 'r' || userInput == 'p' || userInput == 's') {
      var playerMove;
      if (userInput == 'r') {
        playerMove = Move.rock;
      } else if (userInput == 'p') {
        playerMove = Move.paper;
      } else {
        playerMove = Move.scissors;
      }
      final randomNumber = rng.nextInt(3);
      final computerMove = Move.values[randomNumber];
      print('You played: $playerMove');
      print('Computed played: $computerMove');
      print('-----------------------------------');
      if (playerMove == computerMove) {
        print('It\'s a draw 😄');
      } else if (playerMove == Move.rock && computerMove == Move.scissors ||
          playerMove == Move.paper && computerMove == Move.rock ||
          playerMove == Move.scissors && computerMove == Move.paper) {
        print('You win!!! 🥳');
      } else {
        print('You lose 😭');
      }
    } else if (userInput == 'q') {
      print('-----------------------------------');
      print('I hope you enjoyed the game! 😃');
      print('-----------------------------------');
      break;
    } else {
      print('-----------------------------------');
      print('Invalid input! 😳');
    }
  }
}
```

Si bien este juego puede parecerles simple, aprendimos un montón de cosas con él:

- Cómo correr programas en la línea de comando y crearlos.
- Cómo leer el _input_ del usuario.
- Cómo generar números _random_.
- Cómo resolver problemas!
