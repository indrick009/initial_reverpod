import 'package:app_cache/app_cache.dart';
import 'package:app_network/app_network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../providers/app_core_providers.dart';
import '../../application/get_products_use_case.dart';
import '../../domain/config/products_config.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../../infrastructure/dummyjson/dummyjson_product_repository.dart';

part 'products_providers.g.dart';

@Riverpod(keepAlive: true)
ProductsConfig productsConfig(Ref ref) {
  final appConfig = ref.watch(appConfigProvider);

  return ProductsConfig(baseUrl: appConfig.api.baseUrl);
}

@Riverpod(keepAlive: true)
NetworkClient productsNetworkClient(Ref ref) {
  final appConfig = ref.watch(appConfigProvider);
  final config = ref.watch(productsConfigProvider);

  return DioNetworkClient(
    baseUrl: config.baseUrl.toString(),
    connectTimeout: appConfig.api.connectTimeout,
    receiveTimeout: appConfig.api.receiveTimeout,
    sendTimeout: appConfig.api.sendTimeout,
  );
}

@Riverpod(keepAlive: true)
RequestCache productsRequestCache(Ref ref) {
  return InMemoryRequestCache();
}

@Riverpod(keepAlive: true)
ProductRepository productRepository(Ref ref) {
  return DummyJsonProductRepository(
    networkClient: ref.watch(productsNetworkClientProvider),
    requestCache: ref.watch(productsRequestCacheProvider),
    isolateWorker: ref.watch(isolateWorkerProvider),
  );
}

@Riverpod(keepAlive: true)
GetProductsUseCase getProductsUseCase(Ref ref) {
  return GetProductsUseCase(repository: ref.watch(productRepositoryProvider));
}

Duration? _noRetry(int retryCount, Object error) => null;

@Riverpod(keepAlive: true, retry: _noRetry)
final class ProductsController extends _$ProductsController {
  @override
  Future<List<Product>> build() {
    return ref.watch(getProductsUseCaseProvider)(const NoParams());
  }

  Future<void> refresh() async {
    state = const AsyncLoading<List<Product>>();
    state = await AsyncValue.guard(
      () => ref.read(getProductsUseCaseProvider)(const NoParams()),
    );
  }
}
