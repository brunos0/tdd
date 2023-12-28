import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'myservice.dart';

@GenerateNiceMocks([MockSpec<MyService>()])
import 'teste_test.mocks.dart';

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

//class MockMyService extends Mock implements MyService {}

void main() {
  late MockMyService mockMyService;

  setUp(() {
    mockMyService = MockMyService();
  });

  test('should return Success when fetchData is called', () async {
    // Arrange
    Success success = Success(
        //
        //'Success!'
        'Dados recebidos'); // Supondo que Success é uma classe que você definiu
    // Act
    // when( mockMyService.fetchData())     //mocktail
    // when(() =>mockMyService.fetchData()) //mocktail
    when(mockMyService.fetchData()) //mockito
        //.thenAnswer(Right<Failure, Success>(success) );
        //.thenReturn(() async =>  Future<Either<Failure, Success>>.value( return Right(success)));
        .thenAnswer((_) async => Right(success));

    //final result = await MyService().fetchData();
    final result = await mockMyService.fetchData();

    // Assert
    expect(result, Right<Failure, Success>(success));
  });
}
