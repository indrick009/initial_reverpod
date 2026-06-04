abstract interface class SecureKeyValueStore {
  Future<void> writeSecret({required String key, required String value});

  Future<String?> readSecret(String key);

  Future<void> deleteSecret(String key);

  Future<bool> containsSecret(String key);

  Future<void> clearSecrets();
}
