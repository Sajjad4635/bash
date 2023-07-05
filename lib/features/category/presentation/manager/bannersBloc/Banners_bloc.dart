import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/home/domain/entities/banners_response.dart';
import 'package:baash/features/home/domain/entities/category_list_response.dart';
import 'package:baash/features/home/domain/use_cases/get_all_products.dart';
import 'package:baash/features/home/domain/use_cases/get_banners.dart';
import 'package:baash/features/home/domain/use_cases/get_category_list.dart';
import 'package:baash/features/home/domain/use_cases/params/get_all_products_params.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baash/core/error/failures.dart';
import 'package:baash/features/home/domain/entities/all_products_response.dart';

part 'Banners_event.dart';

part 'banners_state.dart';

class BannersBloc extends Bloc<BannersEvent, BannersState> {
  final GetBanners getBanners;

  BannersBloc({
    required this.getBanners,
  }) : super(Empty()) {
    on<GetBannersEvent>((event, emit) async {
      emit(Empty());
      emit(GetBannersLoading());
      final either = await getBanners(NoParams());
      either.fold((l) {
        handleFailure(l, emit);
      }, (r) {
        emit(
          ///we can use data from 'r'
          BannersReceived(banners: r),
        );
      });
    });
  }

  void handleFailure(Failure failure, emit) {
    switch (failure.runtimeType) {
      case ApiFailure:
        emit(
          GetBannersError(
            message: (failure as ApiFailure).message,
          ),
        );
        break;
      case ServerFailure:
        emit(
          GetBannersError(
            message: (failure as ServerFailure).message,
          ),
        );
        break;
      case InternetFailure:
        emit(
          GetBannersError(
            message: (failure as InternetFailure).message,
          ),
        );
        break;
    }
  }
}
