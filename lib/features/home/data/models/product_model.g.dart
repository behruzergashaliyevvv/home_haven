// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      products: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductModelData.fromJson(e as Map<String, dynamic>))
          .toList(),
      paginationModel: json['pagination'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'data': instance.products,
      'pagination': instance.paginationModel,
    };

ProductModelData _$ProductModelDataFromJson(Map<String, dynamic> json) =>
    ProductModelData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      shortDescription: json['short_description'] as String?,
      icon: json['icon'] as String?,
      image: json['image'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      colors: (json['colors'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductModelDataToJson(ProductModelData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'short_description': instance.shortDescription,
      'icon': instance.icon,
      'image': instance.image,
      'price': instance.price,
      'rating': instance.rating,
      'colors': instance.colors,
    };

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    PaginationModel(
      totalRecords: (json['total_records'] as num?)?.toInt(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      nextPage: json['next_page'],
      prevPage: json['prev_page'],
    );

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'total_records': instance.totalRecords,
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
      'next_page': instance.nextPage,
      'prev_page': instance.prevPage,
    };
