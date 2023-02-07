import 'dart:io';

import 'package:first_package_enhanced/first_package_enhanced.dart'
    as first_package_enhanced;

void main(List<String> arguments) {
  print('-----------------------------------');
  print(
      'Hi! 😃 I am your calculator.\nPlease enter number a, b, and the operation you want to perform.\nThe possible ones are (a)dd | (s)ubsctract | (m)ultiply | (d)ivide\nEnjoy!');
  print('-----------------------------------');

  while (true) {
    String? a;
    num? numA;
    String? b;
    num? numB;
    String? operation;

    do {
      stdout.write('Enter FIRST number or "q" to quit: ');
      a = stdin.readLineSync();
      if (a?.trim() == 'q') return;
      numA = num.tryParse(a!);
    } while (numA == null);

    do {
      stdout.write('Enter SECOND number or "q" to quit: ');
      b = stdin.readLineSync();
      if (b?.trim() == 'q') return;
      numB = num.tryParse(b!);
    } while (numB == null);

    do {
      stdout.write(
          'Select OPERATION\n(a)dd\n(s)ubsctract\n(m)ultiply\n(d)ivide\nor "q" to quit: ');
      operation = stdin.readLineSync();
      if (operation?.trim() == 'q') return print('Thanks for the use! ❤️');
    } while (operation != null && operation.trim() == 'q');

    switch (operation) {
      case 'a':
        first_package_enhanced.printSumOf(numA, numB);
        break;
      case 's':
        first_package_enhanced.printSubstrctionOf(numA, numB);
        break;
      case 'm':
        first_package_enhanced.printMultiplicationOf(numA, numB);
        break;
      case 'd':
        first_package_enhanced.printDivisionOf(numA, numB);
        break;
    }
    print('-----------------------------------');
    print("Let's go again! 🧮");
    print('-----------------------------------');
  }
}
