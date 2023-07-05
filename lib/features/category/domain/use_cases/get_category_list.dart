import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/home/domain/entities/category_list_response.dart';
import 'package:baash/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetCategoryList implements UseCase<CategoryListResponse, NoParams> {
  final HomeRepository repository;

  GetCategoryList(this.repository);

  @override
  Future<Either<Failure, CategoryListResponse>> call(NoParams params) async {
    return await repository.getCategoryList();
  }
}
