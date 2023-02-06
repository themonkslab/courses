import 'package:calculator/calculator.dart' as calculator;

void printSumOf(num a, num b) =>
    print('= The result of adding $a and $b is: ${calculator.add(a, b)}');
void printSubstrctionOf(num a, num b) => print(
    '= The result of substracting $a to $b is: ${calculator.substract(a, b)}');
void printMultiplicationOf(num a, num b) => print(
    '= The result of multiplying $a and $b is: ${calculator.multiply(a, b)}');
void printDivisionOf(num a, num b) =>
    print('= The result of dividing $a by $b is: ${calculator.divide(a, b)}');
