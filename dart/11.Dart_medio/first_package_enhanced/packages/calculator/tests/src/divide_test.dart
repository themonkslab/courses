import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

void main() {
  test('Given 2 and 1, when divide is called, then it should result in 2', () {
    // Given
    const a = 2;
    const b = 1;

    // When
    var result = divide(a, b);

    // Then
    expect(result, 2);
  });

  test('Given 2 and -1, when divide is called, then it should result in -2',
      () {
    // Given
    const a = 2;
    const b = -1;

    // When
    var result = divide(a, b);

    // Then
    expect(result, -2);
  });

  test('Given -2 and -1, when divide is called, then it should result in 2',
      () {
    // Given
    const a = -2;
    const b = -1;

    // When
    var result = divide(a, b);

    // Then
    expect(result, 2);
  });

  test('Given 2.0 and 1.0, when divide is called, then it should result in 2.0',
      () {
    // Given
    const a = 2.0;
    const b = 1.0;

    // When
    var result = divide(a, b);

    // Then
    expect(result, 2.0);
  });

  test(
      'Given 2 and 0, when divide is called, then it should result in Infinity',
      () {
    // Given
    const a = 2;
    const b = 0;

    // When
    var result = divide(a, b);

    // Then
    expect(result.isInfinite, isTrue);
  });

  test('Given 0 and 2, when divide is called, then it should result in 0', () {
    // Given
    const a = 0;
    const b = 2;

    // When
    var result = divide(a, b);

    // Then
    expect(result, 0);
  });

  test('Given 0 and 0, when divide is called, then it should result in 0', () {
    // Given
    const a = 0;
    const b = 0;

    // When
    var result = divide(a, b);

    // Then
    expect(result.isNaN, isTrue);
  });
}
