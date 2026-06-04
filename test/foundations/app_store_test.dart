import 'package:app_store/app_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InMemoryLocalKeyValueStore', () {
    test('writes, reads, checks and deletes values', () async {
      final store = InMemoryLocalKeyValueStore();

      await store.writeString(key: 'cart', value: 'active');

      expect(await store.readString('cart'), 'active');
      expect(await store.containsKey('cart'), isTrue);

      await store.delete('cart');

      expect(await store.readString('cart'), isNull);
      expect(await store.containsKey('cart'), isFalse);
    });
  });

  group('StorageBootstrapper', () {
    test('initializes and disposes initializers in order', () async {
      final events = <String>[];
      final bootstrapper = StorageBootstrapper(
        initializers: [
          _FakeStorageInitializer('first', events),
          _FakeStorageInitializer('second', events),
        ],
      );

      await bootstrapper.initialize();
      await bootstrapper.dispose();

      expect(bootstrapper.isInitialized, isFalse);
      expect(events, [
        'initialize:first',
        'initialize:second',
        'dispose:second',
        'dispose:first',
      ]);
    });
  });
}

final class _FakeStorageInitializer implements StorageInitializer {
  _FakeStorageInitializer(this.name, this.events);

  final String name;
  final List<String> events;

  @override
  Future<void> initialize() async {
    events.add('initialize:$name');
  }

  @override
  Future<void> dispose() async {
    events.add('dispose:$name');
  }
}
