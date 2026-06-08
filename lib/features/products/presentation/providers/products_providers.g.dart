// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(productsConfig)
final productsConfigProvider = ProductsConfigProvider._();

final class ProductsConfigProvider
    extends $FunctionalProvider<ProductsConfig, ProductsConfig, ProductsConfig>
    with $Provider<ProductsConfig> {
  ProductsConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsConfigProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsConfigHash();

  @$internal
  @override
  $ProviderElement<ProductsConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProductsConfig create(Ref ref) {
    return productsConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductsConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductsConfig>(value),
    );
  }
}

String _$productsConfigHash() => r'c12dc36d538e2b986ea4b9fd8a0aa325a8f13879';

@ProviderFor(productsNetworkClient)
final productsNetworkClientProvider = ProductsNetworkClientProvider._();

final class ProductsNetworkClientProvider
    extends $FunctionalProvider<NetworkClient, NetworkClient, NetworkClient>
    with $Provider<NetworkClient> {
  ProductsNetworkClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsNetworkClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsNetworkClientHash();

  @$internal
  @override
  $ProviderElement<NetworkClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NetworkClient create(Ref ref) {
    return productsNetworkClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkClient>(value),
    );
  }
}

String _$productsNetworkClientHash() =>
    r'6b82217e37ddab1d7a58b62fdb5c72fbc587140e';

@ProviderFor(productsRequestCache)
final productsRequestCacheProvider = ProductsRequestCacheProvider._();

final class ProductsRequestCacheProvider
    extends $FunctionalProvider<RequestCache, RequestCache, RequestCache>
    with $Provider<RequestCache> {
  ProductsRequestCacheProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsRequestCacheProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsRequestCacheHash();

  @$internal
  @override
  $ProviderElement<RequestCache> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RequestCache create(Ref ref) {
    return productsRequestCache(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RequestCache value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RequestCache>(value),
    );
  }
}

String _$productsRequestCacheHash() =>
    r'32f3e00f7ad1fb82f50ecc9aa7537781b3ed1019';

@ProviderFor(productRepository)
final productRepositoryProvider = ProductRepositoryProvider._();

final class ProductRepositoryProvider
    extends
        $FunctionalProvider<
          ProductRepository,
          ProductRepository,
          ProductRepository
        >
    with $Provider<ProductRepository> {
  ProductRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProductRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductRepository create(Ref ref) {
    return productRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductRepository>(value),
    );
  }
}

String _$productRepositoryHash() => r'0de6ede6686f473e1100b50c823e40e729514023';

@ProviderFor(getProductsUseCase)
final getProductsUseCaseProvider = GetProductsUseCaseProvider._();

final class GetProductsUseCaseProvider
    extends
        $FunctionalProvider<
          GetProductsUseCase,
          GetProductsUseCase,
          GetProductsUseCase
        >
    with $Provider<GetProductsUseCase> {
  GetProductsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProductsUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProductsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetProductsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProductsUseCase create(Ref ref) {
    return getProductsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProductsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProductsUseCase>(value),
    );
  }
}

String _$getProductsUseCaseHash() =>
    r'6e6fb79c661c5ad4bc84f28aad39e492643a8902';

@ProviderFor(ProductsController)
final productsControllerProvider = ProductsControllerProvider._();

final class ProductsControllerProvider
    extends $AsyncNotifierProvider<ProductsController, List<Product>> {
  ProductsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: _noRetry,
        name: r'productsControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsControllerHash();

  @$internal
  @override
  ProductsController create() => ProductsController();
}

String _$productsControllerHash() =>
    r'b91a6919efe913fd0a3985f82c186cca3bcc3b18';

abstract class _$ProductsController extends $AsyncNotifier<List<Product>> {
  FutureOr<List<Product>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Product>>, List<Product>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Product>>, List<Product>>,
              AsyncValue<List<Product>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
