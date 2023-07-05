import 'dart:convert';

import 'package:baash/core/local_storage/preferences/pref.dart';
import 'package:baash/core/local_storage/preferences/pref_keys.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baash/core/error/failures.dart';
import 'package:baash/core/local_storage/local_data.dart';
import 'package:baash/features/login/data/models/verify_code_response_model.dart';
import 'package:baash/features/login/domain/entities/verify_code_response.dart';
import 'package:baash/features/login/domain/use_cases/params/send_number_params.dart';
import 'package:baash/features/login/domain/use_cases/params/verify_code_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constants/string_consts.dart';
import '../../../../../core/network/token_handler.dart';
import '../../../../../injection.dart';
import '../../../domain/use_cases/send_number.dart';
import '../../../domain/use_cases/verify_code.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SendNumber sendNumber;

  final VerifyCode verifyCode;

  LoginBloc({required this.sendNumber, required this.verifyCode}) : super(Empty()) {
    on<LoginEvent>((event, emit) async {
      emit(Empty());
      if (event is LoginSendNumber) {
        emit(Loading());
        final either = await sendNumber(SendNumberParams(number: event.number));
        either.fold((l) {
          handleFailure(l, emit);
        }, (r) {
          emit(
            ///we can use data from 'r'
            NumberSent(number: event.number),
          );
        });
      } else if (event is LoginSendCode) {
        emit(SendCodeLoading());
        //TODO: we should take care of String code before send here as event
        final either = await verifyCode(VerifyCodeParams(number: event.number, code: event.code));
        either.fold((l) {
          handleFailure(l, emit);
        }, (r) async {
          ///save data to local data
          if (!r.success) {
            emit(Error(message: SERVER_ERROR));
          } else {
            emit(
              CodeSent(verifyCodeResponse: r),
            );
            await Pref.set('token', 'jwt ${r.message.token}');
          }
        });
      }
    });
  }

  void handleFailure(Failure failure, emit) {
    switch (failure.runtimeType) {
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
          Error(
            message: (failure as InternetFailure).message,
          ),
        );
        break;
    }
  }
}
