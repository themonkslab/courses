import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

main() {
  test(
      'Given two integers 2 and 1, when 1 is subtracted from 2, then the result should be 1',
      () {
    // GIVEN
    const a = 1;
    const b = 2;

    // WHEN
    var result = substract(a, b);

    // THEN
    expect(result, 1);
  });

  test(
      'Given two integers 2 and 2, when 2 is subtracted from 2, then the result should be 0',
      () {
    // GIVEN
    const a = 2;
    const b = 2;

    // WHEN
    var result = substract(a, b);

    // THEN
    expect(result, 0);
  });

  test(
      'Given two integers 2 and 3, when 3 is subtracted from 2, then the result should be -1',
      () {
    // GIVEN
    const a = 3;
    const b = 2;

    // WHEN
    var result = substract(a, b);

    // THEN
    expect(result, -1);
  });

  test(
      'Given two integers -2 and -1, when -1 is subtracted from -2, then the result should be -3',
      () {
    // GIVEN
    const a = -1;
    const b = -2;

    // WHEN
    var result = substract(a, b);

    // THEN
    expect(result, -1);
  });

  test(
      'Given two numbers 2 and 1.5, when 1.5 is subtracted from 2, then the result should be 0.5',
      () {
    // GIVEN
    const a = 1.5;
    const b = 2;

    // WHEN
    var result = substract(a, b);

    // THEN
    expect(result, 0.5);
  });
}
