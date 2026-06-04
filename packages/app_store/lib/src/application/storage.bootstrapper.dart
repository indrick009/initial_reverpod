import '../domain/storage.failure.dart';
import '../domain/storage.initializer.dart';

final class StorageBootstrapper {
  StorageBootstrapper({required List<StorageInitializer> initializers})
    : _initializers = List.unmodifiable(initializers);

  final List<StorageInitializer> _initializers;
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      for (final initializer in _initializers) {
        await initializer.initialize();
      }

      _isInitialized = true;
    } on StorageFailure {
      rethrow;
    } catch (error, stackTrace) {
      throw StorageInitializationFailure(
        'Storage initialization failed.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> dispose() async {
    if (!_isInitialized) return;

    try {
      for (final initializer in _initializers.reversed) {
        await initializer.dispose();
      }

      _isInitialized = false;
    } on StorageFailure {
      rethrow;
    } catch (error, stackTrace) {
      throw StorageInitializationFailure(
        'Storage disposal failed.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }
}
