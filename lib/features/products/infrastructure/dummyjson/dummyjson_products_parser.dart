import '../../domain/entities/product.dart';
import '../../domain/failures/product_failure.dart';
import 'dummyjson_product_dto.dart';

List<Product> parseDummyJsonProducts(Map<String, Object?> payload) {
  final rawProducts = payload['products'];

  if (rawProducts is! List<Object?>) {
    throw const ProductParsingFailure('Products payload is invalid.');
  }

  return rawProducts
      .whereType<Map<String, Object?>>()
      .map(DummyJsonProductDto.fromJson)
      .map((product) => product.toDomain())
      .toList(growable: false);
}
