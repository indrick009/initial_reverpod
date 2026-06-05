import '../../domain/cache.entry.dart';
import '../../domain/cache.policy.dart';
import '../../domain/cache.store.dart';

final class InMemoryCacheStore implements CacheStore {
  InMemoryCacheStore({DateTime Function()? now}) : _now = now ?? DateTime.now;

  final DateTime Function() _now;
  final Map<String, CacheEntry<Object>> _entries = {};

  @override
  Future<Value?> read<Value extends Object>(String key) async {
    final entry = await readEntry<Value>(key);

    return entry?.value;
  }

  @override
  Future<CacheEntry<Value>?> readEntry<Value extends Object>(String key) async {
    final entry = _entries[key];

    if (entry == null) {
      return null;
    }

    if (entry.isExpired(_now())) {
      _entries.remove(key);
      return null;
    }

    final value = entry.value;

    if (value is! Value) {
      return null;
    }

    return CacheEntry<Value>(
      value: value,
      createdAt: entry.createdAt,
      expiresAt: entry.expiresAt,
    );
  }

  @override
  Future<void> write<Value extends Object>(
    String key,
    Value value, {
    CachePolicy policy = const CachePolicy.forever(),
  }) async {
    final createdAt = _now();

    _entries[key] = CacheEntry<Object>(
      value: value,
      createdAt: createdAt,
      expiresAt: policy.expiresAt(createdAt),
    );
  }

  @override
  Future<bool> contains(String key) async {
    final entry = _entries[key];

    if (entry == null) {
      return false;
    }

    if (entry.isExpired(_now())) {
      _entries.remove(key);
      return false;
    }

    return true;
  }

  @override
  Future<void> delete(String key) async {
    _entries.remove(key);
  }

  @override
  Future<void> clear() async {
    _entries.clear();
  }
}
