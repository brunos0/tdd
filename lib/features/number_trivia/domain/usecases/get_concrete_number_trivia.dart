import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:resocoder/core/error/failures.dart';
import 'package:resocoder/core/usecases/usecase.dart';
import 'package:resocoder/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:resocoder/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  GetConcreteNumberTrivia(this.repository);
  final NumberTriviaRepository repository;

  @override
  Future<Either<Failure, NumberTrivia>> /*execute*/ call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  const Params({required this.number});
  final int number;

  @override
  List<Object?> get props => throw UnimplementedError();
}
