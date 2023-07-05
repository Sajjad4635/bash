import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/shopping_cart/data/models/payment_response_model.dart';
import 'package:baash/features/shopping_cart/domain/entities/add_to_cart_response.dart';
import 'package:baash/features/shopping_cart/domain/entities/get_cart_response.dart';
import 'package:baash/features/shopping_cart/domain/entities/payment_response.dart';
import 'package:baash/features/shopping_cart/domain/use_cases/add_to_cart.dart';
import 'package:baash/features/shopping_cart/domain/use_cases/create_payment_usecase.dart';
import 'package:baash/features/shopping_cart/domain/use_cases/delete_from_cart.dart';
import 'package:baash/features/shopping_cart/domain/use_cases/get_cart.dart';
import 'package:baash/features/shopping_cart/domain/use_cases/params/payment_params.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baash/core/error/failures.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUseCase getCart;
  final AddToCartUseCase addToCart;
  final DeleteFromCartUseCase deleteFromCart;
  final CreatePaymentUseCase createPayment;

  CartBloc({
    required this.getCart,
    required this.addToCart,
    required this.deleteFromCart,
    required this.createPayment,
  }) : super(Empty()) {
    on<GetCartEvent>((event, emit) async {
      emit(Empty());
      emit(GetCartLoading());
      final either = await getCart(NoParams());
      either.fold((l) {
        handleFailure(l, emit);
      }, (r) {
        emit(
          ///we can use data from 'r'
          CartReceived(cartResponse: r),
        );
      });
    });
    //****************************
    on<AddToCartEvent>((event, emit) async {
      emit(Empty());
      emit(AddToCartLoading());
      final either = await addToCart(event.id);
      either.fold((l) {
        handleFailureAdd(l, emit);
      }, (r) {
        emit(
          ///we can use data from 'r'
          AddedToCart(addProductToCart: r),
        );
      });
    });
    //****************************
    on<DeleteFromCartEvent>((event, emit) async {
      emit(Empty());
      emit(DeleteFromCartLoading());
      final either = await deleteFromCart(event.id);
      either.fold((l) {
        handleFailureDelete(l, emit);
      }, (r) {
        emit(
          ///we can use data from 'r'
          DeletedFromCart(status: r),
        );
      });
    });

    //****************************
    on<CreatePaymentEvent>((event, emit) async {
      emit(Empty());
      emit(CreatePaymentLoading());
      final either = await createPayment(event.params);
      either.fold((l) {
        handleFailurePayment(l, emit);
      }, (r) {
        emit(
          ///we can use data from 'r'
          PaymentCreated(payment: r),
        );
      });
    });
  }

  void handleFailure(Failure failure, emit) {
    switch (failure.runtimeType) {
      case ApiFailure:
        emit(
          GetCartError(
            message: (failure as ApiFailure).message,
          ),
        );
        break;
      case ServerFailure:
        emit(
          GetCartError(
            message: (failure as ServerFailure).message,
          ),
        );
        break;
      case InternetFailure:
        emit(
          GetCartError(
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
          AddToCartError(
            message: (failure as ApiFailure).message,
          ),
        );
        break;
      case ServerFailure:
        emit(
          AddToCartError(
            message: (failure as ServerFailure).message,
          ),
        );
        break;
      case InternetFailure:
        emit(
          AddToCartError(
            message: (failure as InternetFailure).message,
          ),
        );
        break;
    }
  }

  void handleFailureDelete(Failure failure, emit) {
    switch (failure.runtimeType) {
      case ApiFailure:
        emit(
          DeleteFromCartError(
            message: (failure as ApiFailure).message,
          ),
        );
        break;
      case ServerFailure:
        emit(
          DeleteFromCartError(
            message: (failure as ServerFailure).message,
          ),
        );
        break;
      case InternetFailure:
        emit(
          DeleteFromCartError(
            message: (failure as InternetFailure).message,
          ),
        );
        break;
    }
  }

  void handleFailurePayment(Failure failure, emit) {
    switch (failure.runtimeType) {
      case ApiFailure:
        emit(
          CreatePaymentError(
            message: (failure as ApiFailure).message,
          ),
        );
        break;
      case ServerFailure:
        emit(
          CreatePaymentError(
            message: (failure as ServerFailure).message,
          ),
        );
        break;
      case InternetFailure:
        emit(
          CreatePaymentError(
            message: (failure as InternetFailure).message,
          ),
        );
        break;
    }
  }
}
