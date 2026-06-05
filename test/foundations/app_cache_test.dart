import 'package:app_cache/app_cache.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('InMemoryCacheStore writes and reads values', () async {
    final cache = InMemoryCacheStore();

    await cache.write('user:1', 'Crina');

    expect(await cache.read<String>('user:1'), 'Crina');
    expect(await cache.contains('user:1'), isTrue);
  });

  test('InMemoryCacheStore removes expired values on read', () async {
    var now = DateTime(2026);
    final cache = InMemoryCacheStore(now: () => now);

    await cache.write(
      'request:home',
      'payload',
      policy: const CachePolicy(ttl: Duration(minutes: 5)),
    );

    now = now.add(const Duration(minutes: 6));

    expect(await cache.read<String>('request:home'), isNull);
    expect(await cache.contains('request:home'), isFalse);
  });

  test('InMemoryCacheStore can delete and clear values', () async {
    final cache = InMemoryCacheStore();

    await cache.write('a', 'A');
    await cache.write('b', 'B');
    await cache.delete('a');

    expect(await cache.contains('a'), isFalse);
    expect(await cache.contains('b'), isTrue);

    await cache.clear();

    expect(await cache.contains('b'), isFalse);
  });
}
