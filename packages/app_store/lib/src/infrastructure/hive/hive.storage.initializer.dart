import 'package:hive/hive.dart';

import '../../domain/storage.failure.dart';
import '../../domain/storage.initializer.dart';
import 'hive.box.names.dart';

final class HiveStorageInitializer implements StorageInitializer {
  HiveStorageInitializer({
    required String storagePath,
    List<String> boxNames = const [HiveBoxNames.localKeyValue],
  }) : _storagePath = storagePath,
       _boxNames = List.unmodifiable(boxNames);

  final String _storagePath;
  final List<String> _boxNames;
  bool _isInitialized = false;

  @override
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      Hive.init(_storagePath);

      for (final boxName in _boxNames) {
        if (!Hive.isBoxOpen(boxName)) {
          await Hive.openBox<String>(boxName);
        }
      }

      _isInitialized = true;
    } catch (error, stackTrace) {
      throw StorageInitializationFailure(
        'Hive storage initialization failed.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> dispose() async {
    if (!_isInitialized) return;

    try {
      for (final boxName in _boxNames.reversed) {
        if (Hive.isBoxOpen(boxName)) {
          await Hive.box<String>(boxName).close();
        }
      }

      _isInitialized = false;
    } catch (error, stackTrace) {
      throw StorageInitializationFailure(
        'Hive storage disposal failed.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }
}
