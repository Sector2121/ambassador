part of 'leaderboard_bloc.dart';

@immutable
abstract class LeaderboardState extends Equatable {}

class LeaderboardInitialState extends LeaderboardState {
  @override
  List<Object?> get props => [];
}

class LeaderboardLoadingState extends LeaderboardState {
  @override
  List<Object?> get props => [];
}

class LeaderboardLoadedState extends LeaderboardState {
  final List<Score> scores;

 LeaderboardLoadedState(this.scores);

  @override
  List<Object?> get props => [scores];
}

class LeaderboardErrorState extends LeaderboardState {
  @override
  List<Object?> get props => [];
}