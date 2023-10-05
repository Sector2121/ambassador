import 'package:ambassador/index.dart';

class LeaderboardInteractor {
  final AmbassadorApi ambassadorApi;

  LeaderboardInteractor({required this.ambassadorApi});

  Future<List<Score>> getScoreboard() async {
    List<Score> scores = [];
    final scoreboard = await ambassadorApi.getScoreboard();

    for (var element in scoreboard) {
      scores.add(Score(name: element['name'], userCount: element['user_count']));
    }

    scores.sort((a, b) => b.userCount.compareTo(a.userCount));

    return scores;
  }
}