import 'package:ambassador/index.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  final LeaderboardInteractor leaderboardInteractor;

  LeaderboardBloc({required this.leaderboardInteractor}) : super(LeaderboardInitialState()) {
    on<GetLeaderboardEvent>((event, emit) async {
      emit(LeaderboardLoadingState());
      try {
        final scores = await leaderboardInteractor.getScoreboard();
        if (scores.isNotEmpty) {
          emit(LeaderboardLoadedState(scores));
        } else {
          emit(LeaderboardInitialState());
        }
      } catch (e) {
        emit(LeaderboardErrorState());
      }
    });
  }
}
