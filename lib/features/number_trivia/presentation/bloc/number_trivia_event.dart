import 'package:equatable/equatable.dart';

abstract class NumberTriviaEvent extends Equatable {
  const NumberTriviaEvent(List<Object?> props);
}

class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  GetTriviaForConcreteNumber(this.numberString) : super([numberString]);

  final String numberString;

  @override
  List<Object?> get props => [numberString];
}

class GetTriviaForRandomNumber extends NumberTriviaEvent {
  GetTriviaForRandomNumber() : super([]);

  @override
  List<Object?> get props => [];
}
