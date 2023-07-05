import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/home/domain/entities/category_list_response.dart';
import 'package:baash/features/home/domain/use_cases/get_all_products.dart';
import 'package:baash/features/home/domain/use_cases/get_category_list.dart';
import 'package:baash/features/home/domain/use_cases/params/get_all_products_params.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baash/core/error/failures.dart';
import 'package:baash/features/home/domain/entities/all_products_response.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoryList getCategoryList;

  CategoryBloc({
    required this.getCategoryList,
  }) : super(Empty()) {
    on<GetCategoryListEvent>((event, emit) async {
      emit(Empty());
      emit(GetCategoryListLoading());
      final either = await getCategoryList(NoParams());
      either.fold((l) {
        handleFailure(l, emit);
      }, (r) {
        emit(
          ///we can use data from 'r'
          CategoryListReceived(categoryList: r),
        );
      });
    });
  }

  void handleFailure(Failure failure, emit) {
    switch (failure.runtimeType) {
      case ApiFailure:
        emit(
          GetCategoryListError(
            message: (failure as ApiFailure).message,
          ),
        );
        break;
      case ServerFailure:
        emit(
          GetCategoryListError(
            message: (failure as ServerFailure).message,
          ),
        );
        break;
      case InternetFailure:
        emit(
          GetCategoryListError(
            message: (failure as InternetFailure).message,
          ),
        );
        break;
    }
  }
}
