# Implementando la lógica

Ya que tenemos nuestro _pseudo-code_ listo, qué les parece si empezamos a escribir un poco? Vamos a ir línea por línea:

## Removiendo la primera línea que es un header

Para ello, vamos a utilizar el método conocido de las `List`, `removeAt(index)`. Me gustaría que agreguen un `assert` para asegurarnos que hemos removido el header. 💀 Cómo podríamos hacer esto? Recuerden que hacemos todo este tipo de código para entrenar. En próximos capítulos vamos a ver cómo empezar a testear y esto les habrá sido muy útil!

```dart
void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart data_processing.dart <inputFile.csv>');
    exit(1);
  }
  final inputFile = arguments.first;
  final contentInLines = File(inputFile).readAsLinesSync();

  // remover la primera línea ya que es un header
  contentInLines.removeAt(0);
  assert(!contentInLines[0].contains('Score'), 'The content should have its header removed');
  
  for (var line in contentInLines) {
    print(line);
  }
// iterar por todas las líneas
// convertir cada línea en un listado de `String` que va a representar cada una, a una película
// crear variable para almacenar la suma total de los puntajes
// crear variable para almacenar el promedio de los puntajes
// calcular el promedio
// imprimir el promedio
}
```

## Iterar por todas las líneas y convertirla en un listado del tipo String

Ahora vamos a utilizar un método que aun no conocen y que nos permite convertir un `String` en una `List<String>` según el patrón que decidamos. En este caso, como tenemos un archivo separado por comas, eso nos permite separar los valores de cada línea de manera sencilla. Para corroborarlo, imprimiremos ahora, la película o lista de `String` que representa cada película:

```dart
void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart data_processing.dart <inputFile.csv>');
    exit(1);
  }
  final inputFile = arguments.first;
  final contentInLines = File(inputFile).readAsLinesSync();

  // remover la primera línea ya que es un header
  contentInLines.removeAt(0);
  assert(!contentInLines[0].contains('Score'), 'The content should have its header removed');
  
  // iterar por todas las líneas
  for (var line in contentInLines) {
    // convertir cada línea en un listado de `String` que va a representar cada una, a una película
    final movie = line.split(',');
    print(movie);
  }
// crear variable para almacenar la suma total de los puntajes
// crear variable para almacenar el promedio de los puntajes
// calcular el promedio
// imprimir el promedio
}
```

Suceden dos cosas extrañas en nuestro último `print`:

1. Cada valor de puntaje y título, es precedido por varios espacios, pareciera a los fines de conservar una alineación. Esto puede traernos problemas cuando queramos hacer cálculos.
2. La última de nuestras películas es una lista vacía, posiblemente por la misma razón de utilización de espacios.

Vamos a solucionarlas en unos segundos!

## Crear variables

💀 Algo que ya conocemos así que pueden hacerlo ustedes para practicar:

```dart
void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart data_processing.dart <inputFile.csv>');
    exit(1);
  }
  final inputFile = arguments.first;
  final contentInLines = File(inputFile).readAsLinesSync();
  // crear variable para almacenar la suma total de los puntajes
  // crear variable para almacenar el promedio de los puntajes
  var sumOfScores = 0.0;
  var averageScore = 0.0;

  // remover la primera línea ya que es un header
  contentInLines.removeAt(0);
  assert(!contentInLines[0].contains('Score'), 'The content should have its header removed');
  
  // iterar por todas las líneas
  for (var line in contentInLines) {
    // convertir cada línea en un listado de `String` que va a representar cada una, a una película
    final movie = line.split(',');
    print(movie);
  }
// calcular el promedio
// imprimir el promedio
}
```

## Calcular el promedio e imprimirlo

💀 Intenten hacerlo para ver qué sucede!

```dart
void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart data_processing.dart <inputFile.csv>');
    exit(1);
  }
  final inputFile = arguments.first;
  final contentInLines = File(inputFile).readAsLinesSync();
  // crear variable para almacenar la suma total de los puntajes
  // crear variable para almacenar el promedio de los puntajes
  var sumOfScores = 0.0;
  var averageScore = 0.0;

  // remover la primera línea ya que es un header
  contentInLines.removeAt(0);
  assert(!contentInLines[0].contains('Score'), 'The content should have its header removed');
  
  // iterar por todas las líneas
  for (var line in contentInLines) {
    // convertir cada línea en un listado de `String` que va a representar cada una, a una película
    final movie = line.split(',');
    print(movie);
    // calcular el promedio
    sumOfScores += double.parse(movie[1]);
  }
  
  averageScore = sumOfScores / contentInLines.length;
  // imprimir el promedio
  print('Average score: ${averageScore.toStringAsFixed(0)}');
}
```

Nos encontramos con esta `Exception` que nos dice que hay error de rango, ya que está intentando buscar en el `index` 1, cuando el único valor válido es el 0: `Exception has occurred.
RangeError (RangeError (index): Invalid value: Only valid value is 0: 1)`. Por qué sucede esto? Esto quiere decir que nuestra última película no está vacía?

Podemos utilizar `print` para entender si la última lista o película está vacía:

```dart
void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart data_processing.dart <inputFile.csv>');
    exit(1);
  }
  final inputFile = arguments.first;
  final contentInLines = File(inputFile).readAsLinesSync();
  // crear variable para almacenar la suma total de los puntajes
  // crear variable para almacenar el promedio de los puntajes
  var sumOfScores = 0.0;
  var averageScore = 0.0;

  // remover la primera línea ya que es un header
  contentInLines.removeAt(0);
  assert(!contentInLines[0].contains('Score'),
      'The content should have its header removed');

  // iterar por todas las líneas
  for (var line in contentInLines) {
    // convertir cada línea en un listado de `String` que va a representar cada una, a una película
    final movie = line.split(',');
    print(movie);
    // calcular el promedio
    print('last movie is empty?: ${movie.isEmpty}');
    // sumOfScores += double.parse(movie[1]);
  }

  averageScore = sumOfScores / contentInLines.length;
  // imprimir el promedio
  print('Average score: ${averageScore.toStringAsFixed(0)}');
// ordenar el listado de películas de mayor a menor puntaje
// imprimir los primeros 10 títulos de nuestro listado ordenado por mayor puntaje
}
```

Aquí podemos comprobar que la última película no está vacía pero qué valor puede tener si cuando la imprimimos no muestra nada? 💀 Vayan a Dartpad y prueben imprimir esto:

```dart
void main() {
    final notTotallyEmptyList = [''];
    print(notTotallyEmptyList);
    print(notTotallyEmptyList.isEmpty);
}
```

😳 Exacto! Resulta que el primer y único elemento de esa lista es una _empty string_ o cadena de texto vacía y es por esto que nos estaría dando el error!

💀 Ahora entonces, procedamos a quitar el último elemento de la lista, ya que no representa ninguna película y agregarle un `assert` para asegurarnos de que lo hizo correctamente, calcular el promedio e imprimirlo. Ya tienen todos los elementos para hacerlo así que tómense el tiempo necesario y prueben solos:

```dart
void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart data_processing.dart <inputFile.csv>');
    exit(1);
  }
  final inputFile = arguments.first;
  final contentInLines = File(inputFile).readAsLinesSync();
  // crear variable para almacenar la suma total de los puntajes
  // crear variable para almacenar el promedio de los puntajes
  var sumOfScores = 0.0;
  var averageScore = 0.0;

  // remover la primera línea ya que es un header
  contentInLines.removeAt(0);
  assert(!contentInLines[0].contains('Score'),
      'The content should have its header removed');
  contentInLines.removeAt(contentInLines.length - 1);
  assert(contentInLines[contentInLines.length - 1][0].isNotEmpty,
      'First item of last movie should not be empty');

  // iterar por todas las líneas
  for (var line in contentInLines) {
    // convertir cada línea en un listado de `String` que va a representar cada una, a una película
    final movie = line.split(',');
    // calcular el promedio
    sumOfScores += double.parse(movie[1]);
  }

  averageScore = sumOfScores / contentInLines.length;
  // imprimir el promedio
  print('Average score: ${averageScore.toStringAsFixed(0)}');
}
```
