import 'package:baash/core/local_storage/preferences/pref.dart';
import 'package:baash/core/network/token_handler.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/splash/domain/use_cases/get_token.dart';
import 'package:baash/injection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetToken getToken;

  SplashBloc({required this.getToken}) : super(const Empty()) {
    on<GetLocalDataEvent>((event, emit) async {
      var accessToken = await Pref.get('token');
      if (accessToken != null && accessToken != '') {
        print(accessToken);
        emit(const HomeScreenState());
      } else {
        emit(const LoginScreenState());
      }
      // final either = await getToken.call(NoParams());
      // await either.fold((l) {
      //   print('111111');
      //   if (l is DataFailure) {
      //     emit(const LoginScreenState());
      //   } else {
      //     handleFailure(l, emit);
      //   }
      // }, (r) async {
      //   // print('2222222');
      //   // if(r == ''){
      //   //   print('33333333');
      //   //   emit(const LoginScreenState());
      //   // }else{
      //     print('4444444444');
      //     serviceLocator
      //         .registerLazySingleton(() => TokenClass(token: r));
      //     print(r);
      //     emit(const HomeScreenState());
      //   // }
      //
      //   //
      //   // if (serviceLocator<TokenClass>().token != '') {
      //   // } else {
      //   //   emit(const LoginScreenState());
      //   // }
      // });
    });
  }

  void handleFailure(Failure failure, emit) {
    switch (failure.runtimeType) {
      case DataFailure:
        emit(
          Error(
            message: (failure as DataFailure).message,
          ),
        );
        break;
      case ApiFailure:
        emit(
          Error(
            message: (failure as ApiFailure).message,
          ),
        );
        break;
      case ServerFailure:
        emit(
          Error(
            message: (failure as ServerFailure).message,
          ),
        );
        break;
      case InternetFailure:
        emit(
          const ErrorInternet(),
        );
        break;
      default:
        emit(
          const Error(
            message: 'Fatal Error!',
          ),
        );
    }
  }
}
