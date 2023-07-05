import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/product_detail/domain/entities/product_detail_response.dart';
import 'package:baash/features/product_detail/domain/use_cases/add_to_cart_detail_page.dart';
import 'package:baash/features/product_detail/domain/use_cases/get_product_detail.dart';
import 'package:baash/features/shopping_cart/domain/entities/add_to_cart_response.dart';
import 'package:baash/features/user_profile/domain/entities/user_profile_response.dart';
import 'package:baash/features/user_profile/domain/use_cases/get_user_profile.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_detail_event.dart';

part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetUserProfile getUserProfile;
  final GetProductDetail getProductDetail;
  final AddToCartDetailPageUseCase addToCartDetailPage;

  ProductDetailBloc({
    required this.getUserProfile,
    required this.getProductDetail,
    required this.addToCartDetailPage,
  }) : super(Empty()) {
    on<GetUserProfileEvent>((event, emit) async {
      emit(Empty());
      emit(GetUserProfileLoading());
      final either = await getUserProfile(NoParams());
      either.fold((l) {
        // GetProductDetailLoading(l, emit);
      }, (r) {
        emit(
          ///we can use data from 'r'
          UserProfileReceived(userProfile: r),
        );
      });
    });

    on<GetProductDetailEvent>((event, emit) async {
      emit(Empty());
      emit(GetProductDetailLoading());
      final either = await getProductDetail(event.id);
      either.fold((l) {
        handleFailure(l, emit);
      }, (r) {
        emit(
          ///we can use data from 'r'
          ProductDetailReceived(allProducts: r),
        );
      });
    });
    //***************************************************
    on<AddToCartDetailPageEvent>((event, emit) async {
      emit(Empty());
      emit(AddToCartDetailPageLoading());
      final either = await addToCartDetailPage(event.id);
      either.fold((l) {
        handleFailureAdd(l, emit);
      }, (r) {
        emit(
          ///we can use data from 'r'
          AddedToCartDetailPage(addProductToCart: r),
        );
      });
    });
  }

  void handleFailure(Failure failure, emit) {
    switch (failure.runtimeType) {
      case ApiFailure:
        emit(
          GetProductDetailError(
            message: (failure as ApiFailure).message,
          ),
        );
        break;
      case ServerFailure:
        emit(
          GetProductDetailError(
            message: (failure as ServerFailure).message,
          ),
        );
        break;
      case InternetFailure:
        emit(
          GetProductDetailError(
            message: (failure as InternetFailure).message,
          ),
        );
        break;
    }
  }

  void handleFailureAdd(Failure failure, emit) {
    switch (failure.runtimeType) {
      case ApiFailure:
        emit(
          AddToCartDetailPageError(
            message: (failure as ApiFailure).message,
          ),
        );
        break;
      case ServerFailure:
        emit(
          AddToCartDetailPageError(
            message: (failure as ServerFailure).message,
          ),
        );
        break;
      case InternetFailure:
        emit(
          AddToCartDetailPageError(
            message: (failure as InternetFailure).message,
          ),
        );
        break;
    }
  }
}
