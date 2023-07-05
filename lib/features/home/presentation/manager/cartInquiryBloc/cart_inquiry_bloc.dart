import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/home/domain/entities/banners_response.dart';
import 'package:baash/features/home/domain/entities/cart_inquiry_response.dart';
import 'package:baash/features/home/domain/entities/category_list_response.dart';
import 'package:baash/features/home/domain/use_cases/cart_inquiry.dart';
import 'package:baash/features/home/domain/use_cases/get_all_products.dart';
import 'package:baash/features/home/domain/use_cases/get_banners.dart';
import 'package:baash/features/home/domain/use_cases/get_category_list.dart';
import 'package:baash/features/home/domain/use_cases/params/get_all_products_params.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baash/core/error/failures.dart';
import 'package:baash/features/home/domain/entities/all_products_response.dart';

part 'cart_inquiry_event.dart';

part 'cart_inquiry_state.dart';

class cartInquiryBloc extends Bloc<cartInquirysEvent, cartInquiryState> {
  final CartInquiryUseCase cartInquiryUseCase;

  cartInquiryBloc({
    required this.cartInquiryUseCase,
  }) : super(Empty()) {
    on<GetCartInquiryEvent>((event, emit) async {
      emit(Empty());
      emit(GetCartInquiryLoading());
      final either = await cartInquiryUseCase(NoParams());
      either.fold((l) {
        handleFailure(l, emit);
      }, (r) {
        emit(
          ///we can use data from 'r'
          CartInquiryReceived(cartInquiry: r),
        );
      });
    });
  }

  void handleFailure(Failure failure, emit) {
    switch (failure.runtimeType) {
      case ApiFailure:
        emit(
          GetCartInquiryError(
            message: (failure as ApiFailure).message,
          ),
        );
        break;
      case ServerFailure:
        emit(
          GetCartInquiryError(
            message: (failure as ServerFailure).message,
          ),
        );
        break;
      case InternetFailure:
        emit(
          GetCartInquiryError(
            message: (failure as InternetFailure).message,
          ),
        );
        break;
    }
  }
}
