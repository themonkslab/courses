import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

void main() {
  test('Given 2 and 1, when multiply is called, then it should result in 2',
      () {
    // Given
    const a = 2;
    const b = 1;

    // When
    var result = multiply(a, b);

    // Then
    expect(result, 2);
  });

  test('Given 2 and -1, when multiply is called, then it should result in -2',
      () {
    // Given
    const a = 2;
    const b = -1;

    // When
    var result = multiply(a, b);

    // Then
    expect(result, -2);
  });

  test('Given -2 and -1, when multiply is called, then it should result in 2',
      () {
    // Given
    const a = -2;
    const b = -1;

    // When
    var result = multiply(a, b);

    // Then
    expect(result, 2);
  });

  test(
      'Given 2.0 and 1.0, when multiply is called, then it should result in 2.0',
      () {
    // Given
    const a = 2.0;
    const b = 1.0;

    // When
    var result = multiply(a, b);

    // Then
    expect(result, 2.0);
  });
}
