# Obteniendo _user input_

Empecemos por __cambiar lo primero que el usuario va a ver__ en nuestro programa:

```dart
void main() {
    print('Rock, paper or scissors? (r/p/s)');


    //  Pseudo code
    //  
    //  Mientras que sea verdad
    //      Mostrar el prompt al usuario
    //      Leer su respuesta desde la consola
    //      Si el input es válido ('r', 'p', 's')
    //          Ejecutar opción random de computadora
    //          Comparar ese movimiento con el del usuario
    //          Mostrar el resultado
    //      Si el input es 'q'
    //          Salir del programa
    //      Si el input es otra tecla
    //          Mostrar 'Invalid input'
}
```

Luego de ello, necesitamos obtener qué es lo que escribe y para ello vamos a hacer uso de una función dentro de un paquete o _package_, que es algo que frecuentemente utilizarán.

## _Packages_

Son __librerías de funciones y utilidades de las que podemos hacer uso, sin tener que escribirlas nosotros mismos__. Para ello, necesitamos importar dichas librerías.

Empecemos por escribir cuál es la función que necesitamos que Dart nos ayudará a reconocer de qué librería se trata. Escriban luego del `print` la función `stdin;` (_stantard input_ o entrada estándar). Van a observar un subrayado rojo y al lado, Dart les indica cuál es el error: `Undefined name 'stdin'.`. No está reconociendo ese nombre en nuestro código y eso es porque todavía no lo importamos.

Situen el cursor encima de dicho nombre, y presionen las teclas `cmd/ctrl + .` y se les va a abrir un menú de ayuda. Allí seleccionan `Import library dart:io`. Dart se encargó de hacer el import de dicha librereia por nosotros y van a ver que ya no hay ningún fallo:

![Importando dart:io](https://raw.githubusercontent.com/themonkslab/courses/main/dart/5.app_linea_comando/5.7_importando_dart_io.gif)

Además, __si se paran encima de ese `import` (y esto es algo que constantemente pueden probar), van a poder ver una documentación de dicha librería__, con las funciones y utilidades más comunes. Súper útil!

## `readLineSync`

Ya tenemos la librería. Ahora vamos a utilizarla escribiendo un punto luego de `stdin` y luego eligiendo `readLineSync()`. Con esta función (de las que hablaremos pronto), vamos a captar lo que el usuario escriba. Les parece si lo guardamos en una variable e imprimimos? 💀 Pruébenlo ustedes a ver cómo funciona! Recuerden guardar los cambios y correrla desde la línea de comandos! Ah! Y no hace falta que escriban todo de vuelta en la terminal: __pueden moverse por los últimos comandos que ejecutaron con la flecha arriba y abajo__.

```dart
import 'dart:io';

void main() {
  print('Rock, paper or scissors? (r/p/s)');
  final userInput = stdin.readLineSync();
  print(userInput);
}
```

Perfecto! El programa ya captura lo que el usuario ingrese! No les parece una belleza? Bien! Podemos hacerle algún ajuste: Sería mejor que no medie una línea entre la pregunta de nuestro programa y el _input_ del usuario. Lo podemos lograr cambiando nuestro `print` por otro método de la librería llamado `stdout.write`, agregando unos ':' al final y un espacio.  Sería algo así:

```dart
import 'dart:io';

void main() {
  stdout.write('Rock, paper or scissors? (r/p/s): ');
  final userInput = stdin.readLineSync();
  print(userInput);
}
```
