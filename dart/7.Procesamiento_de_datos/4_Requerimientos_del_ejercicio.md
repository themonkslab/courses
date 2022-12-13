# Requerimientos del ejercicio

Primero que nada, vayan a su `data_to_read.csv` para endenterlo un poco. Pueden ver que es muy sencillo y la primer línea es un _header_ o encabezado que muestra los títulos de cada columna: 'Año', 'Puntaje' y 'Título'. Qué es lo que queremos lograr? Vamos a ver los _requirements_:

_Requirement_: obtener y mostrar el promedio de puntaje de todas las películas.

Como ya vimos, un buen ejercicio es empezar escribiendo lo que imaginamos podríamos hacer, de manera coloquial o corriente. Vamos a empezar escribiendo entonces, un poco de _pseudo-code_ debajo de nuestro código:

```dart
void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart data_processing.dart <inputFile.csv>');
    exit(1);
  }
  final inputFile = arguments.first;
  final contentInLines = File(inputFile).readAsLinesSync();
  for (var line in contentInLines) {
    print(line);
  }
// remover la primera línea ya que es un header
// iterar por todas las líneas
// convertir cada línea en un listado de `String` que va a representar cada una, a una película
// crear variable para almacenar la suma total de los puntajes
// crear variable para almacenar el promedio de los puntajes
// calcular el promedio
// imprimir el promedio
}
```
