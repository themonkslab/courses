import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

main() {
  test('add 1 to 2, results in 3', () {
    // Arrange
    const a = 1;
    const b = 2;
    // Act
    var result = add(a, b);
    // Assert
    expect(result, 3);
  });
  test('add 1 to -2, results in -1', () {
    // Arrange
    const a = 1;
    const b = -2;
    // Act
    var result = add(a, b);
    // Assert
    expect(result, -1);
  });
  test('add -1 to -2, results in -3', () {
    // Arrange
    const a = -1;
    const b = -2;
    // Act
    var result = add(a, b);
    // Assert
    expect(result, -3);
  });
  test('add 1.5 to 2.5, results in 4.0', () {
    // Arrange
    const a = 1.5;
    const b = 2.5;
    // Act
    var result = add(a, b);
    // Assert
    expect(result, 4);
  });
}