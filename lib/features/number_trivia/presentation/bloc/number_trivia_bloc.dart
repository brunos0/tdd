//import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:resocoder/core/util/input_converter.dart';
import 'package:resocoder/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:resocoder/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:resocoder/features/number_trivia/presentation/bloc/number_trivia_event.dart';
import 'package:resocoder/features/number_trivia/presentation/bloc/number_trivia_state.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';
const String invalidInputFailureMessage =
    'Invalid Input - The number must be a positive integer or zero.';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  NumberTriviaBloc({
    required this.getConcreteNumberTrivia,
    required this.getRandomNumbertrivia,
    required this.inputConverter,
  }) : super(Empty()) {
    on<NumberTriviaEvent>(
        (NumberTriviaEvent event, Emitter<NumberTriviaState> emit) async {
      if (event is GetTriviaForConcreteNumber) {
        final inputEither =
            inputConverter.stringToUnsignedInteger(event.numberString);
        //emit(Error(message: invalidInputFailureMessage));

        inputEither.fold((failure) async {
          emit(Error(message: invalidInputFailureMessage));
        }, (success) {});
      }
    });
  }

  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumbertrivia getRandomNumbertrivia;
  final InputConverter inputConverter;
}
