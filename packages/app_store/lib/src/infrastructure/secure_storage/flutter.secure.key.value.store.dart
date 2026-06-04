import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/secure.key.value.store.dart';
import '../../domain/storage.failure.dart';

final class FlutterSecureKeyValueStore implements SecureKeyValueStore {
  FlutterSecureKeyValueStore({FlutterSecureStorage? secureStorage})
    : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _secureStorage;

  @override
  Future<void> writeSecret({required String key, required String value}) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (error, stackTrace) {
      throw StorageWriteFailure(
        'Failed to write secure value for key "$key".',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<String?> readSecret(String key) async {
    try {
      return _secureStorage.read(key: key);
    } catch (error, stackTrace) {
      throw StorageReadFailure(
        'Failed to read secure value for key "$key".',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> deleteSecret(String key) async {
    try {
      await _secureStorage.delete(key: key);
    } catch (error, stackTrace) {
      throw StorageDeleteFailure(
        'Failed to delete secure value for key "$key".',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<bool> containsSecret(String key) async {
    try {
      return _secureStorage.containsKey(key: key);
    } catch (error, stackTrace) {
      throw StorageReadFailure(
        'Failed to check secure value for key "$key".',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> clearSecrets() async {
    try {
      await _secureStorage.deleteAll();
    } catch (error, stackTrace) {
      throw StorageDeleteFailure(
        'Failed to clear secure values.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }
}
