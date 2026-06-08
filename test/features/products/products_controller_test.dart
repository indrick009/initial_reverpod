import 'dart:convert';

import 'package:app_config/app_config.dart';
import 'package:app_cache/app_cache.dart';
import 'package:app_network/app_network.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_riverpod/core/workers/isolate_worker.dart';
import 'package:test_riverpod/features/products/presentation/providers/products_providers.dart';
import 'package:test_riverpod/providers/app_core_providers.dart';

void main() {
  test('productsConfig derives its base URL from the global app config', () {
    final container = ProviderContainer(
      overrides: [
        appConfigProvider.overrideWithValue(
          AppConfig(
            environment: AppEnvironment.development,
            api: ApiConfig(baseUrl: Uri.parse('https://dummyjson.com')),
          ),
        ),
      ],
    );
    addTearDown(container.dispose);

    final config = container.read(productsConfigProvider);

    expect(config.baseUrl, Uri.parse('https://dummyjson.com'));
  });

  test(
    'ProductsController loads products through generated providers',
    () async {
      final container = ProviderContainer(
        overrides: [
          appConfigProvider.overrideWithValue(
            AppConfig(
              environment: AppEnvironment.development,
              api: ApiConfig(baseUrl: Uri.parse('https://dummyjson.com')),
            ),
          ),
          productsNetworkClientProvider.overrideWithValue(_FakeNetworkClient()),
          productsRequestCacheProvider.overrideWithValue(
            InMemoryRequestCache(),
          ),
          isolateWorkerProvider.overrideWithValue(const _InlineIsolateWorker()),
        ],
      );
      addTearDown(container.dispose);

      final products = await container.read(productsControllerProvider.future);

      expect(products, hasLength(1));
      expect(products.first.title, 'Essence Mascara Lash Princess');
    },
  );
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
  @override
  Future<NetworkResponse<T>> send<T>(NetworkRequest request) async {
    expect(request.responseBodyType, NetworkResponseBodyType.plainText);

    return NetworkResponse<T>(
      statusCode: 200,
      data:
          jsonEncode(<String, Object?>{
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
              })
              as T,
    );
  }
}
