import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

main() {
  test('substract 1 to 2, results in 1', () {
    // Arrange
    const a = 1;
    const b = 2;
    // Act
    var result = substract(a, b);
    // Assert
    expect(result, 1);
  });
  test('substract 2 to 2, results in 0', () {
    // Arrange
    // Act
    // Assert
  });
  test('substract 3 to 2, results in -1', () {
    // Arrange
    // Act
    // Assert
  });
  test('substract -1 to -2, results in -3', () {
    // Arrange
    // Act
    // Assert
  });
}
