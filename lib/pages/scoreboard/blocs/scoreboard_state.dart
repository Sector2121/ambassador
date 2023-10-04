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
  @override
  List<Object?> get props => [];
}

class ScoreboardErrorState extends ScoreboardState {
  @override
  List<Object?> get props => [];
}