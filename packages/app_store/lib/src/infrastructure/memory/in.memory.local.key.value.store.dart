import '../../domain/local.key.value.store.dart';

final class InMemoryLocalKeyValueStore implements LocalKeyValueStore {
  InMemoryLocalKeyValueStore({Map<String, String>? values})
    : _values = values ?? <String, String>{};

  final Map<String, String> _values;

  @override
  Future<void> writeString({required String key, required String value}) async {
    _values[key] = value;
  }

  @override
  Future<String?> readString(String key) async {
    return _values[key];
  }

  @override
  Future<void> delete(String key) async {
    _values.remove(key);
  }

  @override
  Future<bool> containsKey(String key) async {
    return _values.containsKey(key);
  }

  @override
  Future<void> clear() async {
    _values.clear();
  }
}
