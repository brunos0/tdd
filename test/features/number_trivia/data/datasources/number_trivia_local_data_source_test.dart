import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:resocoder/core/error/exceptions.dart';
import 'package:resocoder/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:resocoder/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../fixtures/fixture_reader.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
import 'number_trivia_local_data_source_test.mocks.dart';

void main() {
  late NumberTriviaLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = NumberTriviaLocalDataSourceImpl(
        sharedPreferences: mockSharedPreferences);
  });

  group('getLastNumberTrivia', () {
    test(
        'should return NumberTrivia from SharedPreferences when there is on in the cache',
        () async {
      final tNumberTriviaModel = NumberTriviaModel.fromJson(
          json.decode(fixture('trivia_cached.json')));
      //arrange
      when(mockSharedPreferences.getString(sharedPrefKey))
          .thenReturn(fixture('trivia_cached.json'));
      //act
      final result = await dataSource.getLastNumberTrivia();
      //assert
      verify(mockSharedPreferences.getString(sharedPrefKey));
      expect(result, equals(tNumberTriviaModel));
    });

    test('should throw a CacheException when there is not a cache value',
        () async {
      when(mockSharedPreferences.getString(sharedPrefKey)).thenReturn(null);
      //act
      final call = dataSource.getLastNumberTrivia;
      //assert
      expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
    });
  });

  group('cacheNumberTrivia', () {
    const tNumberTriviaModel = NumberTriviaModel(text: 'test text', number: 1);
    test('should call SharedPreferences to cache the data', () async {
      final tNumberTriviaModel = NumberTriviaModel.fromJson(
          json.decode(fixture('trivia_cached.json')));

      //act
      dataSource.cacheNumberTrivia(tNumberTriviaModel);
      //assert
      final expectedJsonString = json.encode(tNumberTriviaModel);
      verify(
          mockSharedPreferences.setString(sharedPrefKey, expectedJsonString));
    });
  });
}
