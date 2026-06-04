import '../../domain/secure.key.value.store.dart';

final class InMemorySecureKeyValueStore implements SecureKeyValueStore {
  InMemorySecureKeyValueStore({Map<String, String>? secrets})
    : _secrets = secrets ?? <String, String>{};

  final Map<String, String> _secrets;

  @override
  Future<void> writeSecret({required String key, required String value}) async {
    _secrets[key] = value;
  }

  @override
  Future<String?> readSecret(String key) async {
    return _secrets[key];
  }

  @override
  Future<void> deleteSecret(String key) async {
    _secrets.remove(key);
  }

  @override
  Future<bool> containsSecret(String key) async {
    return _secrets.containsKey(key);
  }

  @override
  Future<void> clearSecrets() async {
    _secrets.clear();
  }
}
