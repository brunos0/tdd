import 'package:dartz/dartz.dart';
import 'package:resocoder/core/util/input_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', () {
    test(
        'should return a integer when the string representes an unsigned integer',
        () {
      //arrange
      const str = '123';
      //act
      var result = inputConverter.stringToUnsignedInteger(str);
      //assert
      expect(result, const Right(123));
    });
  });

  group('stringToUnsignedInt', () {
    test('should return a failure when the string is not an integer', () {
      //arrange
      const str = 'abc';
      //act
      var result = inputConverter.stringToUnsignedInteger(str);
      //assert
      expect(result, Left(InvalidInputFailure()));
    });
  });

  group('stringToUnsignedInt', () {
    test('should return a failure when the string a negative integer', () {
      //arrange
      const str = '-123';
      //act
      var result = inputConverter.stringToUnsignedInteger(str);
      //assert
      expect(result, Left(InvalidInputFailure()));
    });
  });
}
