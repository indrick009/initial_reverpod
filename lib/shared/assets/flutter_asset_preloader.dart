import 'package:flutter/widgets.dart';

import 'asset_preload_group.dart';
import 'asset_preloader.dart';

final class FlutterAssetPreloader implements AssetPreloader {
  const FlutterAssetPreloader({
    List<ImageProvider> onboardingImages = const <ImageProvider>[],
  }) : _onboardingImages = onboardingImages;

  final List<ImageProvider> _onboardingImages;

  @override
  Future<void> preload(
    BuildContext context, {
    required AssetPreloadGroup group,
  }) async {
    final images = switch (group) {
      AssetPreloadGroup.onboarding => _onboardingImages,
    };

    await Future.wait(images.map((image) => precacheImage(image, context)));
  }
}
