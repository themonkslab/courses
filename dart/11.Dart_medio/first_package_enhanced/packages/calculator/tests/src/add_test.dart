import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

void main() {
  test('Given 1 and 2, when add is called, then it should result in 3', () {
    // Given
    const a = 1;
    const b = 2;

    // When
    var result = add(a, b);

    // Then
    expect(result, 3);
  });

  test('Given 1 and -2, when add is called, then it should result in -1', () {
    // Given
    const a = 1;
    const b = -2;

    // When
    var result = add(a, b);

    // Then
    expect(result, -1);
  });

  test('Given -1 and -2, when add is called, then it should result in -3', () {
    // Given
    const a = -1;
    const b = -2;

    // When
    var result = add(a, b);

    // Then
    expect(result, -3);
  });

  test('Given 1.5 and 2.5, when add is called, then it should result in 4.0',
      () {
    // Given
    const a = 1.5;
    const b = 2.5;

    // When
    var result = add(a, b);

    // Then
    expect(result, 4.0);
  });
}
