import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:resocoder/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:resocoder/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'xpto da vida');

  test('should be a subclass of NumberTrivia entity', () async {
    //assert
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON number is an integer',
        () async {
      //arrange
      final jsonMap = json.decode(fixture('trivia.json'));
      //act
      final result = NumberTriviaModel.fromJson(jsonMap);
      //assert
      expect(result, equals(tNumberTriviaModel));
    });
  });

  group('fromJson', () {
    test('should return a valid model when the JSON number is an double',
        () async {
      //arrange
      final jsonMap = json.decode(fixture('trivia_double.json'));
      //act
      final result = NumberTriviaModel.fromJson(jsonMap);
      //assert
      expect(result, equals(tNumberTriviaModel));
    });
  });

  group('toJson', () {
    test('should return a Json Map containing the proper data', () async {
      //act
      final result = tNumberTriviaModel.toJson();
      //assert
      final expectedMap = {"text": "xpto da vida", "number": 1};
      expect(result, expectedMap);
    });
  });
}
//1e+40