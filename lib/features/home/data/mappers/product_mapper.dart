import 'package:dars_3/features/home/data/models/banner_model.dart' as banner;
import 'package:dars_3/features/home/data/models/product_model.dart' as product;
import 'package:dars_3/features/home/domain/entities/banner_entity.dart';
import 'package:dars_3/features/home/domain/entities/product_entity.dart';

class ProductMapper {
  static ProductEntity mapProductEntity(product.ProductModel? model) {
    return ProductEntity(
      products: model?.products
          ?.map(
            (e) => mapProductData(e),
          )
          .toList(),
      pagination: mapPaginationData(model?.paginationModel),
    );
  }

  // Product data
  static ProductData mapProductData(product.ProductModelData model) {
    return ProductData(
      id: model.id,
      title: model.title,
      category: model.category,
      shortDescription: model.shortDescription,
      image: model.image,
      date: model.date,
    );
  }

  static Pagination mapPaginationData(product.PaginationModel? model) {
    return Pagination(
      currentPage: model?.currentPage,
      nextPage: model?.nextPage,
      prevPage: model?.prevPage,
      totalPages: model?.totalPages,
      totalRecords: model?.totalRecords,
    );
  }
}
