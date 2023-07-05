import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/home/domain/entities/banners_response.dart';
import 'package:baash/features/home/domain/entities/category_list_response.dart';
import 'package:baash/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetBanners implements UseCase<BannersResponse, NoParams> {
  final HomeRepository repository;

  GetBanners(this.repository);

  @override
  Future<Either<Failure, BannersResponse>> call(NoParams params) async {
    return await repository.getBanners();
  }
}
