# Dart tests

Ya hemos explicado el por qué es tan importante incorporar los tests como una práctica cotidiana, sin embargo, es recién ahora que habiendo absorvido una buena base sobre Dart, que pueden entender más su verdadera importancia. Por ello, vamos a repasar un poco empezando por modificar el último paquete en el que trabajamos, el `first_dart_packages_exercise.dart`.

Para que no se nos haga lío con los archivos, vamos a duplicarlo y nombrarlo `first_package_enhanced`, que significa 'mejorado'. Ah! Un shortcut 🩳: si hacen click en un archivo o carpeta en el árbol de archivos de VSCode y luego `enter`, van a poder renombrarlo rápidamente! 💀 Vayan a practicarlo renombrando todos los archivos con el nombre del nuevo proy... paquete! 😂

Bien! Lo que hacíamos en este paquete no era de lo más útil salvo servir al propósito de explicar cómo crear un paquete pero nos será útil nuevamente no complicarnos para poder entender sobre testing.

Habíamos creado dentro de nuestra carpeta `/bin`, la encargada de los ejecutables de nuestra línea de comando, un archivo que se encargaba de imprimir el resultado de utilizar todas las posibilidades de nuestra flamante calculadora con los enteros 2 y 6:

```dart
import 'package:first_package_enhanced/first_package_enhanced.dart'
    as first_package_enhanced;

void main(List<String> arguments) {
  first_package_enhanced.printCalculations(2, 6);
}
```

A su vez, este llamaba a la parte compartible de nuestro paquete dentro de la carpeta `/lib`, que a su vez, llamaba al paquete que creamos llamado `calculator`:

```dart
import 'package:calculator/calculator.dart' as calculator;

void printCalculations(double a, double b) {
  print(calculator.add(a, b));
  print(calculator.divide(a, b));
  print(calculator.multiply(a, b));
  print(calculator.substract(a, b));
}
```

Bueno, vamos a toquetear un poco este programita para volverlo un poquito más interesante:

## 💪 Una calculadora en la terminal

__Requirement__: volver utilizable la calculadora en la terminal basándose en el ejercicio de la sección 5, ejercicio 5.1_rock_paper_scissors.dart.

__💀 Solución__: [Aquí!]()
