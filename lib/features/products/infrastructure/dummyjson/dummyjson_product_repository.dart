import 'package:app_cache/app_cache.dart';
import 'package:app_network/app_network.dart';

import '../../../../core/workers/isolate_worker.dart';
import '../../domain/entities/product.dart';
import '../../domain/failures/product_failure.dart';
import '../../domain/repositories/product_repository.dart';
import 'dummyjson_products_parser.dart';

final class DummyJsonProductRepository implements ProductRepository {
  const DummyJsonProductRepository({
    required NetworkClient networkClient,
    required RequestCache requestCache,
    required IsolateWorker isolateWorker,
  }) : _networkClient = networkClient,
       _requestCache = requestCache,
       _isolateWorker = isolateWorker;

  static const _cacheKey = 'dummyjson.products';

  final NetworkClient _networkClient;
  final RequestCache _requestCache;
  final IsolateWorker _isolateWorker;

  @override
  Future<List<Product>> getProducts() async {
    final cachedProducts = await _requestCache.read<List<Product>>(_cacheKey);

    if (cachedProducts != null) {
      return cachedProducts;
    }

    try {
      final response = await _networkClient.send<String>(
        const NetworkRequest(
          method: HttpMethod.get,
          path: '/products',
          responseBodyType: NetworkResponseBodyType.plainText,
        ),
      );

      final products = await _isolateWorker.run(
        parseDummyJsonProductsJson,
        response.data,
      );

      await _requestCache.write(
        _cacheKey,
        products,
        policy: const CachePolicy(ttl: Duration(minutes: 5)),
      );

      return products;
    } on ProductFailure {
      rethrow;
    } catch (error, stackTrace) {
      throw ProductLoadFailure(
        'Unable to load products.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }
}
