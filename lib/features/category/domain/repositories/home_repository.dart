import 'package:baash/features/home/domain/entities/banners_response.dart';
import 'package:baash/features/home/domain/entities/category_list_response.dart';
import 'package:baash/features/home/domain/use_cases/params/get_all_products_params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/all_products_response.dart';

abstract class HomeRepository {
  Future<Either<Failure, BannersResponse>> getBanners();

  Future<Either<Failure, AllProductsResponse>> getAllProducts(AllProductsParams params);

  Future<Either<Failure, CategoryListResponse>> getCategoryList();
}
