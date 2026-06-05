import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/product.dart';
import '../providers/products_providers.dart';
import '../widgets/product_image.dart';

final class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Produits')),
      body: products.when(
        data: (items) => _ProductsList(products: items),
        error: (error, stackTrace) => _ProductsError(
          message: error.toString(),
          onRetry: () =>
              ref.read(productsControllerProvider.notifier).refresh(),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

final class _ProductsList extends ConsumerWidget {
  const _ProductsList({required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () => ref.read(productsControllerProvider.notifier).refresh(),
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return _ProductTile(product: products[index]);
        },
      ),
    );
  }
}

final class _ProductTile extends StatelessWidget {
  const _ProductTile({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      contentPadding: const EdgeInsets.all(12),
      leading: ProductImage(url: product.thumbnail),
      title: Text(product.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        '${product.category} - stock ${product.stock} - note ${product.rating}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        '\$${product.price.toStringAsFixed(2)}',
        style: theme.textTheme.titleMedium,
      ),
    );
  }
}

final class _ProductsError extends StatelessWidget {
  const _ProductsError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton(onPressed: onRetry, child: const Text('Reessayer')),
          ],
        ),
      ),
    );
  }
}
