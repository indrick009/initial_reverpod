final class CachePolicy {
  const CachePolicy({this.ttl});

  const CachePolicy.forever() : ttl = null;

  final Duration? ttl;

  DateTime? expiresAt(DateTime createdAt) {
    final duration = ttl;

    if (duration == null) {
      return null;
    }

    return createdAt.add(duration);
  }
}
