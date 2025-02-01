import 'package:dars_3/features/home/domain/entities/banner_entity.dart';

class ProductEntity {
  final List<ProductData>? data;
  final Pagination? pagination;

  ProductEntity({
    this.data,
    this.pagination,
  });
}

class ProductData {
  final String? id;
  final String? name;
  final String? shortDescription;
  final String? icon;
  final String? image;
  final double? price;
  final double? rating;
  final double? colors;
  
  ProductData({
    this.id,
    this.name,
    this.shortDescription,
    this.icon,
    this.image,
    this.price,
    this.rating,
    this.colors,
  });
}
class Pagination {
  final int? totalRecords;
  final int? currentPage;
  final int? totalPages;
  final dynamic nextPage;
  final dynamic prevPage;

  Pagination({
    this.totalRecords,
    this.currentPage,
    this.totalPages,
    this.nextPage,
    this.prevPage,
  });
}