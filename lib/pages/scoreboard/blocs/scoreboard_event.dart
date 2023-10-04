part of 'scoreboard_bloc.dart';

@immutable
abstract class ScoreboardEvent extends Equatable {}

class GetScoreboardEvent extends ScoreboardEvent {
  @override
  List<Object?> get props => [];
}
