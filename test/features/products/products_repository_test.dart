import 'package:app_cache/app_cache.dart';
import 'package:app_network/app_network.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_riverpod/core/workers/isolate_worker.dart';
import 'package:test_riverpod/features/products/infrastructure/dummyjson/dummyjson_product_repository.dart';

void main() {
  test('DummyJsonProductRepository loads products and reuses cache', () async {
    final networkClient = _FakeNetworkClient();
    final repository = DummyJsonProductRepository(
      networkClient: networkClient,
      requestCache: InMemoryRequestCache(),
      isolateWorker: const _InlineIsolateWorker(),
    );

    final firstProducts = await repository.getProducts();
    final secondProducts = await repository.getProducts();

    expect(firstProducts, hasLength(1));
    expect(firstProducts.first.title, 'Essence Mascara Lash Princess');
    expect(secondProducts, same(firstProducts));
    expect(networkClient.calls, 1);
  });
}

final class _InlineIsolateWorker implements IsolateWorker {
  const _InlineIsolateWorker();

  @override
  Future<Result> run<Message, Result>(
    ComputeCallback<Message, Result> callback,
    Message message,
  ) async {
    return callback(message);
  }
}

final class _FakeNetworkClient implements NetworkClient {
  var calls = 0;

  @override
  Future<NetworkResponse<T>> send<T>(NetworkRequest request) async {
    calls++;

    expect(request.method, HttpMethod.get);
    expect(request.path, '/products');

    return NetworkResponse<T>(
      statusCode: 200,
      data:
          <String, Object?>{
                'products': [
                  <String, Object?>{
                    'id': 1,
                    'title': 'Essence Mascara Lash Princess',
                    'description': 'Volumizing mascara.',
                    'category': 'beauty',
                    'price': 9.99,
                    'rating': 2.56,
                    'stock': 99,
                    'thumbnail':
                        'https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp',
                  },
                ],
              }
              as T,
    );
  }
}
