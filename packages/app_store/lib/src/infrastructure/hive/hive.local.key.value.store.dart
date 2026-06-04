import 'package:hive/hive.dart';

import '../../domain/local.key.value.store.dart';
import '../../domain/storage.failure.dart';
import 'hive.box.names.dart';

final class HiveLocalKeyValueStore implements LocalKeyValueStore {
  HiveLocalKeyValueStore({String boxName = HiveBoxNames.localKeyValue})
    : _boxName = boxName;

  final String _boxName;

  Box<String> get _box {
    try {
      return Hive.box<String>(_boxName);
    } catch (error, stackTrace) {
      throw StorageReadFailure(
        'Hive box "$_boxName" is not open.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> writeString({required String key, required String value}) async {
    try {
      await _box.put(key, value);
    } catch (error, stackTrace) {
      throw StorageWriteFailure(
        'Failed to write local value for key "$key".',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<String?> readString(String key) async {
    try {
      return _box.get(key);
    } catch (error, stackTrace) {
      throw StorageReadFailure(
        'Failed to read local value for key "$key".',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _box.delete(key);
    } catch (error, stackTrace) {
      throw StorageDeleteFailure(
        'Failed to delete local value for key "$key".',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<bool> containsKey(String key) async {
    try {
      return _box.containsKey(key);
    } catch (error, stackTrace) {
      throw StorageReadFailure(
        'Failed to check local value for key "$key".',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> clear() async {
    try {
      await _box.clear();
    } catch (error, stackTrace) {
      throw StorageDeleteFailure(
        'Failed to clear local values.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }
}
