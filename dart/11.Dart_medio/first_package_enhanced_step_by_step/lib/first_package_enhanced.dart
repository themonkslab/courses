import 'package:calculator/calculator.dart' as calculator;

void printCalculations(double a, double b) {
  print(calculator.add(a, b));
  print(calculator.divide(a, b));
  print(calculator.multiply(a, b));
  print(calculator.substract(a, b));
}
