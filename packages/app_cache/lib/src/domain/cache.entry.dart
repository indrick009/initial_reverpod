final class CacheEntry<Value extends Object> {
  const CacheEntry({
    required this.value,
    required this.createdAt,
    this.expiresAt,
  });

  final Value value;
  final DateTime createdAt;
  final DateTime? expiresAt;

  bool isExpired(DateTime now) {
    final expiration = expiresAt;

    if (expiration == null) {
      return false;
    }

    return !now.isBefore(expiration);
  }
}
