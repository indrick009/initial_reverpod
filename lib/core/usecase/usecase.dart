abstract interface class UseCase<Output, Input> {
  Future<Output> call(Input input);
}

abstract interface class SyncUseCase<Output, Input> {
  Output call(Input input);
}

final class NoParams {
  const NoParams();
}
