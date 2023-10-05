import 'dart:async';
import 'package:ambassador/index.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'scoreboard_event.dart';
part 'scoreboard_state.dart';

class ScoreboardBloc extends Bloc<ScoreboardEvent, ScoreboardState> {
  final LeaderboardInteractor scoreboardInteractor;

  ScoreboardBloc({required this.scoreboardInteractor}) : super(ScoreboardInitialState()) {
    on<GetScoreboardEvent>((event, emit) async {
      emit(ScoreboardLoadingState());
      try {
        final scores = await scoreboardInteractor.getScoreboard();
        if (scores.isNotEmpty) {
          emit(ScoreboardLoadedState(scores));
        } else {
          emit(ScoreboardInitialState());
        }
      } catch (e) {
        emit(ScoreboardErrorState());
      }
    });
  }
}
