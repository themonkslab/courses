import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors } // Noten que no ponemos _trailing comma_
// ya que es más fácil leerlo en una línea

void main() {
  final rng = Random();

  while (true) {
    print('-----------------------------------');
    stdout.write('Rock, paper or scissors? (r/p/s): ');
    final userInput = stdin.readLineSync();
    if (userInput == 'r' || userInput == 'p' || userInput == 's') {
      var playerMove;
      if (userInput == 'r') {
        playerMove = Move.rock;
      } else if (userInput == 'p') {
        playerMove = Move.paper;
      } else {
        playerMove = Move.scissors;
      }
      final randomNumber = rng.nextInt(3);
      final computerMove = Move.values[randomNumber];
      print('You played: $playerMove');
      print('Computed played: $computerMove');
      print('-----------------------------------');
      if (playerMove == computerMove) {
        print('It\'s a draw 😄');
      } else if (playerMove == Move.rock && computerMove == Move.scissors ||
          playerMove == Move.paper && computerMove == Move.rock ||
          playerMove == Move.scissors && computerMove == Move.paper) {
        print('You win!!! 🥳');
      } else {
        print('You lose 😭');
      }
    } else if (userInput == 'q') {
      print('-----------------------------------');
      print('I hope you enjoyed the game! 😃');
      print('-----------------------------------');
      break;
    } else {
      print('-----------------------------------');
      print('Invalid input! 😳');
    }
  }
}
