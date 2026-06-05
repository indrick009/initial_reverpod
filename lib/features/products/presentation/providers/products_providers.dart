import 'package:app_cache/app_cache.dart';
import 'package:app_network/app_network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../providers/app_core_providers.dart';
import '../../application/get_products_use_case.dart';
import '../../domain/config/products_config.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../../infrastructure/dummyjson/dummyjson_product_repository.dart';

final productsConfigProvider = Provider<ProductsConfig>((ref) {
  return ProductsConfig(baseUrl: Uri.parse('https://dummyjson.com'));
});

final productsNetworkClientProvider = Provider<NetworkClient>((ref) {
  final config = ref.watch(productsConfigProvider);

  return DioNetworkClient(baseUrl: config.baseUrl.toString());
});

final productsRequestCacheProvider = Provider<RequestCache>((ref) {
  return InMemoryRequestCache();
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return DummyJsonProductRepository(
    networkClient: ref.watch(productsNetworkClientProvider),
    requestCache: ref.watch(productsRequestCacheProvider),
    isolateWorker: ref.watch(isolateWorkerProvider),
  );
});

final getProductsUseCaseProvider = Provider<GetProductsUseCase>((ref) {
  return GetProductsUseCase(repository: ref.watch(productRepositoryProvider));
});

final productsControllerProvider =
    AsyncNotifierProvider<ProductsController, List<Product>>(
      ProductsController.new,
    );

final class ProductsController extends AsyncNotifier<List<Product>> {
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
