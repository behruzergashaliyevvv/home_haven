import 'package:dars_3/features/home/data/models/product_model.dart';
import 'package:dars_3/features/home/domain/entities/product_entity.dart';


class ProductMapper {
  static ProductEntiti mapProductEntiti(ProductModel? model) {
    return ProductEntiti(
      data: model?.data
          ?.map(
            (e) => mapProductData(e),
          )
          .toList(),
      pagination: mapProductPaginationData(model?.pagination),
    );
  }

  static ProductData mapProductData(ProductModelData model) {
    return ProductData(
      category: model.category,
      id: model.id,
      image: model.image,
      shortDescription: model.shortDescription,
      description: model.description,
      discount: model.discount,
      icon: model.icon,
      name: model.name,
      price: model.price,
      quintity: model.quintity,
      rating: model.rating,
      ratingCount: model.ratingCount,
      // colors: model.colors,
      // size: model.size,
    );
  }

  static mapProductPaginationData(ProductPaginationModel? model) {
    return Pagination(
      currentPage: model!.currentPage,
      nextPage: model.nextPage,
      prevPage: model.prevPage,
      totalPages: model.totalPages,
      totalRecords: model.totalRecords,
    );
  }
}
