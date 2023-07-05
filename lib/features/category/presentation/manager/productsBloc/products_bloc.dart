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

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetAllProducts getAllProducts;

  ProductsBloc({
    required this.getAllProducts,
  }) : super(Empty()) {
    on<GetAllProductsEvent>((event, emit) async {
      emit(Empty());
      emit(GetAllProductsLoading());
      final either = await getAllProducts(event.params);
      either.fold((l) {
        handleFailure(l, emit);
      }, (r) {
        emit(
          ///we can use data from 'r'
          AllProductsReceived(allProducts: r),
        );
      });
    });
  }

  void handleFailure(Failure failure, emit) {
    switch (failure.runtimeType) {
      case ApiFailure:
        emit(
          GetAllProductsError(
            message: (failure as ApiFailure).message,
          ),
        );
        break;
      case ServerFailure:
        emit(
          GetAllProductsError(
            message: (failure as ServerFailure).message,
          ),
        );
        break;
      case InternetFailure:
        emit(
          GetAllProductsError(
            message: (failure as InternetFailure).message,
          ),
        );
        break;
    }
  }
}
