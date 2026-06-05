import 'package:flutter_test/flutter_test.dart';
import 'package:test_riverpod/core/workers/isolate_worker.dart';

void main() {
  test('FlutterIsolateWorker runs a compute callback', () async {
    const worker = FlutterIsolateWorker();

    await expectLater(worker.run(_double, 21), completion(42));
  });
}

int _double(int value) {
  return value * 2;
}
