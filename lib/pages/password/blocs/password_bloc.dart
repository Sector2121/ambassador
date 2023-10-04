import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:ambassador/index.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final PasswordInteractor passwordInteractor;

  PasswordBloc({required this.passwordInteractor}) : super(PasswordInitial()) {
    on<PasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
