import 'package:equatable/equatable.dart';

import 'package:ambassador/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final EmailInteractor emailInteractor;

  EmailBloc({required this.emailInteractor}) : super(EmailInitialState()) {
    on<EmailSentEvent>((event, emit) async {
      emit(EmailLoadingState());
      try {
        final answer = await emailInteractor.checkEmailValid(event.email);
        if(answer) {
          emit(EmailLoadedState());
        } else {
          emit(EmailInitialState());
        }
      } catch (e) {
        emit(EmailErrorState());
      }
    });
    on<Reset>((event, emit) async {
      emit(EmailInitialState());
    });
  }
}
