import '../domain/cache.policy.dart';

abstract interface class RequestCache {
  Future<Value?> read<Value extends Object>(String key);

  Future<void> write<Value extends Object>(
    String key,
    Value value, {
    CachePolicy policy,
  });

  Future<void> delete(String key);

  Future<void> clear();
}
