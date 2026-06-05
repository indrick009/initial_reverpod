import '../../domain/entities/product.dart';
import '../../domain/failures/product_failure.dart';

final class DummyJsonProductDto {
  const DummyJsonProductDto({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.stock,
    required this.thumbnail,
  });

  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double rating;
  final int stock;
  final String thumbnail;

  factory DummyJsonProductDto.fromJson(Map<String, Object?> json) {
    try {
      return DummyJsonProductDto(
        id: json['id']! as int,
        title: json['title']! as String,
        description: json['description']! as String,
        category: json['category']! as String,
        price: (json['price']! as num).toDouble(),
        rating: (json['rating']! as num).toDouble(),
        stock: json['stock']! as int,
        thumbnail: json['thumbnail']! as String,
      );
    } catch (error, stackTrace) {
      throw ProductParsingFailure(
        'Unable to parse product payload.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  Product toDomain() {
    return Product(
      id: id,
      title: title,
      description: description,
      category: category,
      price: price,
      rating: rating,
      stock: stock,
      thumbnail: Uri.parse(thumbnail),
    );
  }
}
