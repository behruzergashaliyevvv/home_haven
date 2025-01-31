import 'package:dars_3/features/home/domain/entities/banner_entity.dart';

class ProductModel {
  final List<ProductModelData>? products;
  final PaginationModel? paginationModel;

  ProductModel({
    this.products,
    this.paginationModel,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      products: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductModelData.fromJson(e))
          .toList(),
      paginationModel: PaginationModel.fromJson(json['pagination']),
    );
  }
}

class ProductModelData {
  final String? id;
  final String? title;
  final String? category;
  final String? shortDescription;
  final String? image;
  final String? date;

  ProductModelData({
    this.id,
    this.title,
    this.category,
    this.shortDescription,
    this.image,
    this.date,
  });

  factory ProductModelData.fromJson(Map<String, dynamic> json) {
    return ProductModelData(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      shortDescription: json['short_description'],
      image: json['image'],
      date: json['date'],
    );
  }
}

class PaginationModel {
  final int? totalRecords;
  final int? currentPage;
  final int? totalPages;
  final dynamic nextPage;
  final dynamic prevPage;

  PaginationModel({
    this.totalRecords,
    this.currentPage,
    this.totalPages,
    this.nextPage,
    this.prevPage,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      totalRecords: json['total_records'],
      currentPage: json['current_page'],
      totalPages: json['total_pages'],
      nextPage: json['next_page'],
      prevPage: json['prev_page'],
    );
  }
}
