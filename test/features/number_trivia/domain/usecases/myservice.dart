import 'package:dartz/dartz.dart';

class MyService {
  Future<Either<Failure, Success>> fetchData() async {
    try {
      String data = 'Dados recebidos';
      Success success = Success(data);
      return Right(success);
    } catch (error) {
      Failure failure = Failure(error.toString());
      return Left(failure);
    }
  }
}

class Success {
  final String message;

  Success(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Success && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class Failure {
  final String error;

  Failure(this.error);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
