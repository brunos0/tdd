import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:resocoder/core/network/network_info.dart';

@GenerateNiceMocks([MockSpec<InternetConnection>()])
import 'network_info_test.mocks.dart';

void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockInternetConnection mockInternetConnection;

  setUp(() {
    mockInternetConnection = MockInternetConnection();
    networkInfoImpl = NetworkInfoImpl(mockInternetConnection);
  });

  group('isConnected', () {
    test('should forward the call to InternetConnection.hasInternetAccess',
        () async {
      //arrange
      final tHasInternetAccessFuture = Future.value(true);

      when(mockInternetConnection.hasInternetAccess)
          .thenAnswer((_) => tHasInternetAccessFuture);
      //act
      final result = networkInfoImpl.isConnected;
      //assert
      verify(mockInternetConnection.hasInternetAccess);
      expect(result, tHasInternetAccessFuture);
    });
  });
}
