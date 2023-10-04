part of 'scoreboard_bloc.dart';

@immutable
abstract class ScoreboardState extends Equatable {}

class ScoreboardInitialState extends ScoreboardState {
  @override
  List<Object?> get props => [];
}

class ScoreboardLoadingState extends ScoreboardState {
  @override
  List<Object?> get props => [];
}

class ScoreboardLoadedState extends ScoreboardState {
  final List<Score> scores;

  ScoreboardLoadedState(this.scores);

  @override
  List<Object?> get props => [scores];
}

class ScoreboardErrorState extends ScoreboardState {
  @override
  List<Object?> get props => [];
}