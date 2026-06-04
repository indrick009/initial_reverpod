import 'package:flutter/widgets.dart';

import 'asset_preload_group.dart';

abstract interface class AssetPreloader {
  Future<void> preload(
    BuildContext context, {
    required AssetPreloadGroup group,
  });
}
