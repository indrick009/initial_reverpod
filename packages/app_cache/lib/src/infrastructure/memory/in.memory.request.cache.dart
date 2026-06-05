import '../../application/request.cache.dart';
import '../../domain/cache.policy.dart';
import '../../domain/cache.store.dart';
import 'in.memory.cache.store.dart';

final class InMemoryRequestCache implements RequestCache {
  InMemoryRequestCache({CacheStore? store})
    : _store = store ?? InMemoryCacheStore();

  final CacheStore _store;

  @override
  Future<Value?> read<Value extends Object>(String key) {
    return _store.read<Value>(key);
  }

  @override
  Future<void> write<Value extends Object>(
    String key,
    Value value, {
    CachePolicy policy = const CachePolicy.forever(),
  }) {
    return _store.write(key, value, policy: policy);
  }

  @override
  Future<void> delete(String key) {
    return _store.delete(key);
  }

  @override
  Future<void> clear() {
    return _store.clear();
  }
}
