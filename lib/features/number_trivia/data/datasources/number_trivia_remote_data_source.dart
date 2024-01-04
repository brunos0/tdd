//import 'package:dartz/dartz.dart';
//import 'package:resocoder/core/error/failures.dart';
import 'dart:convert';
import 'dart:io';

import 'package:resocoder/core/error/exceptions.dart';
import 'package:resocoder/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:resocoder/features/number_trivia/domain/entities/number_trivia.dart';

import 'package:http/http.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  const NumberTriviaRemoteDataSourceImpl({required this.client});
  final Client client;

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) =>
      _getTriviaFromUrl(number.toString());

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() =>
      _getTriviaFromUrl('random');

  Future<NumberTriviaModel> _getTriviaFromUrl(String url) async {
    final response = await client.get(Uri.parse('http://numbersapi.com/$url'),
        headers: {'Content-Type:': 'application/json'});
    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
