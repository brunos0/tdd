import 'package:equatable/equatable.dart';
import 'package:resocoder/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Empty extends NumberTriviaState {}

class Loading extends NumberTriviaState {}

class Loaded extends NumberTriviaState {
  Loaded({required this.trivia});
  final NumberTrivia trivia;

  @override
  List<Object?> get props => [trivia];
}

class Error extends NumberTriviaState {
  Error({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
