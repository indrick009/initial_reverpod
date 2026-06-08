import 'dart:convert';

import '../../domain/entities/product.dart';
import '../../domain/failures/product_failure.dart';
import 'dummyjson_product_dto.dart';

List<Product> parseDummyJsonProductsJson(String payload) {
  final decoded = jsonDecode(payload);

  if (decoded is! Map) {
    throw const ProductParsingFailure('Products payload is invalid.');
  }

  return parseDummyJsonProducts(_stringKeyedMap(decoded));
}

List<Product> parseDummyJsonProducts(Map<String, Object?> payload) {
  final rawProducts = payload['products'];

  if (rawProducts is! List) {
    throw const ProductParsingFailure('Products payload is invalid.');
  }

  return rawProducts
      .whereType<Map>()
      .map(_stringKeyedMap)
      .map(DummyJsonProductDto.fromJson)
      .map((product) => product.toDomain())
      .toList(growable: false);
}

Map<String, Object?> _stringKeyedMap(Map<dynamic, dynamic> map) {
  return map.map((key, value) => MapEntry(key.toString(), value));
}
