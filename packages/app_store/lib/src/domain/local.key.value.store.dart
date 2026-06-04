abstract interface class LocalKeyValueStore {
  Future<void> writeString({required String key, required String value});

  Future<String?> readString(String key);

  Future<void> delete(String key);

  Future<bool> containsKey(String key);

  Future<void> clear();
}
