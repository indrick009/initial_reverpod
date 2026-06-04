abstract interface class StorageInitializer {
  Future<void> initialize();

  Future<void> dispose();
}
