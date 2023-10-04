import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:ambassador/index.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'password_event.dart';

part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final PasswordInteractor passwordInteractor;

  PasswordBloc({required this.passwordInteractor}) : super(PasswordInitialState()) {
    on<PasswordSentEvent>((event, emit) async {
      emit(PasswordLoadingState());
      try {
        final answer = await passwordInteractor.tryLogin(event.password);
        if (answer) {
          emit(PasswordLoadedState());
        } else {
          emit(PasswordInitialState());
        }
      } catch (e) {
        emit(PasswordErrorState());
      }
    });
  }
}
