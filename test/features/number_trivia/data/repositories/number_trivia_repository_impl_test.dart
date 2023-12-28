import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:resocoder/core/platform/network_info.dart';
import 'package:resocoder/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:resocoder/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:resocoder/features/number_trivia/domain/repositories/number_trivia_repository.dart';

import '../../domain/usecases/get_concrete_number_trivia_test.mocks.dart';
@GenerateNiceMocks([
  MockSpec<NumberTriviaRemoteDataSource>(),
  MockSpec<NumberTriviaLocalDataSource>(),
  MockSpec<NetworkInfo>()
])
import 'number_trivia_repository_impl_test.mocks.dart';

void main() {
  late NumberTriviaRepository numberTriviaRepository;
  late NumberTriviaRemoteDataSource mockRemoteDataSource;
  late NumberTriviaLocalDataSource mockLocalDataSource;
  late NetworkInfo mockNetworkInfo;

  setUp(() {
    numberTriviaRepository = MockNumberTriviaRepository();
    mockRemoteDataSource = MockNumberTriviaRemoteDataSource();
    mockLocalDataSource = MockNumberTriviaLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
  });

  testWidgets('number trivia repository impl ...', (tester) async {
    // TODO: Implement test
  });
}
