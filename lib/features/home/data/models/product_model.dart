import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: "data")
  final List<ProductModelData>? products;
  @JsonKey(name: "pagination")
  final PaginationModel? paginationModel;

  ProductModel({
    this.products,
    this.paginationModel,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ProductModelData {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "short_description")
  final String? shortDescription;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "price")
  final double? price;
  @JsonKey(name: "rating")
  final double? rating;
  @JsonKey(name: "colors")
  final double? colors;

  ProductModelData({
    this.id,
    this.name,
    this.shortDescription,
    this.icon,
    this.image,
    this.price,
    this.rating,
    this.colors,
  });

  factory ProductModelData.fromJson(Map<String, dynamic> json) =>
      _$ProductModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelDataToJson(this);
}

@JsonSerializable()
class PaginationModel {
  @JsonKey(name: "total_records")
  final int? totalRecords;
  @JsonKey(name: "current_page")
  final int? currentPage;
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @JsonKey(name: "next_page")
  final dynamic nextPage;
  @JsonKey(name: "prev_page")
  final dynamic prevPage;

  PaginationModel({
    this.totalRecords,
    this.currentPage,
    this.totalPages,
    this.nextPage,
    this.prevPage,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);
}
