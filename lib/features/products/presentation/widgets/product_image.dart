import 'package:flutter/material.dart';

final class ProductImage extends StatelessWidget {
  const ProductImage({required this.url, this.size = 56, super.key});

  final Uri url;
  final double size;

  @override
  Widget build(BuildContext context) {
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final cacheSize = (size * devicePixelRatio).round();

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        url.toString(),
        width: size,
        height: size,
        fit: BoxFit.cover,
        cacheWidth: cacheSize,
        cacheHeight: cacheSize,
        gaplessPlayback: true,
        filterQuality: FilterQuality.low,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded || frame != null) {
            return child;
          }

          return _ProductImagePlaceholder(size: size);
        },
        errorBuilder: (context, error, stackTrace) {
          return _ProductImagePlaceholder(
            size: size,
            icon: Icons.image_not_supported_outlined,
          );
        },
      ),
    );
  }
}

final class _ProductImagePlaceholder extends StatelessWidget {
  const _ProductImagePlaceholder({required this.size, this.icon});

  final double size;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final placeholderIcon = icon;

    return SizedBox.square(
      dimension: size,
      child: ColoredBox(
        color: const Color(0xFFE5E7EB),
        child: placeholderIcon == null ? null : Icon(placeholderIcon),
      ),
    );
  }
}
