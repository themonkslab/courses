import 'dart:io';

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
