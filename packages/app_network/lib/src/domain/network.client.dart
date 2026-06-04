import 'network.request.dart';
import 'network.response.dart';

abstract interface class NetworkClient {
  Future<NetworkResponse<T>> send<T>(NetworkRequest request);
}
