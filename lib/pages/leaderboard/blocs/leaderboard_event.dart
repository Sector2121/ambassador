part of 'leaderboard_bloc.dart';

@immutable
abstract class LeaderboardEvent extends Equatable {}

class GetLeaderboardEvent extends LeaderboardEvent {
  @override
  List<Object?> get props => [];
}