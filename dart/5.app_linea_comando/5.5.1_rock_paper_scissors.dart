import 'dart:io';

void main() {
  stdout.write('Rock, paper or scissors? (r/p/s): ');
  final userInput = stdin.readLineSync();
  print(userInput);
}
