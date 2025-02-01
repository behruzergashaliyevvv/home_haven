import 'package:dars_3/features/home/data/models/product_model.dart' as product;
import 'package:dars_3/features/home/data/models/product_model.dart';
import 'package:dars_3/features/home/domain/entities/product_entity.dart';

class ProductMapper {
  static ProductEntity mapProductEntity(ProductModel? model) {
    return ProductEntity(
      data: model?.data
          ?.map(
            (e) => mapProductData(e),
          )
          .toList(),
      pagination: mapPaginationData(model?.paginationModel),
    );
  }

  static ProductData mapProductData(ProductModelData model) {
    return ProductData(
      id: model.id,
      name: model.name,
      shortDescription: model.shortDescription,
      icon: model.icon,
      image: model.image,
      price: model.price,
      rating: model.rating
    );
  }

  static Pagination mapPaginationData(PaginationModel? model) {
    return Pagination(
      currentPage: model?.currentPage,
      nextPage: model?.nextPage,
      prevPage: model?.prevPage,
      totalPages: model?.totalPages,
      totalRecords: model?.totalRecords,
    );
  }
}
