//import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:resocoder/core/util/input_converter.dart';
import 'package:resocoder/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:resocoder/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:resocoder/features/number_trivia/presentation/bloc/number_trivia_event.dart';
import 'package:resocoder/features/number_trivia/presentation/bloc/number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  NumberTriviaBloc({
    required this.getConcreteNumberTrivia,
    required this.getRandomNumbertrivia,
    required this.inputConverter,
  }) : super(Empty()) {
    on<NumberTriviaEvent>((event, emit) {
      if (event is GetTriviaForConcreteNumber) {
        inputConverter.stringToUnsignedInteger(event.numberString);
      }
    });
  }

  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumbertrivia getRandomNumbertrivia;
  final InputConverter inputConverter;
}