import '../../../core/usecase/usecase.dart';
import '../domain/entities/product.dart';
import '../domain/repositories/product_repository.dart';

final class GetProductsUseCase implements UseCase<List<Product>, NoParams> {
  const GetProductsUseCase({required ProductRepository repository})
    : _repository = repository;

  final ProductRepository _repository;

  @override
  Future<List<Product>> call(NoParams input) {
    return _repository.getProducts();
  }
}
