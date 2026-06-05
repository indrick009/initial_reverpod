import 'cache.entry.dart';
import 'cache.policy.dart';

abstract interface class CacheStore {
  Future<Value?> read<Value extends Object>(String key);

  Future<CacheEntry<Value>?> readEntry<Value extends Object>(String key);

  Future<void> write<Value extends Object>(
    String key,
    Value value, {
    CachePolicy policy,
  });

  Future<bool> contains(String key);

  Future<void> delete(String key);

  Future<void> clear();
}
