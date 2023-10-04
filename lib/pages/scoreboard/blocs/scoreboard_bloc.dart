import 'dart:async';
import 'package:ambassador/index.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'scoreboard_event.dart';
part 'scoreboard_state.dart';

class ScoreboardBloc extends Bloc<ScoreboardEvent, ScoreboardState> {
  final ScoreboardInteractor scoreboardInteractor;

  ScoreboardBloc({required this.scoreboardInteractor}) : super(ScoreboardInitialState()) {
    on<GetScoreboardEvent>((event, emit) async {
      emit(ScoreboardLoadingState());
      try {
        final answer = await scoreboardInteractor.getScoreboard();
        if (answer) {
          emit(ScoreboardLoadedState());
        } else {
          emit(ScoreboardInitialState());
        }
      } catch (e) {
        emit(ScoreboardErrorState());
      }
    });
  }
}
