import 'package:flutter/painting.dart';

final class AppImageCacheConfig {
  const AppImageCacheConfig._();

  static void configureForEcommerce() {
    final imageCache = PaintingBinding.instance.imageCache;

    imageCache.maximumSize = 300;
    imageCache.maximumSizeBytes = 120 << 20;
  }
}
