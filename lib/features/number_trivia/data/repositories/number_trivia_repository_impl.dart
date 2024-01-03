import 'package:dartz/dartz.dart';
import 'package:resocoder/core/error/failures.dart';
import 'package:resocoder/core/platform/network_info.dart';
import 'package:resocoder/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:resocoder/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:resocoder/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:resocoder/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  const NumberTriviaRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.getConcreteNumberTrivia(number));
    //Right(await NumberTrivia(number: 1, text: ''));
    // throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    throw UnimplementedError();
  }
}
