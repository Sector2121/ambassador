import 'dart:async';
import 'package:equatable/equatable.dart';

import 'package:ambassador/index.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final EmailInteractor emailInteractor;

  EmailBloc({required this.emailInteractor}) : super(EmailInitial()) {
    on<EmailSentEvent>((event, emit) async {
      emit(EmailLoadingState());
      try {
        final answer = await emailInteractor.checkEmailValid(event.email);
        if(answer) {
          emit(EmailLoadedState());
        }
      } catch (e) {
        emit(EmailErrorState());
      }
    });
  }
}
