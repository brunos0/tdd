import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:resocoder/core/error/failures.dart';
import 'package:resocoder/core/usecases/usecase.dart';
import 'package:resocoder/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:resocoder/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetRandomNumbertrivia implements UseCase<NumberTrivia, NoParams> {
  GetRandomNumbertrivia(this.repository);
  final NumberTriviaRepository repository;

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}
