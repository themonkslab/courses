import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart counting_calories.dart <inputFile.csv>');
    exit(1);
  }
  final inputFile = arguments.first;
  print(inputFile);
}
