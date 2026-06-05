import 'package:flutter/foundation.dart';

abstract interface class IsolateWorker {
  Future<Result> run<Message, Result>(
    ComputeCallback<Message, Result> callback,
    Message message,
  );
}

final class FlutterIsolateWorker implements IsolateWorker {
  const FlutterIsolateWorker();

  @override
  Future<Result> run<Message, Result>(
    ComputeCallback<Message, Result> callback,
    Message message,
  ) {
    return compute(callback, message);
  }
}
