import 'package:dars_3/features/home/domain/entities/banner_entity.dart';

class ProductEntity {
  final List<ProductData>? data; // TO‘G‘RILANDI!
  final Pagination? pagination;

  ProductEntity({
    this.data,
    this.pagination, List<ProductData>? products,
  });
}

class ProductData {
  final String? id;
  final String? title;
  final String? category;
  final String? shortDescription;
  final String? image;
  final double? discountPrice; // YANGI MAYDON!
  final double? originalPrice; // YANGI MAYDON!
  final double? rating; // YANGI MAYDON!
  
  ProductData({
    this.id,
    this.title,
    this.category,
    this.shortDescription,
    this.image,
    this.discountPrice,
    this.originalPrice,
    this.rating, String? date,
  });
}
