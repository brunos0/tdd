//import 'package:dartz/dartz.dart';
//import 'package:resocoder/core/error/failures.dart';
import 'package:resocoder/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTrivia> getConcreteNumberTrivia(int number);
  Future<NumberTrivia> getRandomNumberTrivia();
}
