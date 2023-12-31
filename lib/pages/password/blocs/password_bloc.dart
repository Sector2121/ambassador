import 'package:equatable/equatable.dart';
import 'package:ambassador/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final PasswordInteractor passwordInteractor;

  PasswordBloc({required this.passwordInteractor}) : super(PasswordInitialState()) {
    on<PasswordSentEvent>((event, emit) async {
      emit(PasswordLoadingState());
      try {
        final answer = await passwordInteractor.tryLogin(event.password);
        if (answer.statusOk) {
          emit(PasswordLoadedState());
        } else {
          if(answer.message != null) {
            emit(PasswordWrongState(answer.message!));
          }
          emit(PasswordInitialState());
        }
      } catch (e) {
        emit(PasswordErrorState());
      }
    });
  }
}
