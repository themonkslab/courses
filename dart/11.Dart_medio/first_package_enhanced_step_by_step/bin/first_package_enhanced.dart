import 'dart:io';

void main(List<String> arguments) {
  print('-----------------------------------');
  print(
      'Hi! 😃 I am your calculator.\nPlease enter number a, b, and the operation you want to perform.\nThe possible ones are (a)dd | (s)ubsctract | (m)ultiply | (d)ivide\nEnjoy!');
  print('-----------------------------------');

  String? userInput;

  while (true) {
    stdout.write('Enter FIRST number or "q" to quit: ');
    userInput = stdin.readLineSync();
    if (userInput?.trim() == 'q') return;
  }
}
